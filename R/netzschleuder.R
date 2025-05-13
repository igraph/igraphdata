#' @keywords internal
.pkg_env <- new.env(parent = emptyenv())

get_base_req <- function() {
  if (!exists("base_req", envir = .pkg_env, inherits = FALSE)) {
    base_req <- httr2::request("https://networks.skewed.de") |>
      httr2::req_throttle(capacity = 20, fill_time_s = 60) |>
      httr2::req_user_agent(
        "R package igraphdata (github.com/igraph/igraphdata)"
      )
    .pkg_env$base_req <- base_req
  }
  .pkg_env$base_req
}

make_request <- function(path, token = NULL, method = "GET") {
  rlang::check_installed("httr2")
  req <- httr2::req_url_path(get_base_req(), path)
  req <- httr2::req_method(req, method)
  if (method == "HEAD") {
    req <- httr2::req_headers(req, `Accept-Encoding` = "identity")
  }
  if (!is.null(token)) {
    req <- httr2::req_headers(req, `WWW-Authenticate` = token)
  }

  resp <- httr2::req_perform(req)

  if (httr2::resp_status(resp) != 200) {
    stop("Failed to download file. Status: ", httr2::resp_status(resp))
  }

  resp
}

resolve_name <- function(x) {
  #remove trailing /
  x <- sub("/$", "", x)
  #remove double slash
  x <- sub("//", "/", x)

  if (grepl("/", x)) {
    x_split <- strsplit(x, "/", fixed = TRUE)[[1]]
    if (length(x_split) > 2) {
      cli::cli_abort(
        "{.arg name} has {length(x_split)} components instead of 2."
      )
    }
    return(x_split)
  } else {
    c(x, x)
  }
}

download_file <- function(zip_url, token = NULL, file, size_limit) {
  resp <- make_request(zip_url, token, method = "HEAD")
  byte_size <- as.numeric(httr2::resp_headers(resp)[["content-length"]])
  gb_size <- round(byte_size / 1024^3, 4)
  if (gb_size > size_limit) {
    cli::cli_abort(c(
      "{zip_url} has a size of {gb_size} GB and exceeds the size limit of {size_limit} GB.",
      "i" = "To download the file, set {.arg size_limit} to a value greater than {gb_size}"
    ))
  }
  resp <- make_request(zip_url, token, method = "GET")
  writeBin(httr2::resp_body_raw(resp), file)
  invisible(NULL)
}

#' Download and Convert Graph Data from Netzschleuder
#'
#' These functions provide tools to interact with the Netzschleuder network dataset archive.
#' Netzschleuder (<https://networks.skewed.de/>) is a large online repository for network datasets,
#' aimed at aiding scientific research.
#' \describe{
#'   \item{`ns_metadata()`}{ retrieves metadata about a network or network collection.}
#'   \item{`ns_df()`}{downloads the graph data as data frames (nodes, edges, and graph properties).}
#'   \item{`ns_graph()`}{creates an `igraph` object directly from Netzschleuder.}
#' }
#'
#' @param name Character. The name of the network dataset. To get a network from a collection,
#'   use the format `<collection_name>/<network_name>`.
#' @param collection Logical. If TRUE, get the metadata of a whole collection of networks.
#' @param token Character. Some networks have restricted access and require a token.
#' @param size_limit Numeric. Maximum allowed file size in GB. Larger files will be prevented from being downloaded.
#'   See <https://networks.skewed.de/restricted>.
#'
#' @return
#' \describe{
#' \item{`ns_metadata()`}{A list containing metadata for the dataset.}
#' \item{`ns_df()`}{A named list with `nodes`, `edges`, `gprops`, and `meta`.}
#' \item{`ns_graph()`}{An `igraph` object.}
#' }
#' @examples
#' \dontrun{
#' # Get metadata
#' ns_metadata("copenhagen/calls")
#'
#' # Download network as data frames
#' graph_data <- ns_df("copenhagen/calls")
#'
#' # Create an igraph object
#' g <- ns_graph("copenhagen/calls")
#' }
#'
#' @seealso <https://networks.skewed.de/>
#' @rdname netzschleuder
#' @export
ns_metadata <- function(name, collection = FALSE) {
  rlang::check_installed("cli")
  net_ident <- resolve_name(name)
  path <- sprintf("api/net/%s", net_ident[[1]])
  collection_url <- sprintf("https://networks.skewed.de/net/%s", net_ident[[1]])
  resp <- make_request(path)
  raw <- httr2::resp_body_json(resp)
  class(raw) <- c("ns_meta", class(raw))
  raw[["is_collection"]] <- collection
  raw[["collection_name"]] <- net_ident[[1]]
  if (collection) {
    return(raw)
  } else if (
    net_ident[[1]] == net_ident[[2]] &&
      length(unlist(raw$nets)) > 1 &&
      !collection
  ) {
    cli::cli_abort(
      c(
        "{net_ident[[1]]} is a collection and downloading a whole collection is not permitted.",
        "i" = "see {.url {collection_url}}"
      )
    )
  } else if (net_ident[[1]] == net_ident[[2]]) {
    return(raw)
  } else {
    idx <- which(unlist(raw[["nets"]]) == net_ident[[2]])
    if (length(idx) == 0) {
      cli::cli_abort(
        c(
          "{net_ident[[2]]} is not part of the collection {net_ident[[1]]}.",
          "i" = "see {.url {collection_url}}"
        )
      )
    }
    raw[["analyses"]] <- raw[["analyses"]][[net_ident[[2]]]]
    raw[["nets"]] <- raw[["nets"]][idx]
    raw
  }
}

#' @rdname netzschleuder
#' @export
ns_df <- function(name, token = NULL, size_limit = 1) {
  rlang::check_installed("minty")
  if (is.character(name)) {
    meta <- ns_metadata(name, collection = FALSE)
    net_ident <- resolve_name(name)
  } else if (inherits(name, "ns_meta")) {
    if (name[["is_collection"]]) {
      cli::cli_abort(c(
        "{.arg name} contains the meta data of a whole collection and downloading a whole collection is not permitted.",
        "i" = "set collection = FALSE in `ns_metadata()`"
      ))
    }
    meta <- name
    net_ident <- c(meta[["collection_name"]], meta[["nets"]])
  } else {
    cli::cli_abort("{.arg name} must be a string or a `ns_meta` object.")
  }

  zip_url <- sprintf(
    "net/%s/files/%s.csv.zip",
    net_ident[[1]],
    net_ident[[2]]
  )

  temp <- tempfile(fileext = "zip")
  download_file(zip_url, token = token, file = temp, size_limit = size_limit)

  zip_contents <- utils::unzip(temp, list = TRUE)

  edge_file_name <- grep("edge", zip_contents$Name, value = TRUE)
  node_file_name <- grep("node", zip_contents$Name, value = TRUE)
  gprops_file_name <- grep("gprops", zip_contents$Name, value = TRUE)

  edges_df_raw <- utils::read.csv(unz(temp, edge_file_name))
  edges_df <- suppressWarnings(minty::type_convert(edges_df_raw))
  source_loc <- grep("source", names(edges_df))
  target_loc <- grep("target", names(edges_df))
  names(edges_df)[c(source_loc, target_loc)] <- c("from", "to")

  # netzschleuder uses 0-indexing, igraph uses 1-indexing
  edges_df[["from"]] <- edges_df[["from"]] + 1L
  edges_df[["to"]] <- edges_df[["to"]] + 1L

  nodes_df_raw <- utils::read.csv(unz(temp, node_file_name))
  #suppress warning if no character columns found
  nodes_df <- suppressWarnings(minty::type_convert(nodes_df_raw))
  names(nodes_df)[1] <- "id"

  # netzschleuder uses 0-indexing, igraph uses 1-indexing
  nodes_df[["id"]] <- nodes_df[["id"]] + 1L
  if ("X_pos" %in% names(nodes_df)) {
    regex <- gregexpr("-?\\d+\\.\\d+", nodes_df[["X_pos"]])
    matches <- regmatches(nodes_df[["X_pos"]], regex)

    mat <- vapply(matches, as.numeric, numeric(2))

    nodes_df[["X_pos"]] <- NULL
    nodes_df[["x"]] <- mat[1, ]
    nodes_df[["y"]] <- mat[2, ]
  }

  gprops_df <- readLines(unz(temp, gprops_file_name))

  on.exit(unlink(temp))

  list(nodes = nodes_df, edges = edges_df, gprops = gprops_df, meta = meta)
}

#' @rdname netzschleuder
#' @export
ns_graph <- function(name, token = NULL, size_limit = 1) {
  graph_data <- ns_df(name, token = token, size_limit = size_limit)
  directed <- graph_data$meta[["analyses"]][["is_directed"]]
  bipartite <- graph_data$meta[["analyses"]][["is_bipartite"]]

  g <- igraph::graph_from_data_frame(
    graph_data$edges,
    directed = directed,
    vertices = graph_data$nodes
  )

  if (bipartite) {
    types <- rep(FALSE, igraph::vcount(g))
    types[graph_data$nodes$id %in% graph_data$edges[[1]]] <- TRUE
    g <- igraph::set_vertex_attr(g, "type", value = types)
  }

  g
}

#' @export
print.ns_meta <- function(x, ...) {
  if (x[["is_collection"]]) {
    cat("Netzschleuder Metadata for the collection:", x[["collection_name"]])
    cat("Number of Networks:", length(x[["nets"]]))
  } else {
    cat(
      "Netzschleuder Metadata for: ",
      x[["collection_name"]],
      "/",
      x[["nets"]][[1]],
      sep = ""
    )
    cat("\n")
    cat("Number of vertices:", x$analyses$num_vertices)
    cat("\n")
    cat("Number of Edges:", x$analyses$num_edges)
    cat("\n")
    cat("Directed:", x$analyses$is_directed)
    cat("\n")
    cat("Bipartite:", x$analyses$is_bipartite)
  }
}

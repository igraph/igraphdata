make_request <- function(url, token = NULL) {
  req <- httr2::request(url)
  req <- httr2::req_throttle(req, capacity = 20, fill_time_s = 60)

  if (!is.null(token)) {
    req <- httr2::req_headers(req, `WWW-Authenticate` = token)
  }

  req <- httr2::req_user_agent(
    req,
    "R package igraphdata (github.com/igraph/igraphdata)"
  )

  resp <- httr2::req_perform(req)

  if (httr2::resp_status(resp) != 200) {
    stop("Failed to download file. Status: ", httr2::resp_status(resp))
  }

  resp
}

resolve_name <- function(x) {
  if (grepl("/", x)) {
    return(strsplit(x, "/", fixed = TRUE)[[1]])
  } else {
    c(x, x)
  }
}

download_file <- function(zip_url, token = NULL, file) {
  resp <- make_request(zip_url, token)
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
#' @param token Character. Some networks have restricted access and require a token.
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
ns_metadata <- function(name) {
  net_ident <- resolve_name(name)
  url <- sprintf("https://networks.skewed.de/api/net/%s", net_ident[1])
  collection_url <- sprintf("https://networks.skewed.de/net/%s", net_ident[1])
  resp <- make_request(url)
  raw <- httr2::resp_body_json(resp)
  if (net_ident[1] == net_ident[2] && length(unlist(raw$nets)) > 1) {
    cli::cli_abort(
      c(
        "{net_ident[1]} is a collection and downloading a whole collection is not permitted.",
        "i" = "see {.url {collection_url}}"
      )
    )
  } else if (net_ident[1] == net_ident[2]) {
    return(raw)
  } else {
    idx <- which(unlist(raw[["nets"]]) == net_ident[2])
    if (length(idx) == 0) {
      cli::cli_abort(
        c(
          "{net_ident[2]} is not part of the collection {net_ident[1]}.",
          "i" = "see {.url {collection_url}}"
        ),
        call = call
      )
    }
    raw[["analyses"]] <- raw[["analyses"]][[net_ident[2]]]
    raw[["nets"]] <- raw[["nets"]][idx]
    raw
  }
}

#' @rdname netzschleuder
#' @export
ns_df <- function(name, token = NULL) {
  meta <- ns_metadata(name)
  net_ident <- resolve_name(name)

  zip_url <- sprintf(
    "https://networks.skewed.de/net/%s/files/%s.csv.zip",
    net_ident[1],
    net_ident[2]
  )

  temp <- tempfile(fileext = "zip")
  download_file(zip_url, token = token, file = temp)

  zip_contents <- utils::unzip(temp, list = TRUE)

  edge_file_name <- grep("edge", zip_contents$Name, value = TRUE)
  node_file_name <- grep("node", zip_contents$Name, value = TRUE)
  gprops_file_name <- grep("gprops", zip_contents$Name, value = TRUE)

  edges_df_raw <- utils::read.csv(unz(temp, edge_file_name))
  edges_df <- suppressWarnings(minty::type_convert(edges_df_raw))
  source_loc <- grep("source", names(edges_df))
  target_loc <- grep("target", names(edges_df))

  # netzschleuder uses 0-indexing, igraph uses 1-indexing
  edges_df[[source_loc]] <- edges_df[[source_loc]] + 1
  edges_df[[target_loc]] <- edges_df[[target_loc]] + 1
  names(edges_df)[c(source_loc, target_loc)] <- c("from", "to")

  nodes_df_raw <- utils::read.csv(unz(temp, node_file_name))
  nodes_df <- suppressWarnings(minty::type_convert(nodes_df_raw))
  names(nodes_df)[1] <- "id"

  # netzschleuder uses 0-indexing, igraph uses 1-indexing
  nodes_df[["id"]] <- nodes_df[["id"]] + 1
  if ("X_pos" %in% names(nodes_df)) {
    pos_array <- gsub("array\\(\\[|\\]|\\)", "", nodes_df[["X_pos"]])
    split_coords <- strsplit(pos_array, ",")

    x_vals <- sapply(split_coords, function(x) as.numeric(trimws(x[1])))
    y_vals <- sapply(split_coords, function(x) as.numeric(trimws(x[2])))

    nodes_df[["X_pos"]] <- NULL
    nodes_df$x <- x_vals
    nodes_df$y <- y_vals
  }

  gprops_df <- utils::read.csv(unz(temp, gprops_file_name))

  on.exit(unlink(temp))

  list(nodes = nodes_df, edges = edges_df, gprops = gprops_df, meta = meta)
}

#' @rdname netzschleuder
#' @export
ns_graph <- function(name) {
  graph_data <- ns_df(name)
  directed <- graph_data$meta[["analyses"]][["is_directed"]]
  bipartite <- graph_data$meta[["analyses"]][["is_bipartite"]]

  g <- igraph::graph_from_data_frame(
    graph_data$edges,
    directed = directed,
    vertices = graph_data$nodes
  )

  if (bipartite) {
    types <- rep(FALSE, igraph::vcount(g))
    types[graph_data$nodes$id %in% graph_data$edges[, 1]] <- TRUE
    g <- igraph::set_vertex_attr(g, "type", value = types)
  }

  g
}

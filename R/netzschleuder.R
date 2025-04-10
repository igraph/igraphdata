download_file <- function(zip_url, token = NULL, file) {
  req <- httr2::request(zip_url)
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

  if (!grepl("application/zip", httr2::resp_content_type(resp))) {
    warning(
      "Response does not look like a ZIP file (Content-Type: ",
      httr2::resp_content_type(resp),
      ")"
    )
  }

  writeBin(httr2::resp_body_raw(resp), file)
  invisible(NULL)
}

#' Download a graph from the Netzschleuder data catalogue
#' Netzschleuder (<https://networks.skewed.de/>) is a large online repository for
#' network datasets with the aim of aiding scientific research.
#' @param name character. name of the network dataset.
#' @param network character. If the dataset contains several networks this is the network name.
#' @param token character. Some networks have restricted access and need a toke. See <https://networks.skewed.de/restricted>
#' @return a named list containing an edge list and node attribute data frame and some metadata
#' @export
read_from_netzschleuder <- function(name, ..., network = NULL, token = NULL) {
  if (is.null(network)) {
    network <- name
  }
  zip_url <- sprintf(
    "https://networks.skewed.de/net/%s/files/%s.csv.zip",
    name,
    network
  )
  temp <- tempfile(fileext = "zip")
  download_file(zip_url, token = token, file = temp)

  zip_contents <- utils::unzip(temp, list = TRUE)

  edge_file_name <- grep("edge", zip_contents$Name, value = TRUE)
  node_file_name <- grep("node", zip_contents$Name, value = TRUE)
  meta_file_name <- grep("gprops", zip_contents$Name, value = TRUE)

  edges_df_raw <- utils::read.csv(unz(temp, edge_file_name))
  edges_df <- minty::type_convert(edges_df_raw)
  source_loc <- grep("source", names(edges_df))
  target_loc <- grep("target", names(edges_df))

  # netzschleuder uses 0-indexing, igraph uses 1-indexing
  edges_df[[source_loc]] <- edges_df[[source_loc]] + 1
  edges_df[[target_loc]] <- edges_df[[target_loc]] + 1
  names(edges_df)[c(source_loc, target_loc)] <- c("from", "to")

  nodes_df_raw <- utils::read.csv(unz(temp, node_file_name))
  nodes_df <- minty::type_convert(nodes_df_raw)
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

  meta_df <- utils::read.csv(unz(temp, meta_file_name))

  on.exit(unlink(temp))

  list(nodes = nodes_df, edges = edges_df, meta = meta_df)
}

#' Create a graph from the Netzschleuder data catalogue
#'
#' Netzschleuder (<https://networks.skewed.de/>) is a large online repository for
#' network datasets with the aim of aiding scientific research.
#' @inheritParams read_from_netzschleuder
#' @param directed logical. Whether a directed graph is constructed.
#' @param bipartite logical. Whether a bipartite graph is constructed.
#' @return a new graph object.
#' @export
graph_from_netzschleuder <- function(
  name,
  ...,
  network = NULL,
  directed = FALSE,
  bipartite = FALSE
) {
  graph_data <- read_from_netzschleuder(name, network)
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

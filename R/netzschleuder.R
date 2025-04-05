#' Download a graph from the Netzschleuder data catalogue
#' Netzschleuder (<https://networks.skewed.de/>) is a large online repository for
#' network datasets with the aim of aiding scientific research.
#' @param name character. name of the network dataset.
#' @param net character. If the dataset contains several networks this is the network name.
#' @return a named list containing an edge list and node attribute data frame and some metadata
#' @export
read_from_netzschleuder <- function(name, net = NULL) {
  if (is.null(net)) {
    net <- name
  }
  zip_url <- paste0(
    "https://networks.skewed.de/net/",
    name,
    "/files/",
    net,
    ".csv.zip"
  )

  temp <- tempfile()
  utils::download.file(zip_url, temp, quiet = TRUE) #TODO: add better error handling
  zip_contents <- utils::unzip(temp, list = TRUE)

  edge_file_name <- zip_contents$Name[grepl("edge", zip_contents$Name)]
  node_file_name <- zip_contents$Name[grepl("node", zip_contents$Name)]
  meta_file_name <- zip_contents$Name[grepl("gprops", zip_contents$Name)]

  edges_df <- utils::read.csv(unz(temp, edge_file_name)) + 1
  names(edges_df)[c(1, 2)] <- c("from", "to")

  nodes_df <- utils::read.csv(unz(temp, node_file_name))
  names(nodes_df)[1] <- "id"
  nodes_df$id <- nodes_df$id + 1
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
#' @param name character. name of the network dataset.
#' @param net character. If the dataset contains several networks this is the network name.
#' @param directed logical. Whether a directed graph is constructed.
#' @param bipartite logical. Whether a bipartite graph is constructed.
#' @return a new graph object.
#' @export
graph_from_netzschleuder <- function(
  name,
  net = NULL,
  directed = FALSE,
  bipartite = FALSE
) {
  graph_data <- read_from_netzschleuder(name, net)
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

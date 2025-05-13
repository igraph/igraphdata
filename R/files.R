#' Example files
#'
#' Functions that return paths to example files of the "Les Miserables" example network,
#' in the GML, GraphML or Pajek format.
#'
#' @return A string indicating an absolute path to a file.
#' @name lesmis
#' @references D. E. Knuth, The Stanford GraphBase: A Platform for Combinatorial Computing, Addison-Wesley, Reading, MA (1993).
#' \url{https://www-cs-faculty.stanford.edu/~knuth/sgb.html}
#' @export
lesmis_gml <- function() {
  system.file("files/lesmis.gml", package = "igraphdata", mustWork = TRUE)
}

#' @export
#' @rdname lesmis
lesmis_graphml <- function() {
  system.file("files/lesmis.graphml", package = "igraphdata", mustWork = TRUE)
}

#' @export
#' @rdname lesmis
lesmis_pajek <- function() {
  system.file("files/lesmis.net", package = "igraphdata", mustWork = TRUE)
}

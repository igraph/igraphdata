.onAttach <- function(libname, pkgname)
{
  suppressPackageStartupMessages(library(igraph, quietly = TRUE, verbose = FALSE, warn.conflicts = FALSE))
}

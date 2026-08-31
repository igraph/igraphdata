.onAttach <- function(libname, pkgname)
{
  suppressPackageStartupMessages(requireNamespace("igraph", quietly = TRUE))
}

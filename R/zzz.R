.pkg_env <- new.env(parent = emptyenv())

.onLoad <- function(libname, pkgname) {
  base_req <- httr2::request("https://networks.skewed.de") |>
    httr2::req_throttle(capacity = 20, fill_time_s = 60) |>
    httr2::req_user_agent("R package igraphdata (github.com/igraph/igraphdata)")

  .pkg_env$base_req <- base_req
}

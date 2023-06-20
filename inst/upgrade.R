library(igraph, warn.conflicts = FALSE)

upgrade <- function(x) {
  if (inherits(x, "igraph")) {
    upgrade_graph(x)
  } else {
    # foodwebs
    lapply(x, upgrade_graph)
  }
}

for (f in fs::dir_ls("data")) local({
  load(f)
  print(ls())
  assign(ls(), upgrade(get(ls())))
  save(list = ls(), file = f, compress = "xz", version = 2)
})

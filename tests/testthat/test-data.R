test_that("Koenigsberg snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(Koenigsberg, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    Koenigsberg
  })
})

test_that("UKfaculty snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(UKfaculty, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    UKfaculty
  })
})

test_that("USairports snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(USairports, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    USairports
  })
})

test_that("enron snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(enron, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    enron
  })
})

test_that("foodwebs snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(foodwebs, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    foodwebs
  })
})

test_that("immuno snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(immuno, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    immuno
  })
})

test_that("karate snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(karate, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    karate
  })
})

test_that("kite snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(kite, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    kite
  })
})

test_that("macaque snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(macaque, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    macaque
  })
})

test_that("rfid snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(rfid, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    rfid
  })
})

test_that("yeast snapshot", {
  # Side effect: load package
  skip_if_not_installed("igraph")

  data(yeast, package = "igraphdata")
  old <- igraph::igraph_options(print.id = FALSE)
  on.exit(do.call(igraph::igraph_options, old))
  expect_snapshot({
    yeast
  })
})

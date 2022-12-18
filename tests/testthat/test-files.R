test_that("paths return a string", {
  expect_type(lesmis_gml(), "character")
  expect_length(lesmis_gml(), 1)
  expect_type(lesmis_graphml(), "character")
  expect_length(lesmis_graphml(), 1)
  expect_type(lesmis_pajek(), "character")
  expect_length(lesmis_pajek(), 1)
})

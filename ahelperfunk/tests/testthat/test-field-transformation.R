context("Elementary Field Transformations")

test_that("transaction.rep.product.on.fund.df exists", {
  test_df <- transaction.rep.product.on.fund.df
  expected_csv <- "expected/input-replace-product-on-fund.csv"
  expected_df <- read.csv(expected_csv, header = TRUE)
  expect_equal(test_df, expected = expected_df)
})

test_that("replace_product_on_fund works", {
  #test_df <- data.frame(x = c(1:4), y = rep(2,4))

  test_df <- replace_product_on_fund()
  expected_csv <- "expected/input-replace-product-on-fund.csv"
  expected_df <- read.csv(expected_csv, header = TRUE)
  #expect_equal(test_df, expected = expected_df)

})

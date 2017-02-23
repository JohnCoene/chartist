library(testthat)
library(chartist)

context ("ratio")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("ratio", {

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    ratio_ist(1)

  expect_length(p$jsHooks, 1)
})

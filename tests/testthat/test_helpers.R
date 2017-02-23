library(testthat)
library(chartist)

context ("helpers")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("helpers", {
  p <- df[1:5, ] %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y) %>%
    gauge_ist()

  expect_error(df[1:5, ] %>%
                 chart_ist(x, type = "line") %>%
                 add_ist(y) %>%
                 gauge_ist())

  expect_error(df[1:5, ] %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y) %>%
    scatter_ist())

  p <- df[1:5, ] %>%
    chart_ist(x, type = "line") %>%
    add_ist(y) %>%
    scatter_ist()

  expect_warning(df[1:5, ] %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y) %>%
    peak_ist())

  p <- df[1:5, ] %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y) %>%
    gauge_ist()

})

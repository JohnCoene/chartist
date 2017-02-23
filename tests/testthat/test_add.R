library(testthat)
library(chartist)

context ("add_ist & chart_ist")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("error", {
  expect_error(chart_ist())
  expect_error(chart_ist(df))
  expect_error(chart_ist(df, type = "line"))
  expect_error(df %>%
                 chart_ist(x) %>%
                 add_ist())
})

test_that("add_ist", {
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y)

  expect_equal(length(p$x$cdat$series[[1]]$data), 20)
  expect_equal(p$x$cdat$series[[1]]$name, "line-1")

  p <- df %>%
    chart_ist(x, type = "bar") %>%
    add_ist(y)

  expect_equal(p$x$type, "bar")

  p <- df %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y)

  expect_equal(p$x$type, "pie")
  expect_equal(class(p$x$cdat$series), "list")

  # names
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y, name = "Y") %>%
    add_ist(z, name = "Z") %>%
    name_ist()

  expect_equal(p, c("Y", "Z"))
})


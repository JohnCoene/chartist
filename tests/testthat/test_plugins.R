library(testthat)
library(chartist)

context ("plugins")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("label_ist",{
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    label_ist(position = "middle")


  expect_equal(length(p$x$plugins$plugins), 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    thresh_ist(15)

  expect_equal(length(p$x$plugins$plugins), 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    hover_ist(prefix = "$", suffix = "M")

  expect_equal(length(p$x$plugins$plugins), 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    xtitle_ist(title = "title", textAnchor = "middle", flipTitle = TRUE,
               offsetx = 0, offsety = 0)

  expect_equal(length(p$x$plugins$plugins), 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    ytitle_ist(title = "title", flipTitle = FALSE, offsetx = 0, offsety = 0)

  expect_equal(length(p$x$plugins$plugins), 1)
})


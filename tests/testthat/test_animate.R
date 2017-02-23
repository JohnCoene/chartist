library(testthat)
library(chartist)

context ("animate")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("animate", {
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    lanim_ist()

  expect_length(p$x$anim$FUN, 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    anim_ist(type = c("line", "point"),
             anim = "opacity",
             begin = 0,
             from = 0,
             to = 1,
             dur = 2000)

  expect_length(p$x$anim$FUN, 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    sanim_ist()

  expect_length(p$x$anim$FUN, 1)

  p <- df %>%
    chart_ist(x, "pie") %>%
    add_ist(y) %>%
    pieopt_ist(donut = TRUE) %>%
    danim_ist()

  expect_length(p$x$anim$FUN, 1)

  p <- df %>%
    chart_ist(x, "pie") %>%
    add_ist(y) %>%
    gauge_ist() %>%
    ganim_ist()

  expect_length(p$x$anim$FUN, 1)

  p <- df %>%
    chart_ist(x) %>%
    add_ist(y) %>%
    lanim_ist() %>%
    loop_ist()

  expect_length(p$x$anim$FUN, 1)

  # multiple
  p <- df %>%
    chart_ist(x, "pie") %>%
    add_ist(y) %>%
    pieopt_ist(donut = TRUE) %>%
    anim_ist(type = c("line", "point"),
             anim = "opacity",
             begin = 0,
             from = 0,
             to = 1,
             dur = 2000) %>%
    danim_ist() %>%
    loop_ist()

  p <- df %>%
    chart_ist(x, "pie") %>%
    add_ist(y) %>%
    gauge_ist() %>%
    ganim_ist()
})

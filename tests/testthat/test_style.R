library(testthat)
library(chartist)

context ("ratio")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("ratio", {

  p <- df %>%
    chart_ist(x, "line") %>%
    add_ist(y, "hp") %>%
    add_ist(z, "disp") %>%
    lineopt_ist("hp", showPoint = FALSE, showArea = TRUE, showLine = FALSE) %>%
    xaxis_ist(showLabel = FALSE) %>%
    style_ist(css = htmltools::css(stroke = "rgba(231,1,2,0.4)", stroke.dasharray="20")) %>%
    style_ist("area", htmltools::css(stroke = "black", fill = "rgba(0,,0,0.9)")) %>%
    style_ist(c("point"), htmltools::css(stroke = "red"))

  expect_length(p$x$style$FUN, 1)
})

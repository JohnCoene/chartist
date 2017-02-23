library(testthat)
library(chartist)

context ("options")

df <- data.frame(x = 1:20, y = runif(20, 0, 5), z = runif(20, 0, 5))

test_that("opt",{
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y, name = "yyy") %>%
    opt_ist(name = "yyy", width = 300, height = 300, low = 0, high = 20,
            chartPadding = 15)
})

test_that("lineopt",{
  p <- df %>%
    chart_ist(x) %>%
    add_ist(y, name = "yyy") %>%
    lineopt_ist(name = "yyy", fillHoles = FALSE, showPoint = TRUE,
            showArea = FALSE, showLine = TRUE, areaBase = 0,
            lineSmoothing = "simple", fullWidth = TRUE, distributeSeries = FALSE,
            width = 300, height = 200, low = 10, high = 20, chartPadding = 15)
})

test_that("baropt",{
  p <- df %>%
    chart_ist(x, type = "bar") %>%
    add_ist(y, name = "yyy") %>%
    baropt_ist(name = "yyy", fullWidth = TRUE, centerBars = FALSE, stackBars = FALSE,
               distributeSeries = FALSE, seriesBarDistance = 10, width = 20,
               height = 20, low = 0, high = 50, chartPadding = 15)
})

test_that("pieopt",{
  p <- df %>%
    chart_ist(x, type = "pie") %>%
    add_ist(y, name = "yyy") %>%
    pieopt_ist(name = "yyy", percent = TRUE, donut = TRUE, showLabel = FALSE,
               startAngle = 270, total = sum(df$y), donutWidth = 40,
               labelOffset = 20, width = 300, height = 300,
               low = 0, high = 200, chartPadding = 15)
})

test_that("xaxis",{
  p <- df %>%
    chart_ist(x, type = "bar") %>%
    add_ist(y, name = "yyy") %>%
    xaxis_ist(showLabel = TRUE, showGrid = TRUE, suffix = "M",
               prefix = "$", position = "middle", offset = 20, labelOffset = 10,
               scaleMinSpace = 20)
})

test_that("yaxis",{
  p <- df %>%
    chart_ist(x, type = "bar") %>%
    add_ist(y, name = "yyy") %>%
    yaxis_ist(showLabel = TRUE, showGrid = TRUE, suffix = "M",
              prefix = "$", position = "middle", offset = 20, labelOffset = 20,
              scaleMinSpace = 20)
})

test_that("responsive",{
  p <- df %>%
    chart_ist(x, type = "bar") %>%
    add_ist(y, name = "yyy") %>%
    resp_ist(query = "screen and (min-width: 641px) and (max-width: 1024px)",
              chartPadding = 0)
})

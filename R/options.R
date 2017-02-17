#' Configure options for chartist visualisation
#'
#' Pass any option for any chart here. Also see options specific to your chart
#' type, \code{\link{pieopt_ist}}, \code{\link{baropt_ist}} or
#' \code{\link{lineopt_ist}}
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param name name the serie, see details (optional).
#' @param width set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).
#' @param height set fixed height in pixels or percent
#' (i.e.: \code{300px}, \code{70\%}).
#' @param low lower bound of value.
#' @param high higher bound of value.
#' @param chartPadding padding around chart div.
#'
#' @export
opt_ist <- function(p, ..., name, width, height, low, high, chartPadding){

  opts <- list(...)

  opts$width <- if(!missing(width)) width
  opts$height <- if(!missing(height)) height
  opts$low <- if(!missing(low)) low
  opts$high <- if(!missing(high)) high
  opts$chartPadding <- if(!missing(chartPadding)) chartPadding

  if(!missing(name)) {
    specopts <- list(opts)
    names(specopts) <- name
    p$x$options$series <- append(p$x$options$series, specopts)
  } else {
    p$x$options <- append(p$x$options, opts)
  }

  p
}

#' Line options
#'
#' Pass options to \code{line} type.
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param name name the serie, see details (optional).
#' @param fillHoles whether to fill missing data, defaults to \code{TRUE}.
#' @param showPoint whether to show points, defaults to \code{TRUE}.
#' @param showArea turn line chart into area chart, defaults to \code{FALSE}.
#' @param lineSmoothing defaults to \code{simple}, can take an \code{integer},
#' \code{step}, \code{none} or an htmlwidgets javascript function
#' (class \code{JS_EVAL}).
#' @param showLine set \code{FALSE} to hide line.
#' @param fullWidth When set to true, the last grid line on the x-axis is not
#' drawn and the chart elements will expand to the full available width of the
#' chart. For the last label to be drawn correctly you might need to add chart
#' padding or offset the last label with a draw event handler.
#' @param width set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).
#' @param height set fixed height in pixels or percent
#' (i.e.: \code{300px}, \code{70\%}).
#' @param areaBase base for the chart, defaults to 0.
#' @param low lower bound of value.
#' @param high higher bound of value.
#' @param chartPadding padding around chart div.
#'
#' @examples
#' mtcars %>%
#'    chart_ist(x = "mpg", type = "line") %>%
#'    add_ist("disp") %>%
#'    lineopt_ist(showArea = TRUE, showLine = FALSE, showPoint = FALSE)
#'
#' mtcars %>%
#'    chart_ist(x = "mpg", type = "line") %>%
#'    add_ist("disp") %>%
#'    lineopt_ist(lineSmoothing = "step", showLine = TRUE, showPoint = FALSE)
#'
#' mtcars %>%
#'    chart_ist(x = "mpg", type = "line") %>%
#'    add_ist("disp", name = "disp") %>%
#'    add_ist("hp", name = "hp") %>%
#'    lineopt_ist(name = "disp", lineSmoothing = "none") %>%
#'    lineopt_ist(name = "hp", showArea = TRUE, showPoint = FALSE)
#'
#' @export
lineopt_ist <- function(p, ..., name, fillHoles = TRUE, showPoint = TRUE,
                        showArea = FALSE, showLine = TRUE, areaBase = 0,
                        lineSmoothing = "simple", fullWidth = TRUE, width,
                        height, low, high, chartPadding){

  opts <- list(...)

  opts$width <- if(!missing(width)) width
  opts$height <- if(!missing(height)) height
  opts$areaBase <- if(!missing(areaBase)) areaBase
  opts$low <- if(!missing(low)) low
  opts$high <- if(!missing(high)) high
  opts$chartPadding <- if(!missing(chartPadding)) chartPadding
  opts$showArea <- if(!missing(showArea)) showArea
  opts$fullWidth <- if(!missing(fullWidth)) fullWidth
  opts$fillHoles <- if(!missing(fillHoles)) fillHoles
  opts$showPoint <- if(!missing(showPoint)) showPoint
  opts$showLine <- if(!missing(showLine)) showLine
  opts$lineSmooth <- if(!missing(lineSmoothing) && is.numeric(lineSmoothing) || is.integer(lineSmoothing)) {
    htmlwidgets::JS('Chartist.Interpolation.simple({divisor: ', lineSmoothing,'})')
  } else if (!missing(lineSmoothing) && lineSmoothing == "step"){
    htmlwidgets::JS('Chartist.Interpolation.step()')
  } else if (!missing(lineSmoothing) && lineSmoothing == "none"){
    htmlwidgets::JS('Chartist.Interpolation.none()')
  } else if (!missing(lineSmoothing) && lineSmoothing == "simple"){
    htmlwidgets::JS('Chartist.Interpolation.simple()')
  } else if (!missing(lineSmoothing) && class(lineSmoothing) == "JS_EVAL") {
    lineSmoothing
  }

  if(!missing(name)) {
    specopts <- list(opts)
    names(specopts) <- name
    p$x$options$series <- append(p$x$options$series, specopts)
  } else {
    p$x$options <- append(p$x$options, opts)
  }

  p
}

#' Bar options
#'
#' Pass options to \code{bar} type.
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param fullWidth When set to true, the last grid line on the x-axis is not
#' drawn and the chart elements will expand to the full available width of the
#' chart. For the last label to be drawn correctly you might need to add chart
#' padding or offset the last label with a draw event handler.
#' @param stackBars whether to stack bars, default to \code{FALSE}.
#' @param centerBars set to \code{TRUE} to draw bars on the grid lines,
#' \code{FALSE} to draw on grid lines.
#' @param seriesBarDistance distance in pixels between bar groups.
#' @param width set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).
#' @param height set fixed height in pixels or percent
#' (i.e.: \code{300px}, \code{70\%}).
#' @param low lower bound of value.
#' @param high higher bound of value.
#' @param chartPadding padding around chart div.
#'
#' @examples
#' mtcars$models <- rownames(mtcars)
#'
#' mtcars[1:10,] %>%
#'     chart_ist(x = "models", type = "bar") %>%
#'     add_ist("cyl") %>%
#'     add_ist("carb") %>%
#'     add_ist("gear") %>%
#'     baropt_ist(stackBars = TRUE)
#'
#' mtcars[1:10,] %>%
#'     chart_ist(x = "models", type = "bar") %>%
#'     add_ist("cyl") %>%
#'     add_ist("carb") %>%
#'     add_ist("gear") %>%
#'     baropt_ist(seriesBarDistance = 10, centerBars = TRUE)
#'
#' @export
baropt_ist <- function(p, ..., fullWidth = TRUE, centerBars = FALSE,
                        stackBars = FALSE, seriesBarDistance, width, height,
                        low, high, chartPadding){

  opts <- list(...)

  opts$seriesBarDistance <- if(!missing(seriesBarDistance)) seriesBarDistance
  opts$centerBars <- if(!missing(centerBars)) centerBars
  opts$stackBars <- if(!missing(stackBars)) stackBars
  opts$width <- if(!missing(width)) width
  opts$height <- if(!missing(height)) height
  opts$low <- if(!missing(low)) low
  opts$high <- if(!missing(high)) high
  opts$chartPadding <- if(!missing(chartPadding)) chartPadding
  opts$fullWidth <- if(!missing(fullWidth)) fullWidth

  p$x$options <- append(p$x$options, opts)

  p
}

#' Pie and donut options
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param percent add percent sign
#' @param startAngle start angle of the pie chart in degrees.
#' @param total By specifying a total value, the sum of the values in the series
#' must be this total.
#' @param donut set to \code{TRUE} for donut chart, defaults to \code{FALSE}.
#' @param donutWidth donut width.
#' @param showLabel set to \code{FALSE} to hide labels.
#' @param labelOffset numeric to offset labels.
#' @param labelDirection label direction takes \code{neutral}, \code{explode}
#' or \code{implode}.
#' @param width set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).
#' @param height set fixed height in pixels or percent
#' (i.e.: \code{300px}, \code{70\%}).
#' @param low lower bound of value.
#' @param high higher bound of value.
#' @param chartPadding padding around chart div.
#'
#' @examples
#' mtcars$models <- rownames(mtcars)
#'
#' mtcars[1:5,] %>%
#'     chart_ist(type = "pie") %>%
#'     add_ist("disp") %>%
#'     pieopt_ist(startAngle = 270,
#'         donut = TRUE,
#'         donutWidth = 50,
#'         showLabel = FALSE)
#'
#' mtcars[1:5,] %>%
#'     chart_ist(x = "models", type = "pie") %>%
#'     add_ist("disp") %>%
#'     pieopt_ist(labelDirection = "explode",
#'         labelOffset = 100,
#'         chartPadding = 50)
#'
#' mtcars[1:5,] %>%
#'     chart_ist(type = "pie") %>%
#'     add_ist("disp") %>%
#'     pieopt_ist(percent = TRUE)
#'
#' @seealso \code{\link{gauge_ist}}
#'
#' @export
pieopt_ist <- function(p, ..., percent = FALSE, donut = FALSE, showLabel = FALSE,
                       startAngle, total, donutWidth, labelDirection,
                       labelOffset, width, height, low, high, chartPadding) {

  opts <- list(...)

  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$donut <- if(!missing(donut)) donut
  opts$startAngle <- if(!missing(startAngle)) startAngle
  opts$donut <- if(!missing(donut)) donut
  opts$total <- if(!missing(total)) total
  opts$donutWidth <- if(!missing(donutWidth)) donutWidth
  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$labelDirection <- if(!missing(labelDirection)) labelDirection
  opts$labelDirection <- if(!missing(labelDirection)) labelDirection
  opts$labelOffset <- if(!missing(labelOffset)) labelOffset
  opts$width <- if(!missing(width)) width
  opts$height <- if(!missing(height)) height
  opts$low <- if(!missing(low)) low
  opts$high <- if(!missing(high)) high
  opts$chartPadding <- if(!missing(chartPadding)) chartPadding
  if(!missing(percent) && percent == TRUE) {
    opts$labelInterpolationFnc = sumJS(p$x$cdat$series)
    p$x$cdat$labels <- NULL
  }

  p$x$options <- append(p$x$options, opts)

  p

}

#' Tweak X axis
#'
#' Tweak the x axis for chartist visualisation.
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param showLabel set to \code{FALSE} to hide labels.
#' @param showGrid set to \code{FALSE} to hide the grid.
#' @param offset offset axis.
#' @param suffix add suffix to label.
#' @param prefix add prefix to label.
#' @param labelOffset offset labels, takes \code{integer}, \code{vector} or
#' \code{list} (i.e.: \code{1}, \code{c(1,2)}, \code{list(x = 1, y = 2)}.
#' @param scaleMinSpace minimum height in pixel of scale.
#'
#' @export
xaxis_ist <- function(p, ..., showLabel = TRUE, showGrid = TRUE, suffix = "",
                      prefix = "", offset, labelOffset, scaleMinSpace){

  opts <- list(...)

  opts$labelOffset <- if(!missing(labelOffset)) labelOffset
  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$showGrid <- if(!missing(showGrid)) showGrid
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$labelInterpolationFnc <- lab_ist(prefix, suffix)

  p$x$options$axisX <- opts

  p

}

#' Tweak Y axis
#'
#' Tweak the y axis for chartist visualisation.
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param showLabel set to \code{FALSE} to hide labels.
#' @param showGrid set to \code{FALSE} to hide the grid.
#' @param suffix add suffix to label.
#' @param prefix add prefix to label.
#' @param offset offset axis.
#' @param labelOffset offset labels, takes \code{integer}, \code{vector} or
#' \code{list} (i.e.: \code{1}, \code{c(1,2)}, \code{list(x = 1, y = 2)}.
#' @param scaleMinSpace minimum height in pixel of scale.
#'
#' @export
yaxis_ist <- function(p, ..., showLabel = TRUE, showGrid = TRUE, suffix = "",
                      prefix = "", offset, labelOffset, scaleMinSpace){

  opts <- list(...)

  opts$labelOffset <- if(!missing(labelOffset)) labelOffset
  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$showGrid <- if(!missing(showGrid)) showGrid
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$labelInterpolationFnc <- lab_ist(prefix, suffix)

  p$x$options$axisY <- opts

  p

}

#' Configure responsive options for chartist visualisation
#'
#' @param p a chartist object.
#' @param ... additional options.
#' @param query responsive query.
#' @param width set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).
#' @param height set fixed height in pixels or percent
#' (i.e.: \code{300px}, \code{70\%}).
#' @param low lower bound of value.
#' @param high higher bound of value.
#' @param chartPadding padding around chart div.
#'
#' @export
resp_ist <- function(p, ..., query, width, height, low, high, chartPadding){

  if(missing(query)) stop("missing query")

  opts <- list(...)

  opts$query <- list()

  opts$query$width <- if(!missing(width)) width
  opts$query$height <- if(!missing(height)) height
  opts$query$low <- if(!missing(low)) low
  opts$query$high <- if(!missing(high)) high
  opts$query$chartPadding <- if(!missing(chartPadding)) chartPadding

  names(opts) <- unname(query)

  p$x$responsiveOptions <- append(p$x$responsiveOptions, opts)

  p
}

#' Configure options for chartist visualisation
#'
#' @export
opt_ist <- function(p, ..., name, fillHoles = TRUE, showPoint = TRUE, showArea = FALSE,
                    showLine = TRUE, lineSmoothing = "simple", fullWidth = TRUE,
                    fillSmooth = TRUE, donut, donutWidth,startAngle, total,
                    high, low, scaleMinSpace, referenceValue, stretch,
                    seriesBarDistance, reverseData, horizontalBars){

  opts <- list(...)

  opts$donut <- if(!missing(donut)) donut
  opts$donutWidth <- if(!missing(donutWidth)) donutWidth
  opts$startAngle <- if(!missing(startAngle)) startAngle
  opts$total <- if(!missing(total)) total
  opts$high <- if(!missing(high)) high
  opts$low <- if(!missing(low)) low
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$referenceValue <- if(!missing(referenceValue)) referenceValue
  opts$stretch <- if(!missing(stretch)) stretch
  opts$showArea <- if(!missing(showArea)) showArea
  opts$fullWidth <- if(!missing(fullWidth)) fullWidth
  opts$fillHoles <- if(!missing(fillHoles)) fillHoles
  opts$showPoint <- if(!missing(showPoint)) showPoint
  opts$showLine <- if(!missing(showLine)) showLine
  opts$seriesBarDistance <- if(!missing(seriesBarDistance)) seriesBarDistance
  opts$reverseData <- if(!missing(reverseData)) reverseData
  opts$horizontalBars <- if(!missing(horizontalBars)) horizontalBars
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
    specopts <- list()
    specopts$series <- list(name = opts)
    names(specopts$series) <- name
    p$x$options <- append(p$x$options, specopts)
  } else {
    p$x$options <- append(p$x$options, opts)
  }

  p
}

#' Line options
#'
#' @export
lineopt_ist <- function(p, ..., fullWidth = TRUE, fillHoles = TRUE, showPoint = TRUE, showArea = FALSE,
                     showLine = TRUE, lineSmoothing = "simple"){

  opts <- list(...)

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

  p$x$options <- append(p$x$options, opts)
  p
}

#' Pie and donut options
#'
#' @param percent add percent sign
#'
#' @export
pieopt_ist <- function(p, ..., percent) {

  opts <- list(...)

  if(!missing(percent) && percent == TRUE) {
    opts$labelInterpolationFnc = sumJS()
    p$x$cdat$labels <- NULL
  }

  p$x$options <- append(p$x$options, opts)

  p

}

#' Tweak axis for chartist visualisation
#'
#' @rdname axis_ist
#' @export
xaxis_ist <- function(p, ..., showLabel = TRUE, showGrid = TRUE, position,
                      ticks, onlyInteger, offset, scaleMinSpace){

  opts <- list(...)

  opts$position <- if(!missing(position)) position
  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$showGrid <- if(!missing(showGrid)) showGrid
  opts$onlyInteger <- if(!missing(onlyInteger)) onlyInteger
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$ticks <- if(!missing(ticks)) ticks

  p$x$options$axisX <- opts

  p

}

#' @rdname axis_ist
#' @export
yaxis_ist <- function(p, ..., showLabel = TRUE, showGrid = TRUE, position,
                      ticks, onlyInteger, offset, scaleMinSpace){

  opts <- list(...)

  opts$position <- if(!missing(position)) position
  opts$showLabel <- if(!missing(showLabel)) showLabel
  opts$showGrid <- if(!missing(showGrid)) showGrid
  opts$onlyInteger <- if(!missing(onlyInteger)) onlyInteger
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$ticks <- if(!missing(ticks)) ticks

  p$x$options$axisY <- append(p$x$options$axisY, opts)

  p

}

#' Adjust labels
#'
#' @export
xlabel_ist <- function(p, suffix = "", prefix = "",...) {
  
  opts <- list(...)
  
  opts$labelInterpolationFnc <- lab_ist(prefix, suffix)
  
  p$x$options$axisX <- append(p$x$options$axisX, opts)
  
  p
}

#' Configure responsive options for chartist visualisation
#'
#' @export
resopts_ist <- function(p, ...){

  opts <- list(...)

  p$x$responsiveOptions <- opts
  
  p
}

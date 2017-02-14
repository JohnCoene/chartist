#' Configure options for chartist visualisation
#'
#' @export
opt_ist <- function(p, ..., high, low, fullWidth = TRUE, scaleMinSpace,
                    onlyInteger, referenceValue, stretch, showArea, showLine,
                    seriesBarDistance, reverseData, horizontalBars){

  opts <- list(...)

  opts$high <- if(!missing(high)) high
  opts$low <- if(!missing(low)) low
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$onlyInteger <- if(!missing(onlyInteger)) onlyInteger
  opts$referenceValue <- if(!missing(referenceValue)) referenceValue
  opts$stretch <- if(!missing(stretch)) stretch
  opts$showArea <- if(!missing(showArea)) showArea
  opts$fullWidth <- if(!missing(fullWidth)) fullWidth
  opts$showLine <- if(!missing(showLine)) showLine
  opts$seriesBarDistance <- if(!missing(seriesBarDistance)) seriesBarDistance
  opts$reverseData <- if(!missing(reverseData)) reverseData
  opts$horizontalBars <- if(!missing(horizontalBars)) horizontalBars

  p$x$options <- opts
  p
}

#' Tweak axis for chartist visualisation
#'
#' @rdname axis_ist
#' @export
xaxis_ist <- function(p, ..., type = "auto", suffix, prefix, ticks, onlyInteger, offset,
                      scaleMinSpace, labelInterpolationFnc){

  opts <- list(...)

  opts$onlyInteger <- if(!missing(onlyInteger)) onlyInteger
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$labelInterpolationFnc <- if(!missing(labelInterpolationFnc)) {
    labelInterpolationFnc(labelInterpolationFnc)
  }
  opts$labelInterpolationFnc <- if(!missing(prefix)) labels_prefix(prefix)
  opts$labelInterpolationFnc <- if(!missing(suffix)) labels_suffix(suffix)
  opts$type <- if(!missing(type)) {
    if(!type %in% c("step", "fixed", "auto")) stop("type must be: step, fixed or auto")
    type
  }
  opts$ticks <- if(!missing(ticks)) ticks

  p$x$options$axisX <- append(p$x$options$axis, opts)

  p

}

#' @rdname axis_ist
#' @export
yaxis_ist <- function(p, ..., type = "auto", suffix, prefix, ticks, onlyInteger, offset,
                      scaleMinSpace, labelInterpolationFnc){

  opts <- list(...)

  opts$onlyInteger <- if(!missing(onlyInteger)) onlyInteger
  opts$offset <- if(!missing(offset)) offset
  opts$scaleMinSpace <- if(!missing(scaleMinSpace)) scaleMinSpace
  opts$labelInterpolationFnc <- if(!missing(labelInterpolationFnc)) {
    labelInterpolationFnc(labelInterpolationFnc)
  }
  opts$labelInterpolationFnc <- if(!missing(prefix)) {
    labels_prefix(prefix)
  }
  opts$labelInterpolationFnc <- if(!missing(suffix)) {
    labels_suffix(suffix)
  }
  opts$type <- if(!missing(type)) {
    if(!type %in% c("step", "fixed", "auto")) stop("type must be: step, fixed or auto")
    type
  }
  opts$ticks <- if(!missing(ticks)) ticks

  p$x$options$axisY <- append(p$x$options$axis, opts)

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

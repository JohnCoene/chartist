#' Configure options for chartist visualisation
#'
#' @export
opt_ist <- function(p, ..., high, low, fullWidth = TRUE, scaleMinSpace,
                    onlyInteger, referenceValue, stretch, showArea, showLine,
                    axisX, axisY){

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
  opts$axisX <- if(!missing(axisX)) axisX
  opts$axisY <- if(!missing(axisY)) axisY

  p$x$options <- opts
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

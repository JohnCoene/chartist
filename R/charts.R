#' Add Series
#'
#' Add series(s) to chart
#'
#' @param p a chartist object
#' @param x x variable
#' @param y y variable
#' @param ... Additional parameter to pass to line
#'
#' @export
add_ist <- function(p, x, y, ...){

  x = p$x$data[,x]
  if(!missing(y)) {
    y = p$x$data[,y]
    p$x$series <- append(p$x$series, list(y))
  }

  p$x$labels <- x
  p
}


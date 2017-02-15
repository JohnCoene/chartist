#' Add Series
#'
#' Add series(s) to chart
#'
#' @param p a chartist object
#' @param value value variable
#' @param ... Additional parameter to pass to line
#'
#' @export
add_ist <- function(p, value, ...){

  if(missing(value)) stop("must pass value")

  if(!missing(value)) {
    value = p$x$data[,value]
    p$x$series <- if(!tolower(p$x$type) %in% c("pie", "donut")){
      append(p$x$series, list(value))
    } else {
      append(p$x$series, value)
    }
  }

  p
}


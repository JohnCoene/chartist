#' Theme gauge
#'
#' @param p a chartist object
#'
#' @export
gauge_ist <- function(p, ...){
  if(p$x$type != "pie") stop("gauge team applies to type: pie only")

  p <- opt_ist(p, donut = TRUE, startAngle = 270, total = sum(x$y)*2)

  p
}

#' Get assigned name
#'
#' @param p a chartist object
#'
#' @export
name_ist <- function(p) {
  n <- unlist(lapply(1:length(p$x$series), function(x){
    p$x$series[[x]][[1]]
  }))

  return(n)
}

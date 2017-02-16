#' Make a gauge from a pie
#'
#' Helper function to easily make a gauge chart from a pie
#'
#' @param p a chartist object
#' @param ... additional parameters to pass to \code{\link{opt_ist}}
#'
#' @export
gauge_ist <- function(p, ...){

  if(p$x$type != "pie") stop("gauge only applies to type pie")

  data <- get("data", envir = cdat)

  p <- opt_ist(p, donut = TRUE, startAngle = 270,
               total = sum(unlist(p$x$cdat$series)) * 2, ...)

  p
}

#' Make a scatter plot from a line chart
#'
#' Helper function to easily turn a line chart into a scatter plot
#'
#' @param p a chartist object
#' @param ... additional parameters to pass to \code{\link{opt_ist}}
#'
#' @export
scatter_ist <- function(p, ...){

  if(p$x$type != "line") stop("only works on charts of type line")

  p <- p %>%
    opt_ist(showPoint = TRUE, showArea = FALSE, showLine = FALSE, ...)

  p

}


#' Get assigned name
#'
#' @param p a chartist object
#'
#' @export
name_ist <- function(p) {

  n <- unlist(lapply(1:length(p$x$cdat$series), function(x){
    p$x$cdat$series[[x]][[1]]
  }))

  return(n)
}

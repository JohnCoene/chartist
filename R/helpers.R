#' Theme gauge
#'
#' @export
gauge_ist <- function(p, ...){
  if(p$x$type != "pie") stop("gauge team applies to type: pie only")

  p <- opt_ist(p, donut = TRUE, startAngle = 270, total = sum(x$y)*2)

  p
}

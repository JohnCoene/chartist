#' Style your chart
#'
#' @param p a chartist object.
#' @param type chart element type to animate (i.e.: line, or grid).
#' @param css css to wrap in \code{\link[htmltools]{css}}
#'
#' @examples
#' # missing style defaults to chart type
#' mtcars %>%
#'     chart_ist(qsec, "line") %>%
#'     add_ist(mpg) %>%
#'     style_ist(css = htmltools::css(stroke = "rgba(0,0,0,0.4)", stroke.dasharray="20")) %>%
#'     style_ist("grid", htmltools::css(stroke = "black")) %>%
#'     style_ist(c("point"), htmltools::css(stroke = "green"))
#'     
#' mtcars %>%
#'     chart_ist(qsec, "line") %>%
#'     add_ist(hp, "hp") %>%
#'     add_ist(disp, "disp") %>%
#'     lineopt_ist("hp", showPoint = FALSE, showArea = TRUE, showLine = FALSE) %>%
#'     xaxis_ist(showLabel = FALSE) %>%
#'     style_ist(css = htmltools::css(stroke = "rgba(231,1,2,0.4)", stroke.dasharray="20")) %>%
#'     style_ist("area", htmltools::css(stroke = "black", fill = "rgba(0,,0,0.9)")) %>%
#'     style_ist(c("point"), htmltools::css(stroke = "red"))
#'
#' @export
style_ist <- function(p, type, css = htmltools::css()){

  if(missing(type)) type <- p$x$type

  type <- type_it(type, "context")

  p <- style_fun(p, type, css)

  p

}

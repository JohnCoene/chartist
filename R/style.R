#' Style your chart
#'
#' @param p a chartist object.
#' @param type chart element type to animate (i.e.: line, or grid).
#' @param css css to wrap in \code{\link[htmltools]{css}}
#'
#' @examples
#' # missing style defaults to chart type
#' mtcars %>%
#'     chart_ist(qsec, "bar") %>%
#'     add_ist(mpg) %>%
#'     style_ist(css = htmltools::css(stroke = "blue"))
#'
#' @export
style_ist <- function(p, type, css = htmltools::css()){

  if(missing(type)) type <- p$x$type

  type <- type_it(type, "context")

  p <- style_fun(p, type, css)

  p

}

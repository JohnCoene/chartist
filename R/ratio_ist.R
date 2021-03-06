#' Select aspect ratio
#'
#' Change aspect ratio of chart.
#'
#' @param p a chartist object.
#' @param ratio ratio of chart, see details and examples.
#'
#' @details Valid values for \code{ratio}:
#' \itemize{
#'   \item{\code{square} or \code{1}}
#'   \item{\code{minor-second} or \code{15:16}}
#'   \item{\code{major-second} or \code{8:9}}
#'   \item{\code{minor-third} or \code{5:6}}
#'   \item{\code{major-third} or \code{4:5}}
#'   \item{\code{perfect-fourth} or \code{3:4}}
#'   \item{\code{perfect-fifth} or \code{2:3}}
#'   \item{\code{minor-sixth} or \code{5:8}}
#'   \item{\code{golden-section} or \code{1:1.618}}
#'   \item{\code{major-sixth} or \code{3:5}}
#'   \item{\code{minor-seventh} or \code{9:16}}
#'   \item{\code{major-seventh} or \code{8:15}}
#'   \item{\code{octave} or \code{1:2}}
#'   \item{\code{major-tenth} or \code{2:5}}
#'   \item{\code{major-eleventh} or \code{3:8}}
#'   \item{\code{major-twelfth} or \code{1:3}}
#'   \item{\code{double-octave} or \code{1:4}}
#' }
#'
#' @examples
#' mtcars$models <- row.names(mtcars)
#'
#' mtcars %>%
#'     chart_ist(x = models) %>%
#'     add_ist(disp) %>%
#'     ratio_ist(ratio = "square")
#'
#' @export
ratio_ist <- function(p, ratio) {

  if(missing(ratio)) stop("missing ratio", call. = FALSE)

  css_class <- ar[ar$ratio == ratio,]
  if(nrow(css_class) == 0){
    css_class <- ar[ar$name == ratio,]
  }

  if(nrow(css_class) == 0) stop("cannot find ratio")

  fun <- paste0("function(el){",
                "var d = document.getElementById(el.id);",
                "d.className += ' ", css_class$class, "';}")

  p <-  p %>%
    htmlwidgets::onRender(fun)

  p
}

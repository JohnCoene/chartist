#' Animate
#'
#' @export
anim_ist <- function(p, ..., opacity, x1, y1) {

  opts <- list(...)

  opts$opacity <- opacity
  opts$x1 <- x1
  opts$y1 <- y1

  p$x$anim <- opts

  p
}

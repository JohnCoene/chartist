#' Add point label
#'
#' Add data point labels
#'
#' @param p a chartist object.
#' @param position position of label
#'
#' @export
label_ist <- function(p, position = "middle"){

  opts <- list()

  f <- paste0("Chartist.plugins.ctPointLabels({textAnchor: '", position, "'})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- list(opts)

  p
}

#' Add threshold
#'
#' Add threshold
#'
#' @param p a chartist object.
#' @param threshold position of label, defaults to \code{mean} of first series
#'
#' @export
thresh_ist <- function(p, threshold){

  if(missing(threshold)) {
    threshold <- mean(p$x$cdat$series[[1]]$data)
  }

  opts <- list()

  f <- paste0("Chartist.plugins.ctThreshold({threshold: ", threshold,"})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- list(opts)

  p
}

#' Add x axis title
#'
#' Add x axis title
#'
#' @param p a chartist object.
#' @param title axis title.
#' @param textAnchor title position, defaults to \code{middle}.
#' @param flipTitle set to \code{TRUE} to flip title on x axis.
#'
#' @export
axistitle_ist <- function(p, title = "", textAnchor = "middle", flipTitle = FALSE,
                          offsetx = 0, offsety = 0){

  opts <- list()

  f <- paste0("Chartist.plugins.ctAxisTitle({
      axisX: {
        axisTitle: '", title, "',
        flipTitle: '", tolower(flipTitle), "',
        axisClass: 'ct-axis-title',
        offset: {x: ", offsetx, ",y: ", offsety, "},
              textAnchor: '", textAnchor, "'},})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- list(opts)

  p
}

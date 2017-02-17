#' Add point label
#'
#' Add data point labels to \code{line} type chart.
#'
#' @param p a chartist object.
#' @param position position of label
#'
#' @export
label_ist <- function(p, position = "middle"){

  opts <- list()

  f <- paste0("Chartist.plugins.ctPointLabels({textAnchor: '", position, "'})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p
}

#' Add threshold
#'
#' Add threshold
#'
#' @param p a chartist object.
#' @param threshold position of label, defaults to \code{mean} of first series.
#'
#' @export
thresh_ist <- function(p, threshold){

  if(missing(threshold)) {
    threshold <- mean(p$x$cdat$series[[1]]$data)
  }

  opts <- list()

  f <- paste0("Chartist.plugins.ctThreshold({threshold: ", threshold,"})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p
}

#' Add hover tooltip
#'
#' @param p a chartist object.
#'
#' @export
hover_ist <- function(p) {

  opts <- list()

  opts <- htmlwidgets::JS("Chartist.plugins.tooltip()")

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

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
#' @param offsetx offset x aligment of title.
#' @param offsety offsety y alignment of title.
#'
#' @export
xtitle_ist <- function(p, title = "", textAnchor = "middle", flipTitle = FALSE,
                          offsetx = 0, offsety = 0){

  opts <- list()

  axis <- paste0("
      axisX: {
        axisTitle: '", title, "',
        flipTitle: '", tolower(flipTitle), "',
        axisClass: 'ct-axis-title',
        offset: {
            x: ", offsetx, ",y: ", offsety, "},
            textAnchor: '", textAnchor, "'")

  f <- paste0("Chartist.plugins.ctAxisTitle({", axis, "}})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p

}

#' Add y axis title
#'
#' Add y axis title
#'
#' @param p a chartist object.
#' @param title axis title.
#' @param flipTitle set to \code{TRUE} to flip title on x axis.
#' @param offsetx offset x aligment of title.
#' @param offsety offsety y alignment of title.
#'
#' @export
ytitle_ist <- function(p, title = "", flipTitle = FALSE, offsetx = 0, offsety = 0){

  opts <- list()

  axis <- paste0("
      axisY: {
        axisTitle: '", title, "',
        flipTitle: '", tolower(flipTitle), "',
        axisClass: 'ct-axis-title',
        offset: {
            x: ", offsetx, ",y: ", offsety, "}")

  f <- paste0("Chartist.plugins.ctAxisTitle({", axis, "}})")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p

}

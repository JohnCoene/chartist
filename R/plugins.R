#' Add point label
#'
#' Add data point labels to \code{line} type chart.
#'
#' @param p a chartist object.
#' @param position position of label, defaults to \code{middle}.
#'
#' @examples
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(hp) %>%
#'     label_ist()
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
#' @param threshold threshold, defaults to \code{mean} of first series passed with \code{\link{add_ist}}.
#'
#' @examples
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(hp) %>%
#'     thresh_ist()
#'
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(hp) %>%
#'     thresh_ist(220)
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
#' @param suffix add suffix to label.
#' @param prefix add prefix to label.
#'
#' @details The tooltip displays series name which is passed in \code{\link{add_ist}}
#'
#' @examples
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(values = hp, name = "Your Tooltip") %>%
#'     hover_ist(prefix = "US$")
#'
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(values = hp, name = "Your <span style='color:blue;'>Tooltip</span>") %>%
#'     hover_ist()
#'
#' @export
hover_ist <- function(p, prefix = "", suffix = "") {

  opts <- list()

  transformTooltipTextFnc <- lab_ist(prefix, suffix)

  opts <- htmlwidgets::JS("Chartist.plugins.tooltip({transformTooltipTextFnc:",
                          transformTooltipTextFnc,"})")

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
#' @examples
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(values = hp) %>%
#'     xtitle_ist(title = "HP", offsety = 30)
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
#' @examples
#' mtcars %>%
#'     chart_ist(disp) %>%
#'     add_ist(values = hp) %>%
#'     ytitle_ist(title = "disp", offsetx = 30)
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

#' Add table
#'
#' Add a table below the chart with the accessibility plugin.
#'
#' @param p a chartist object.
#' @param caption table caption.
#' @param seriesHeader header for series.
#' @param summary table summary.
#'
#' @keywords internal
table_ist <- function(p, caption = "", seriesHeader = "", summary = ""){

  opts <- list()

  f <- paste0("Chartist.plugins.ctAccessibility({
      caption: '", caption, "',
      seriesHeader: '", seriesHeader, "',
      summary: '", summary, "',
      visuallyHiddenStyles: 'position: absolute; top: 100%; width: 100%; ",
      "font-size: 11px; overflow-x: auto; ",
      "background-color: rgba(0, 0, 0, 0.1); padding: 10px'
    })")

  opts <- htmlwidgets::JS(f)

  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p

}

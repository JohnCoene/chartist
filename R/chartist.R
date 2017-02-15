#' Initiate a chartist visualisation
#'
#' Transform data into a chartist visualisation
#'
#' @param data \code{data.frame} containing data to plot.
#' @param type type of charts, defaults to \code{line}, may also be \code{bar} or \code{pie}.
#' @param x Must be passed for \code{line} and \code{bar} (\code{type}).
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId Use specific element id.
#'
#' @import htmlwidgets
#'
#' @export
chart_ist <- function(data, x, type = "line", width = NULL, height = NULL,
                      elementId = NULL) {

  if(missing(x) && tolower(type) %in% c("line", "bar")) {
    stop("line or bar charts: must pass x")
  }

  if(missing(data)) stop("must pass data")
  if(missing(type)) stop("must specify type: line, bar or pie")
  if(!tolower(type) %in% c("bar", "line", "pie")) stop("type takes: line, bar or pie")

  # forward options using x
  x = list(
    labels = unname(data[,x]),
    ratio = "ct-chart",
    series = list(),
    type = type,
    data = data,
    options = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'chartist',
    x,
    width = width,
    height = height,
    package = 'chartist',
    elementId = elementId
  )
}

#' Shiny bindings for chartist
#'
#' Output and render functions for using chartist within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a chartist
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name chartist-shiny
#'
#' @export
chartistOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'chartist', width, height, package = 'chartist')
}

#' @rdname chartist-shiny
#' @export
renderChartist <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, chartistOutput, env, quoted = TRUE)
}

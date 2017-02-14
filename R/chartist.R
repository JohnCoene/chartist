#' Initiate a chartist visualisation
#'
#' Transform data into a chartist visualisation
#'
#' @import htmlwidgets
#'
#' @export
chart_ist <- function(data, type, width = NULL, height = NULL,
                      elementId = NULL) {

  if(missing(data)) stop("must pass data")
  if(missing(type)) stop("must specify type: line, bar or pie")

  # forward options using x
  x = list(
    labels = unname(as.character(data)),
    series = list(),
    type = type,
    data = data
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

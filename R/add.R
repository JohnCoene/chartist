#' Add Series
#'
#' Add series(s) to chart
#'
#' @param p a chartist object.
#' @param values values to plot on y axis.
#' @param name name the serie, see details (optional).
#' @param ... Additional parameter to pass to line.
#'
#' @details naming the serie (\code{name}) is useful if you want to apply
#' different options (\code{\link{opt_ist}}) for each serie later on. If no
#' name is specified then the assigns one; \code{type} + \code{i} where
#' \code{i} is the serie index and starts from \code{1}. Names can be retrieved
#' using \code{\link{name_ist}}. See examples.
#'
#' @examples
#' # basic example
#' mtcars[1:10,] %>%
#'   chart_ist(x = "mpg") %>%
#'   add_ist("disp") %>%
#'   add_ist("hp")
#'
#' # option applies to both "disp" and "hp"
#' mtcars[1:10,] %>%
#'   chart_ist(x = "mpg") %>%
#'   add_ist("disp") %>%
#'   add_ist("hp") %>%
#'   opt_ist(showArea = TRUE)
#'
#' # use names to apply different option to each serie
#' mtcars[1:10,] %>%
#'   chart_ist(x = "mpg") %>%
#'   add_ist("disp", name = "disp") %>%
#'   add_ist("hp", name = "hp") %>%
#'   opt_ist(name = "hp", showArea = TRUE, showPoint = FALSE) %>%
#'   opt_ist(name = "disp", lineSmoothing = "step")
#'
#' # if you haven't assigned names you can retrieve generated ones with name_ist
#' # See details for generated names logic
#' mtcars[1:10,] %>%
#'   chart_ist(x = "mpg") %>%
#'   add_ist("disp", name = "disp") %>%
#'   add_ist("hp", name = "hp") %>%
#'   name_ist()
#'
#' @seealso \code{\link{name_ist}}, \code{\link{opt_ist}}
#'
#' @export
add_ist <- function(p, values, name, ...){

  if(missing(values)) stop("must pass values")
  if(missing(name)) name = paste0(p$x$type, "-", length(p$x$cdat$series) + 1)

  data <- get("data", envir = cdat)

  values = data[,values]

  if(!tolower(p$x$type) %in% c("pie")){
    p$x$cdat$series <- append(p$x$cdat$series, list(list(name = name, data = values)))
  } else {
    p$x$cdat$series <- append(p$x$cdat$series, values)
  }

  p
}


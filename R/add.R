#' Add Series
#'
#' Add series(s) to chart
#'
#' @param p a chartist object
#' @param values values variable
#' @param ... Additional parameter to pass to line
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


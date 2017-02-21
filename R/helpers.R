#' Make a gauge from a pie
#'
#' Helper function to easily make a gauge chart from a pie
#'
#' @param p a chartist object
#' @param ... additional parameters to pass to \code{\link{opt_ist}}
#'
#' @examples
#' mtcars[1:5,] %>%
#'     chart_ist(type = "pie") %>%
#'     add_ist("disp") %>%
#'     gauge_ist()
#'
#' @export
gauge_ist <- function(p, ...){

  if(p$x$type != "pie") stop("gauge only applies to type pie")

  data <- get("data", envir = cdat)

  p <- opt_ist(p, donut = TRUE, startAngle = 270,
               total = sum(unlist(p$x$cdat$series)) * 2, ...)

  p
}

#' Make a scatter plot from a line chart
#'
#' Helper function to easily turn a line chart into a scatter plot
#'
#' @param p a chartist object
#' @param ... additional parameters to pass to \code{\link{opt_ist}}.
#'
#' @examples
#' mtcars[1:20,] %>%
#'     chart_ist(x = rownames(.)) %>%
#'     add_ist("disp") %>%
#'     scatter_ist()
#'
#' @export
scatter_ist <- function(p, ...){

  if(p$x$type != "line") stop("only works on charts of type line")

  p <- p %>%
    opt_ist(showPoint = TRUE, showArea = FALSE, showLine = FALSE, ...)

  p

}


#' Get assigned name
#'
#' @param p a chartist object
#'
#' @examples
#' # default names
#' mtcars[1:20,] %>%
#'     chart_ist(x = rownames(.)) %>%
#'     add_ist("disp") %>%
#'     add_ist("hp") %>%
#'     name_ist()
#'
#' #assigned names
#' mtcars[1:20,] %>%
#'     chart_ist(x = rownames(.)) %>%
#'     add_ist("disp", name = "SERIE1") %>%
#'     add_ist("hp", name = "hp") %>%
#'     name_ist()
#'
#' @export
name_ist <- function(p) {

  n <- unlist(lapply(1:length(p$x$cdat$series), function(x){
    p$x$cdat$series[[x]][[1]]
  }))

  return(n)
}


#' Turn bar chart into peak chart
#' 
#' @param p a chartist object.
#' @param size point size.
#' 
#' @export
peak_ist <- function(p, size = 15) {
  
  foo <- paste0("
    function(data) {if(data.type === 'bar') {
      data.group.append(new Chartist.Svg('circle', {
        cx: data.x2,
        cy: data.y2,
        r: (Math.abs(Chartist.getMultiValue(data.value)) / Chartist.sum(Math.abs(Chartist.getMultiValue(data.value)))) * ", size, "
        }, 
      'ct-slice-pie'));}
    }")
  
  foo <- htmlwidgets::JS(foo)
  
  opts <- list(FUN = foo)
  
  p$x$anim <- opts
  
  p
}
#' Add on draw function
#'
#' @param p a chartist object
#' @param fun Javascript function, must be wrapped in \code{htmlwidgets::JS()}
#'
#' @export
draw_ist <- function(p, fun){

  p$x$draw <- fun

  p
}

#' Add peak circles to bar chart
#'
#' @param p a chartist object
#'
#' @export
peak_ist <- function(p) {

  if(p$x$type != "bar") stop("applies to charts of type: line")

  p$x$draw <- htmlwidgets::JS("function(data) {
  // If this draw event is of type bar we can use the data to create additional content
  if(data.type === 'bar') {
    // We use the group element of the current series to append a simple circle with the bar peek coordinates and a circle radius that is depending on the value
    data.group.append(new Chartist.Svg('circle', {
      cx: data.x2,
      cy: data.y2,
      r: Math.abs(Chartist.getMultiValue(data.value)) * 2 + 5
    }, 'ct-slice-pie'));
  }
}")

  p
}

#' bipolar
#'
#' @param x Label Interpolation Function to retrieve, see details for valid values
#'
#' @details
#' \itemize{
#'   \item{bipolar}
#'   \item{overlap_bars}
#' }
labelInterpolationFnc <- function(x){

  if(x == "bipolar"){
    fun <- htmlwidgets::JS('function(value, index) {
        return index % 2 === 0 ? value : null;}')
    return(fun)
  } else if (x == "overlap_bars"){
    fun <- htmlwidgets::JS('function (value) {return value[0];}')
    return(fun)
  }

}

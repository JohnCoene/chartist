

lab_ist <- function(prefix, suffix){
  fun <- htmlwidgets::JS("function(value) {return '", prefix, "' + value '", suffix, "';}")
  return(fun)
}

sumJS <- function() {
   fun <- htmlwidgets::JS("function(value) {
    return Math.round(value / data.series.reduce(function(a, b) {
  	return a + b;}, 0) * 100) + '%';}")
   
  return(fun)
}

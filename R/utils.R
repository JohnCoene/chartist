lab_ist <- function(prefix, suffix){
  fun <- htmlwidgets::JS("function(value) {
   return '", prefix, "' + value '", suffix, "';}")
  return(fun)
}

# pie chart sum
sumJS <- function(serie) {
   fun <- htmlwidgets::JS("function(value) {
    return Math.round((value / ", sum(unlist(serie)),") * 100) + '%';}")

  return(fun)
}

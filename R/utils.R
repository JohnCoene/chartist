labels_suffix <- function(suffix){
  fun <- htmlwidgets::JS('function(value) {return value + "', suffix, '";}')

  return(fun)
}

labels_prefix <- function(prefix){
  fun <- htmlwidgets::JS("function(value) {return '", prefix, "' + value;}")

  return(fun)
}

sumJS <- function(serie) {
  htmlwidgets::JS("function(value) {
    return Math.round(value / ", round(sum(unlist(serie))), " * 100) + '%';
  }")
}

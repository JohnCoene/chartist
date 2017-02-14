labels_suffix <- function(suffix){
  fun <- htmlwidgets::JS("function(value) {
      return value + '", suffix, "'
  }")

  return(fun)
}

labels_prefix <- function(prefix){
  fun <- htmlwidgets::JS("function(value) {
      return '", prefix, "' + value
  }")

  return(fun)
}

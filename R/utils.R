lab_ist <- function(prefix, suffix){

  f <- paste0("function(value) { return '", prefix, "' + value + '", suffix, "';}")

  fun <- htmlwidgets::JS(f)
  return(fun)
}

# pie chart sum
sumJS <- function(serie) {

  f <- paste0("function(value) {return Math.round((value / ", sum(unlist(serie)),") * 100) + '%';}")

  fun <- htmlwidgets::JS(f)

  return(fun)
}

# add axis title
build_title <- function(p, opts, which){



  p$x$plugins$plugins <- append(p$x$plugins$plugins, list(opts))

  p
}

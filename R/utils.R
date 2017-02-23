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

anim_fun <- function(p, type, target, d){

  if(length(p$x$anim$FUN)){

    foo <- substr(p$x$anim$FUN, 0, nchar(p$x$anim$FUN) - 1)

    d <- paste0(foo, "
      if(", type, "){
        data.element.animate({", target, ":{", d, "}});
      }
    }")

  } else {
    d <- paste0("
    function(data){
      if(", type, "){
        data.element.animate({", target, ":{", d, "}});
      }
    }")

  }

  fun <- htmlwidgets::JS(d)

  opts <- list(FUN = fun)

  p$x$anim <- opts

  p

}

type_it <- function(type, f){

  if(length(type) > 1){
    col <- paste0("' || ", f, ".type === '")
    type <- paste0(type, collapse = col)
  }

  type <- paste0(f, ".type === '", type, "'")

  return(type)
}

# build style
style_fun <- function(p, type, css){

  if(length(p$x$style$FUN)){

    foo <- substr(p$x$style$FUN, 0, nchar(p$x$style$FUN) - 1)

    d <- paste0(foo, "
      if(", type, "){
        context.element.attr({style: '", css, "'});
      }
    }")

  } else {
    d <- paste0("
    function(context){
      if(", type, "){
        context.element.attr({style: '", css, "'});
      }
    }")

  }

  fun <- htmlwidgets::JS(d)

  opts <- list(FUN = fun)

  p$x$style <- opts

  p

}

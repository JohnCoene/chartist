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
  
  foo <- ifelse(length(p$x$anim$FUN), substr(p$x$anim$FUN, 0, nchar(p$x$anim$FUN)-1), "")
  
  if(length(p$x$anim$FUN)){
    
    foo <- substr(p$x$anim$FUN, 0, nchar(p$x$anim$FUN)-1)
    
    d <- paste0(foo, "
      if(", type, "){
        data.element.animate({", target, ":{", d, "}});
      }
    }")
    
    foo <- htmlwidgets::JS(d)
    
    opts <- list(FUN = foo)
    
    p$x$anim <- opts
    
  } else {
    d <- paste0("
    function(data){
      if(", type, "){
        data.element.animate({", target, ":{", d, "}});
      }
    }")
    
    foo <- htmlwidgets::JS(d)
    
    opts <- list(FUN = foo)
    
    p$x$anim <- opts
  }
  
  p
  
}

type_it <- function(type){
  
  if(length(type) > 1){
    type <- paste0(type, collapse = "' || data.type === '")
  } 
  
  type <- paste0("data.type === '", type, "'")
  
  return(type)
}
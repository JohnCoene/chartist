#' Animate chart
#' 
#' @param type chart element type to animate (i.e.: line, or grid).
#' @param target target of animation (i.e.: opacity).
#' @param begin begin index, \code{index}.
#' @param dur duration of animation in ms.
#' @param from start of animation.
#' @param to end of animation.
#' 
#' @export
anim_ist <- function(p, ..., type, target, begin, dur, from, to, easing){
  
  if(missing(type) | missing(target)) stop("must pass type and target")
  
  opts <- list(...)
  
  opts$begin <- if(!missing(begin)) begin
  opts$dur <- if(!missing(dur)) dur
  opts$from <- if(!missing(from)) from
  opts$to <- if(!missing(to)) to
  opts$easing <- if(!missing(easing)) easing
  
  d <- lapply(list(opts), function(x){d
    paste0(names (x[]), ": ", x[])
  })
  
  d <- paste0(unlist(d), collapse = ", ")
  
  anim_fun(p, type, target, d) 
}
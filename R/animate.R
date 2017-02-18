#' Animate chart
#' 
#' @param p a chartist object.
#' @param type chart element type to animate (i.e.: line, or grid).
#' @param anim anim of animation (i.e.: opacity).
#' @param begin begin index, \code{index}.
#' @param dur duration of animation in ms.
#' @param from start of animation.
#' @param to end of animation.
#' @param easing apply easing.
#' 
#' @export
anim_ist <- function(p, ..., type, anim, begin, dur, from, to, easing){
  
  if(missing(type) | missing(anim)) stop("must pass type and anim")
  
  opts <- list(...)
  
  opts$begin <- if(!missing(begin)) begin
  opts$dur <- if(!missing(dur)) dur
  opts$from <- if(!missing(from)) from
  opts$to <- if(!missing(to)) to
  opts$easing <- if(!missing(easing)) easing
  
  d <- lapply(list(opts), function(x){
    paste0(names (x[]), ": ", x[])
  })
  
  d <- paste0(unlist(d), collapse = ", ")
  
  # multiple types
  type <- type_it(type)
  
  anim_fun(p, type, anim, d) 
}

#' Line and area chart animation
#' 
#' out of the box animation for line and/or area chart
#' 
#' @param p a chartist object.
#' @param type chart element type to animate (i.e.: line, or grid).
#' 
#' @export
lanim_ist <- function(p, type = c("line", "area")){
  
  p <- p %>%
    anim_ist(type = type, 
             anim = "d", 
             begin = "2000 * data.index", 
             dur = 2000, 
             from = "data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify()", 
             to = "data.path.clone().stringify()", 
             easing = "Chartist.Svg.Easing.easeOutQuint")
  
  p
}
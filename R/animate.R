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
#' @param ... any other param to pass to \code{anim}.
#' 
#' @export
anim_ist <- function(p, type, anim, begin, dur, from, to, easing, ...){
  
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
#' Out of the box animation for line and/or area chart.
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

#' Scatter animation
#' 
#' Out of the box animation for scatter plot.
#' 
#' @param p a chartist object.
#' 
#' @export
sanim_ist <- function(p){
  
  p %>%
    anim_ist(type = "point", 
             anim = "opacity", 
             begin = 20, 
             dur = 500, 
             from = 0, 
             to = 1) %>%
    anim_ist(type = "point", 
             anim = "x1", 
             begin = 20, 
             dur = 500, 
             from = "data.x - 100", 
             to = "data.x", 
             easing = "Chartist.Svg.Easing.easeOutQuart")
  
}

#' Animate donut chart
#' 
#' Out of the box animation for donut chart
#' 
#' @param p a chartist object.
#' 
#' @examples 
#' mtcars[1:5,] %>% 
#'     chart_ist(x = "hp", type = "pie") %>%
#'     add_ist("disp") %>%
#'     pieopt_ist(donut = TRUE, showLabel = TRUE) %>%
#'     danim_ist()
#' 
#' @export
danim_ist <- function(p){
  foo <- paste0("function(data) {
  if(data.type === 'slice') {
    // Get the total path length in order to use for dash array animation
    var pathLength = data.element._node.getTotalLength();

    // Set a dasharray that matches the path length as prerequisite to animate dashoffset
    data.element.attr({
      'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
    });

    // Create animation definition while also assigning an ID to the animation for later sync usage
    var animationDefinition = {
      'stroke-dashoffset': {
        id: 'anim' + data.index,
        dur: 1000,
        from: -pathLength + 'px',
        to:  '0px',
        easing: Chartist.Svg.Easing.easeOutQuint,
        // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
        fill: 'freeze'
      }
    };

    // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
    if(data.index !== 0) {
      animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
    }

    // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
    data.element.attr({
      'stroke-dashoffset': -pathLength + 'px'
    });

    // We can't use guided mode as the animations need to rely on setting begin manually
    // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
    data.element.animate(animationDefinition, false);
  }
}")
  
  draw_ist(p, htmlwidgets::JS(foo))
}

#' Animate grid
#' 
#' @param p a chartist object.
#' 
#' @export
ganim_ist <- function(p){
  foo <- paste0("function(data){
  if(data.type === 'grid') {
    // Using data.axis we get x or y which we can use to construct our animation definition objects
    var pos1Animation = {
      begin: 0,
      dur: 2000,
      from: data[data.axis.units.pos + '1'] - 30,
      to: data[data.axis.units.pos + '1'],
      easing: 'easeOutQuart'
    };
    
    var pos2Animation = {
      begin: 0,
      dur: 2000,
      from: data[data.axis.units.pos + '2'] - 100,
      to: data[data.axis.units.pos + '2'],
      easing: 'easeOutQuart'
    };
    
    var animations = {};
    animations[data.axis.units.pos + '1'] = pos1Animation;
    animations[data.axis.units.pos + '2'] = pos2Animation;
    animations['opacity'] = {
      begin: 0,
      dur: 2000,
      from: 0,
      to: 1,
      easing: 'easeOutQuart'
    };
    
    data.element.animate(animations);
  }
}")
  
  p %>% 
    draw_ist(htmlwidgets::JS(foo))
}

#' Pass function to on "draw"
#' 
#' Pass Javascript function to \code{chart.on("draw", your_fun)}.d
#' 
#' @param p a chartist object.
#' @param fun function, wrapped in \code{\link[htmlwidgets]{JS}}.
#' 
#' @export
draw_ist <- function(p, fun){
  
  opts <- list(FUN = fun)
  
  p$x$anim <- opts
  
  p
  
}
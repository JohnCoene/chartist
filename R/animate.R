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
#' @examples
#' mtcars %>%
#'     chart_ist("wt") %>%
#'     add_ist("disp") %>%
#'     add_ist("hp") %>%
#'     anim_ist(type = c("line", "point"),
#'         anim = "opacity",
#'         begin = 0,
#'         from = 0,
#'         to = 1,
#'         dur = 2000)
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

  p <- anim_fun(p, type, anim, d)

  p
}

#' Line and area chart animation
#'
#' Out of the box animation for line and/or area chart.
#'
#' @param p a chartist object.
#' @param type chart element type to animate (i.e.: line, or grid).
#'
#' @examples
#' mtcars %>%
#'     chart_ist("wt") %>%
#'     add_ist("disp", name = "disp") %>%
#'     add_ist("hp", name = "hp") %>%
#'     opt_ist(showPoint = FALSE) %>%
#'     lineopt_ist(name = "hp", showArea = TRUE) %>%
#'     lanim_ist()
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
#' @examples
#' mtcars %>%
#'     chart_ist("wt") %>%
#'     add_ist("disp") %>%
#'     add_ist("hp") %>%
#'     scatter_ist() %>%
#'     sanim_ist()
#'
#' @export
sanim_ist <- function(p){

  p <- p %>%
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

  p

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

  if(length(p$x$anim$FUN)){

    foo <- paste0("
  if(data.type === 'slice') {
    var pathLength = data.element._node.getTotalLength();
    data.element.attr({
      'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
    });
    var animationDefinition = {
      'stroke-dashoffset': {
        id: 'anim' + data.index,
        dur: 1000,
        from: -pathLength + 'px',
        to:  '0px',
        easing: Chartist.Svg.Easing.easeOutQuint,
        fill: 'freeze'
      }
    };
    if(data.index !== 0) {
      animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
    }
    data.element.attr({
      'stroke-dashoffset': -pathLength + 'px'
    });
    data.element.animate(animationDefinition, false);
  }}")

  } else {
    foo <- paste0("function(data) {
  if(data.type === 'slice') {
    var pathLength = data.element._node.getTotalLength();
    data.element.attr({
      'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
    });
    var animationDefinition = {
      'stroke-dashoffset': {
        id: 'anim' + data.index,
        dur: 1000,
        from: -pathLength + 'px',
        to:  '0px',
        easing: Chartist.Svg.Easing.easeOutQuint,
        fill: 'freeze'
      }
    };
    if(data.index !== 0) {
      animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
    }
    data.element.attr({
      'stroke-dashoffset': -pathLength + 'px'
    });
    data.element.animate(animationDefinition, false);
  }}")
  }

  p <- draw_ist(p, htmlwidgets::JS(foo))

  p
}

#' Animate grid
#'
#' @param p a chartist object.
#'
#' @examples
#' mtcars %>%
#'     chart_ist("wt") %>%
#'     add_ist("disp") %>%
#'     add_ist("hp") %>%
#'     ganim_ist()
#'
#' @export
ganim_ist <- function(p){

  if(length(p$x$anim$FUN)){
    foo <- paste0("
  if(data.type === 'grid') {
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
  }}")

  } else {
    foo <- paste0("function(data){
  if(data.type === 'grid') {
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
  }}")
  }

  p <- p %>%
    draw_ist(htmlwidgets::JS(foo))

  p
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

#' Loop animation
#'
#' @param ms Milliseconds for loop.
#'
#' @examples
#' mtcars %>%
#'     chart_ist("qsec") %>%
#'     add_ist("hp") %>%
#'     lanim_ist()
#'
#' @export
loop_ist <- function(p, ms = 5000){

  if(!length(p$x$anim$FUN)) stop("no animation to loop, see anim_ist")

  p$x$loop$ms <- ms

  p
}

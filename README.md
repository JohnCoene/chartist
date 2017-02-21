[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/chartist.svg?branch=master)](https://travis-ci.org/JohnCoene/chartist)
[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/JohnCoene)

# chartist

![chartist](http://johncoene.github.io/projects/img/chartist.JPG)

R htmlwidget for [chartist.js](https://gionkunz.github.io/chartist-js).

## Install

```R
devtools::install_github("JohnCoene/chartist")
```

## Examples

```R
library(chartist)

# line
mtcars[1:20,] %>%
    chart_ist(x = rownames(.)) %>%
    add_ist("disp")

# scatter 
mtcars[1:20,] %>%
    chart_ist(x = rownames(.)) %>%
    add_ist("disp") %>%
    scatter_ist()

# area chart using options
mtcars[1:15,] %>%
    chart_ist(x = rownames(.)) %>%
    add_ist("disp") %>%
    lineopt_ist(showArea = TRUE, showPoint = FALSE)

# pie    
mtcars[1:5,] %>%
    chart_ist(type = "pie") %>%
    add_ist("disp")
    
# donut using options 
mtcars[1:5,] %>%
    chart_ist(type = "pie") %>%
    add_ist("disp") %>%
    pieopt_ist(donut = TRUE, percent = TRUE)
    
# gauge
mtcars[1:5,] %>%
    chart_ist(type = "pie") %>%
    add_ist("disp") %>%
    gauge_ist()

# bar chart   
mtcars[1:20,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    baropt_ist(stackBars = TRUE)
    
# bipolar
df <- data.frame(x = 1:50, y = sample(c(-25:25), 50))
df %>%
    chart_ist("x", type = "bar") %>%
    add_ist("y")
    
# peak chart with helper
mtcars %>%
    chart_ist("hp", type = "bar") %>%
    add_ist("disp") %>%
    peak_ist(size = 13)
```

## Plugins

```R    
# threshold plugin
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp") %>%
    thresh_ist()
    
# hover plugin
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp", name = "Tooltip") %>%
    hover_ist(prefix = "$", suffix = "%")
    
# point label plugin
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp") %>%
    label_ist()

# Axis label plugin    
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp") %>%
    xtitle_ist("Hello", offsety = 20)
```

## Options

```R    
# more on options
# customise series individually
mtcars[1:10,] %>%
   chart_ist(rownames(.)) %>%
   add_ist("mpg", "serie-1") %>%
   add_ist("qsec", "serie-2") %>%
   lineopt_ist(name = "serie-1", lineSmoothing = "step") %>%
   lineopt_ist(name = "serie-2", showArea = TRUE, showPoint = FALSE)

# missing data 
set.seed(19880525)
df <- data.frame(x = 1:50, 
    y = sample(c(1:75, rep(NA, 20)), 50), 
    z = sample(c(1:75, rep(NA, 20)), 50))
    
# holes
df %>%
    chart_ist("x") %>%
    add_ist("y") %>%
    add_ist("z") 

# fill missing data
df %>%
    chart_ist("x") %>%
    add_ist("y") %>%
    add_ist("z") %>%
    lineopt_ist(fillHoles = TRUE)
    
# multibars
mtcars[1:20,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    label_ist()

# distributed (categorical data)
mtcars[1:10,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    baropt_ist(distributeSeries = TRUE)
    
# customise axis & grid
mtcars[1:5,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    yaxis_ist(position = "end", prefix = "$", suffix = "M", showGrid = TRUE) %>%
    xaxis_ist(position = "end", showGrid = FALSE)
```

## Advanced

```R
df <- data.frame(x = 1:20, y = runif(20, 1, 20), z = runif(20, 1, 20), w = runif(20, 1, 20))

df %>%
    chart_ist("x") %>%
    add_ist("y", name = "s1") %>%
    add_ist("z", name = "s2") %>%
    add_ist("w", name = "s3") %>%
    lineopt_ist(name = "s1", showArea = TRUE, showPoint = FALSE) %>%
    lineopt_ist(name = "s2", showLine = FALSE) %>%
    lineopt_ist(name = "s3", showPoint = FALSE) %>%
    hover_ist()
    
df[1:10,] %>%
  chart_ist(x = "x", type = "bar") %>%
  add_ist(values = "y") %>%
  baropt_ist(distributeSeries = TRUE)
```

## Animate

```R
# use out-of-the-box animation for line and area
# lanim_ist
mtcars %>%
    chart_ist("wt") %>%
    add_ist("disp", name = "disp") %>%
    add_ist("hp", name = "hp") %>%
    opt_ist(showPoint = FALSE) %>%
    lineopt_ist(name = "hp", showArea = TRUE) %>%
    lanim_ist()

# use out-of-the-box animation for scatter plot
# sanim_ist    
mtcars %>%
    chart_ist("wt") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    scatter_ist() %>%
    sanim_ist()

# use out-of-the-box animation for donut chart
# danim_ist     
mtcars[1:5,] %>%
    chart_ist(x = "hp", type = "pie") %>%
    add_ist("disp") %>%
    pieopt_ist(donut = TRUE, showLabel = FALSE) %>%
    danim_ist()
    
# use out-of-the-box animation for chart grid
# ganim_ist     
mtcars %>%
    chart_ist("wt") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    ganim_ist()
    
# make your own
# line and point opacity from 0 to 1 in 2000 ms
mtcars %>%
    chart_ist("wt") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    anim_ist(type = c("line", "point"), 
        anim = "opacity", 
        begin = 0,
        from = 0,
        to = 1,
        dur = 2000)
```

--------------------------------

See [my other projects](http://johncoene.github.io/projects/)

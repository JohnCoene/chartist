[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/chartist.svg?branch=master)](https://travis-ci.org/JohnCoene/chartist)

# chartist

![chartist](http://johncoene.github.io/projects/img/chartist.JPG)

R implementation of [chartist.js](https://gionkunz.github.io/chartist-js) (htmlwidget).

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
    lineopt_ist(showArea = TRUE, showLine = FALSE, showPoint = FALSE)

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
    
# add point labels using plugin
mtcars[1:20,] %>%
    chart_ist(x = rownames(.)) %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    label_ist()
    
# threshold plugin
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp") %>%
    thresh_ist()
    
# add hover with plugin
mtcars %>%
    chart_ist(x = "hp") %>%
    add_ist("disp", name = "Tooltip") %>%
    hover_ist()
    
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
df <- data.frame(x = 1:50, y = sample(c(1:75, rep(NA, 20)), 50))
df %>%
    chart_ist("x") %>%
    add_ist("y") 

# fill missing data
df %>%
    chart_ist("x") %>%
    add_ist("y") %>%
    lineopt_ist(fillHoles = TRUE)
    
# bipolar
df <- data.frame(x = 1:50, y = sample(c(-25:25), 50))
df %>%
    chart_ist("x", type = "bar") %>%
    add_ist("y")
    
# multibars
mtcars[1:20,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    add_ist("hp") %>%
    label_ist()

# distributed (categorical data)
mtcars[1:5,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    baropt_ist(distributeSeries = TRUE)
    
# customise labels
mtcars[1:5,] %>%
    chart_ist(x = rownames(.), type = "bar") %>%
    add_ist("disp") %>%
    yaxis_ist(position = "end", prefix = "$", suffix = "M") %>%
    xaxis_ist(position = "end")
```

--------------------------------

See [my other projects](http://johncoene.github.io/projects/)

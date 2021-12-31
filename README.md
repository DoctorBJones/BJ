
# BJ Package

This package contains a suite of helper functions. Currently it contains ggplot themes, colours and palettes to more easily make pretty visualisations.

## Installation

You can install the development version of BJ from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("DoctorBJones/BJ")
```

## Examples
 There are currently six functions: three for colours and three for themes. 
 
 The colour functions allow you to:
 * select individual colours by name using bj_cols(), 
 * select palettes of colour using either scale_colour_bj() or scale_fill_bj().

``` r
library(BJ)
library(ggplot2)

ggplot(mpg, aes(manufacturer)) +
geom_bar(fill = bj_cols("light orange"))

ggplot(mpg, aes(class, fill = class)) +
geom_bar() +
scale_fill_bj()
```
You can also interpolate the palettes for use with continuous variables and reverse the colours.
```r
ggplot(mpg, aes(displ, cty, colour = cty)) + 
geom_point() + 
scale_color_bj(palette = "orange gradient", discrete = FALSE)

ggplot(mpg, aes(displ, cty, colour = cty)) + 
geom_point() + 
scale_color_bj(palette = "orange gradient", discrete = FALSE, reverse = TRUE)
```
The palettes are also ordered, so if you have fewer than 5 levels, it will automatically use the first x colours (or the last x if you use `reverse = TRUE`)
``` r
ggplot(mpg, aes(drv, fill = drv)) +
geom_bar() +
scale_fill_bj()
```
There are also three basic ggplot themes. One is for numeric data and the other two are for vertical and horizontal representations of categorical data, such as bar charts.
``` r
ggplot(mpg, aes(class, fill = class)) +
geom_bar() +
scale_fill_bj() +
theme_bj_vbar()

ggplot(mpg, aes(y = drv, fill = drv)) +
geom_bar() +
scale_fill_bj() +
theme_bj_hbar()

ggplot(mpg, aes(displ, cty, colour = cty)) + 
geom_point() + 
scale_color_bj(palette = "green gradient", discrete = FALSE) +
theme_bj_numeric()
```
Lastly, there is a function to easily create gauge plots. 
``` r
gauge_plot(0.22, text_colour = "black")
gauge_plot(0.58, text_colour = bj_cols("text grey"))
gauge_plot(0.12, reverse = TRUE)
```
The package also imports the ['Nanum Gothic'](https://fonts.google.com/specimen/Nanum+Gothic) font from Google fonts for use in all themes.




bj_colours <- c(
  "dark green"  = "#264653",
  "light green" = "#2A9D8F",
  "yellow" = "#E9C46A",
  "light orange" = "#F4A261",
  "dark orange" = "#E76F51",
  # green gradient start at 'dark green'
  "green 2" = "#2D5362",
  "green 3" = "#335F70",
  "green 4" = "#3A6B7E",
  "green 5" = "#40768C",
  "green 6" = "#47829A",
  "green 7" = "#4D8EA8",
  # orange gradient start at 'dark orange'
  "orange 2" = "#EB886F",
  "orange 3" = "#EE9781",
  "orange 4" = "#F0A693",
  "orange 5" = "#F3B5A5",
  "orange 6" = "#F5C4B7",
  "orange 7" = "#F8D3C9",
  # other colours
  "text grey" = "#bfbfbf"
)



#' Function to extract colors as hex codes
#'
#' @param ... Character names of bj_colors
#'
#' @export
bj_cols <- function(...) {

  cols <- c(...)

  if (is.null(cols))
    return (bj_colours)

  bj_colours[cols]
}


bj_palettes <- list(
  `main` = bj_cols("dark green","light green", "yellow", "light orange", "dark orange"),

  `green gradient` = bj_cols("dark green", "green 2", "green 4", "green 5", "green 7"),

  `orange gradient` = bj_cols("dark orange", "orange 2", "orange 4", "orange 5", "orange 7")
)

# Create ordered palettes
colorRamp_d <- function (colors, n,
                         bias = 1,
                         space = c("rgb", "Lab"),
                         interpolate = c("linear", "spline"),
                         alpha = FALSE) {
  
  if (bias <= 0)
    stop("'bias' must be positive")
  
  if (!missing(space) && alpha)
    stop("'alpha' must be false if 'space' is specified")
  
  colors <- t(grDevices::col2rgb(colors, alpha = alpha)/255)
  space <- match.arg(space)
  interpolate <- match.arg(interpolate)
  
  if (space == "Lab")
    colors <- grDevices::convertColor(colors, from = "sRGB", to = "Lab")
  interpolate <- switch(interpolate, linear = stats::approxfun, spline = stats::splinefun)
  
  
  if (n<nrow(colors)) colors <- colors[1:n,]
  
  if ((nc <- nrow(colors)) == 1L) {
    colors <- colors[c(1L, 1L), ]
    nc <- 2L
  }
  
  x <- seq.int(0,1, length.out = nc)^bias
  palette <- c(interpolate(x, colors[, 1L]), 
               interpolate(x, colors[, 2L]), 
               interpolate(x, colors[, 3L]),
               if (alpha) interpolate(x, colors[, 4L]))
  
  roundcolor <- function(rgb) pmax(pmin(rgb, 1), 0)
                         if (space == "Lab")
                           function (x) roundcolor(grDevices::convertColor(cbind(palette[[1L]](x),
                                                                                 palette[[2L]](x), palette[[3L]](x),
                                                                                 if (alpha)
                                                                                   palette[[4L]](x)), from = "Lab",
                                                                           to = "sRGB")) * 255
  else function (x) roundcolor(cbind(palette[[1L]](x), palette[[2L]](x),
                                     palette[[3L]](x), if (alpha)
                                       palette[[4L]](x))) * 255
  }

colorRampPalette_d <- function (colors, ...) {
  function (n) {
    ramp <- colorRamp_d(colors, n, ...)
    x <- ramp(seq.int(0, 1, length.out = n))
    if (ncol(x) == 4L)
        grDevices::rgb(x[, 1L], x[, 2L], x[, 3L], x[, 4L], maxColorValue = 255)
        else grDevices::rgb(x[, 1L], x[, 2L], x[, 3L], maxColorValue = 255)
  }
}



bj_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- bj_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette_d(pal, ...)
}

#' Color scale constructor
#'
#' @param palette Character name of palette in bj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_color_bj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- bj_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("bj_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}


#' Fill scale constructor
#'
#' @param palette Character name of palette in bj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export
scale_fill_bj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- bj_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("bj_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}

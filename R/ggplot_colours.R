
bj_colours <- c(
  "dark green"  = "264653",
  "light green" = "2A9D8F",
  "yellow" = "E9C46A",
  "light orange" = "F4A261",
  "dark orange" = "E76F51",
  # green gradient start at 'dark green'
  "green 2" = "2D5362",
  "green 3" = "335F70",
  "green 4" = "3A6B7E",
  "green 5" = "40768C",
  "green 6" = "47829A",
  "green 7" = "4D8EA8",
  # orange gradient start at 'dark orange'
  "orange 2" = "EB886F",
  "orange 3" = "EE9781",
  "orange 3" = "F0A693",
  "orange 3" = "F3B5A5",
  "orange 3" = "F5C4B7",
  "orange 3" = "F8D3C9"
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

  `green gradient` = bj_cols("dark green", "green 2", "green 3", "green 4", "green 5", "green 6", "green 7"),

  `orange gradient` = bj_cols("dark orange", "orange 2", "orange 3", "orange 4", "orange 5", "orange 6", "orange 7")
)

bj_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- bj_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  grDevices::colorRampPalette(pal, ...)
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

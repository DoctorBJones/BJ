#' Gauge plots
#' 
#' Create simple gauge plots using a proportion. Optionally select text colour, segment colour and order.
#'
#' @param percentage Percentage to be plotted as a proportion between 0 and 1
#' @param text_colour Defaults to white for dark backgrounds
#' @param first_break Lower proportion colour break. Default is 0.5
#' @param second_break Upper proportion colour break. Default is 0.8
#' @param reverse Whether to reverse the colour scheme
#' 
#' @examples 
#' \dontrun{
#' gauge_plot(0.35, text_colour = "black")
#' gauge_plot(0.85, text_colour = bj_cols("text grey"), reverse = TRUE)
#' gauge_plot(0.12, text_colour = "black", first_break = 0.1) }
#' 
#' @import grDevices
#' @import sysfonts
#' @import showtext
#' @import jsonlite
#' @import curl
#' 
#' @export
gauge_plot <- function(percentage,
                       text_colour = "white",
                       first_break = 0.5,
                       second_break = 0.8,
                       reverse = FALSE) {
  
  font = "Nanum Gothic"
  
  df <- data.frame(matrix(nrow = 1, ncol = 1))
  
  colour_breaks <- percentage_label <- NULL
  
  names(df) <- "percentage"
  df$percentage <- percentage
  df$percentage_label <- paste0(percentage*100, "%")
  
  if (reverse == FALSE) {
    df$colour_breaks = ifelse(percentage < first_break, "first_colour",
                              ifelse(percentage >= first_break & percentage < second_break, 
                                     "middle_colour", "third_colour"))
  } else if (reverse == TRUE) {
    df$colour_breaks = ifelse(percentage < first_break, "third_colour",
                              ifelse(percentage >= first_break & percentage < second_break, 
                                     "middle_colour", "first_colour"))
  }
  
  ggplot2::ggplot(df, ggplot2::aes(fill = colour_breaks, ymax = percentage, ymin = 0, xmax = 2, xmin = 1)) +
    ggplot2::geom_rect(ggplot2::aes(ymax = 1, ymin = 0, xmax = 2, xmin = 1), fill = "#ece8bd") +
    ggplot2::geom_rect() +
    ggplot2::coord_polar(theta = "y", start = -pi/2) +
    ggplot2::xlim(c(0, 2)) +
    ggplot2::ylim(c(0, 2)) +
    ggplot2::geom_text(ggplot2::aes(x = 0, y = 0, label = percentage_label),
                       size = 10, colour = text_colour, family = font) +
    ggplot2::theme_void() +
    ggplot2::scale_fill_manual(values = c("first_colour" = "#E63946",
                                          "middle_colour" = "#E9C46A",
                                          "third_colour" = "#264653")) +
    ggplot2::scale_colour_manual(values = c("first_colour" = "#E63946",
                                            "middle_colour" = "#E9C46A", 
                                            "third_colour" = "#264653")) +
    ggplot2::theme(strip.background = ggplot2::element_blank(),
                   strip.text.x = ggplot2::element_blank(),
                   rect = ggplot2::element_rect(fill = "transparent"),
                   legend.position = "none",
                   panel.background = ggplot2::element_rect(color = "transparent"),
                   plot.background = ggplot2::element_rect(fill = "transparent",
                                                           color = "transparent", size = 0),
                   plot.margin = ggplot2::unit(c(-2, -0.5, -8, -0.5), "cm")) #top, right, bottom, left
  
}
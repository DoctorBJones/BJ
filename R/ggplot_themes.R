#' Line or scatterplot theme
#'
#' @importFrom ggplot2 '%+replace%'
#' @importFrom ggplot2 'margin'
#' @import extrafont
#' @import grDevices
#' @import sysfonts
#' 
#' @export
theme_bj_numeric <- function() {
  font <- "Source Sans Pro"
  font_colour <- "#3f3f3f"
  
  ggplot2::theme_minimal() %+replace%
      ggplot2::theme(
      
        plot.margin = ggplot2::margin(1,1,1,1, "cm"),
        
        #grid elements
        panel.grid.major = ggplot2::element_blank(),
        panel.grid.minor = ggplot2::element_blank(),
        axis.ticks =  ggplot2::element_blank(),
        axis.ticks.y.left = ggplot2::element_line(
          color = "#bfbfbf",
          size = 0.5),
        
        axis.line = ggplot2::element_line(
          color = "#bfbfbf",
          size = 0.5),
        
        # text elements
        plot.title = ggplot2::element_text(
          family = font_colour,
          size = 20,
          color = font_colour,
          face = 'bold',
          hjust = 0.5,
          vjust = 4),
        
        plot.subtitle = ggplot2::element_text(
          family = font,
          size = 14,
          color = font_colour),
        
        plot.caption = ggplot2::element_text(
          family = font,
          size = 9, color = font_colour,
          hjust = 0,
          margin = ggplot2::margin(5)),
        
        axis.title = ggplot2::element_text(
          family = font,
          size = 11,
          color = font_colour),
        
        axis.text = ggplot2::element_text(
          family = font,
          size = 9,
          color = font_colour),
        
        axis.text.x = ggplot2::element_text(
          margin = margin(5, b = 10)),
        
        axis.text.y = ggplot2::element_text(
          margin = margin(r = 5, l = 10)),
        
        legend.text = ggplot2::element_text(
          family = font,
          size = 11,
          color = font_colour),
        
        legent.title = ggplot2::element_text(
          family = font,
          size = 11,
          color = font_colour)
        )
        
}

#' Vertical bar theme
#' @export
theme_bj_vbar <- function() {
  font <- "Calibri"
  font_colour <- "#3f3f3f"
  
  ggplot2::theme_minimal() %+replace%
    ggplot2::theme(
      
      plot.margin = ggplot2::margin(1,1,1,1, "cm"),
      
      #grid elements
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.ticks =  ggplot2::element_blank(),
      axis.ticks.y.left = ggplot2::element_line(
        color = "#bfbfbf",
        size = 0.5),
      
      axis.line = ggplot2::element_line(
        color = "#bfbfbf",
        size = 0.5),
      
      # text elements
      plot.title = ggplot2::element_text(
        family = font_colour,
        size = 20,
        color = font_colour,
        face = 'bold',
        hjust = 0.5,
        vjust = 4),
      
      plot.subtitle = ggplot2::element_text(
        family = font,
        size = 14,
        color = font_colour),
      
      plot.caption = ggplot2::element_text(
        family = font,
        size = 9, color = font_colour,
        hjust = 0,
        margin = ggplot2::margin(5)),
      
      axis.title = ggplot2::element_text(
        family = font,
        size = 11,
        color = font_colour),
      
      axis.text = ggplot2::element_text(
        family = font,
        size = 9,
        color = font_colour),
      
      axis.text.x = ggplot2::element_text(
        margin = margin(5, b = 10)),
      
      axis.text.y = ggplot2::element_text(
        margin = margin(r = 5, l = 10)),
      
      legend.text = ggplot2::element_text(
        family = font,
        size = 11,
        color = font_colour),
      
      legent.title = ggplot2::element_text(
        family = font,
        size = 11,
        color = font_colour),
      
      axis.line.x = ggplot2::element_blank(),
      axis.ticks.x = ggplot2::element_blank()
    )
  
}


#' Horizontal bar theme
#' @export
theme_bj_hbar <- function() {
font <- "Calibri"
font_colour <- "#3f3f3f"

ggplot2::theme_minimal() %+replace%
  ggplot2::theme(
    
    plot.margin = ggplot2::margin(1,1,1,1, "cm"),
    
    #grid elements
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    axis.ticks =  ggplot2::element_blank(),
    axis.ticks.y.left = ggplot2::element_line(
      color = "#bfbfbf",
      size = 0.5),
    
    axis.line = ggplot2::element_line(
      color = "#bfbfbf",
      size = 0.5),
    
    # text elements
    plot.title = ggplot2::element_text(
      family = font_colour,
      size = 20,
      color = font_colour,
      face = 'bold',
      hjust = 0.5,
      vjust = 4),
    
    plot.subtitle = ggplot2::element_text(
      family = font,
      size = 14,
      color = font_colour),
    
    plot.caption = ggplot2::element_text(
      family = font,
      size = 9, color = font_colour,
      hjust = 0,
      margin = ggplot2::margin(5)),
    
    axis.title = ggplot2::element_text(
      family = font,
      size = 11,
      color = font_colour),
    
    axis.text = ggplot2::element_text(
      family = font,
      size = 9,
      color = font_colour),
    
    axis.text.x = ggplot2::element_text(
      margin = margin(5, b = 10)),
    
    axis.text.y = ggplot2::element_text(
      margin = margin(r = 5, l = 10)),
    
    legend.text = ggplot2::element_text(
      family = font,
      size = 11,
      color = font_colour),
    
    legent.title = ggplot2::element_text(
      family = font,
      size = 11,
      color = font_colour),
    
    axis.line.x = ggplot2::element_blank(),
    axis.ticks.x = ggplot2::element_blank()
  )

}

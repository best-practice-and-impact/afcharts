# additional arguments
# palette
# palette_type
# reverse

#' @title wrapper function for plot_ly to produce plots using Analysis Function colour palettes
#'
#' @param data A data frame.
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus."
#'   Default value is "main6".
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#'   reversed.
#' @param ... Additional arguments passed to plot_ly.
#'
#' @returns plot_ly plot object
#'
#' @examples
#' library(ggplot2)
#' library(plotly)
#'
#'
#' iris |>
#'   plot_ly_af(x = ~Sepal.Length,
#'              y = ~Petal.Length,
#'              color = ~Species,
#'              palette = "main2") |>
#'   add_trace(type = "scatter", mode = "markers")
#'
#' @export

plot_ly_af <- function(data,
                       palette = "main6",
                       palette_type = c("af"),
                       reverse = F,
                       ...){

  plot <- suppressMessages(plotly::plotly_build(plotly::plot_ly(data,...)))

  n <- length(plot$x$data)

  plotly::plot_ly(data,
                  colors = af_palette(palette = palette,
                                      reverse = reverse,
                                      palette_type = palette_type)(n),
          ...)

}

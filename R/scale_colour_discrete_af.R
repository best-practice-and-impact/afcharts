#' @title Discrete colour scales for Analysis Function plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus."
#'   Default value is "main".
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#'   reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 discrete colour scale
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' economics_long %>%
#'   filter(variable %in% c("psavert", "uempmed")) %>%
#'   ggplot(aes(x = date, y = value, colour = variable)) +
#'   geom_line(linewidth = 1) +
#'   scale_colour_discrete_af()
#'
#' @export

scale_colour_discrete_af <- function(palette = "main",
                                     palette_type = c("af"),
                                     reverse = FALSE,
                                     ...) {

  palette_type <- match.arg(palette_type)

  ggplot2::discrete_scale("colour",
    palette = af_palette(palette, reverse, palette_type = palette_type),
    ...
  )
}

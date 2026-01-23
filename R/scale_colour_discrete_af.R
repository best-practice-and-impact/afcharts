#' @title Discrete colour scales for Analysis Function plots
#'
#' @param palette Name of palette to use from `af_colour_palettes`; e.g.
#'   `"categorical"`, `"sequential"`, `"focus"`. Default value is
#'   `"categorical"`.
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#'   reversed.
#' @param na.value Colour to set for missing values.
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 discrete colour scale
#'
#' @details If the palette is set to "categorical" or "sequential" and fewer
#'   than the maximum number of colours are required then the colours will be
#'   used in the correct order following the analysis function guidance.
#'
#'   E.g. If only two colours are required and the palette is set to
#'   `"categorical"` then the `"categorical2"` palette will be used instead,
#'   without warning.
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

scale_colour_discrete_af <- function(palette = "categorical",
                                     palette_type = c("af"),
                                     reverse = FALSE,
                                     na.value = af_pale_grey,
                                     ...) {

  palette_type <- match.arg(palette_type)

  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = af_palette(palette, reverse, palette_type = palette_type),
    na.value = na.value,
    ...
  )

}

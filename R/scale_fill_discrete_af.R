#' @title Discrete colour fill scales for Analysis Function plots
#'
#' @param palette Name of palette to use from `af_colour_palettes`; e.g.
#'   `"categorical"`, `"sequential"`, `"focus"`. Default value is
#'   `"categorical"`.
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 discrete fill scale
#'
#' @details If only two colours are required and the palette is set to
#'   `"categorical"` then the `"categorical2"` palette will be used instead, without
#'   warning.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = class, fill = class)) +
#'  geom_bar() +
#'  scale_fill_discrete_af()
#'
#' @export

scale_fill_discrete_af <- function(palette = "categorical",
                                   palette_type = c("af"),
                                   reverse = FALSE,
                                   ...) {

  palette_type <- match.arg(palette_type)

  ggplot2::discrete_scale("fill",
    palette = af_palette(palette, reverse, palette_type = palette_type),
    ...
  )
}

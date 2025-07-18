#' @title Discrete colour fill scales for Analysis Function plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus."
#' Default value is "main6".
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#' reversed.
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 discrete fill scale
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

scale_fill_discrete_af <- function(palette = "main6",
                                   palette_type = c("af"),
                                   reverse = FALSE,
                                   ...) {

  palette_type <- match.arg(palette_type)

  ggplot2::discrete_scale("fill",
    palette = af_palette(palette, reverse, palette_type = palette_type),
    ...
  )
}

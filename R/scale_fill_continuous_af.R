#' @title Continuous colour fill scales for Analysis Function plots
#'
#' @param palette Name of palette to use; e.g. "main", "sequential", "focus."
#'   Default value is "sequential".
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#' @param reverse Boolean value to indicate whether the palette should be
#'   reversed.
#' @param na_colour Colour to set for missing values.
#' @param guide A name or function used to create guide. Default is "colourbar".
#' @param ... Additional arguments passed to scale type.
#'
#' @returns ggplot2 continuous fill scale
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
#'   geom_raster() +
#'   scale_fill_continuous_af()
#'
#' @export

scale_fill_continuous_af <- function(palette = "sequential",
                                     palette_type = c("af"),
                                     reverse = FALSE,
                                     na_colour = "grey50",
                                     guide = "colourbar",
                                     ...) {

  palette_type <- match.arg(palette_type)

  palette_list <- switch(
    palette_type,
    af = afcharts::af_colour_palettes
  )

  # Error if palette doesn't exist
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(c(
      "x" = paste("`{palette}` is not a valid palette name in",
                  "`{palette_type}_colour_palettes`.")
    ))
  }

  colours <- as.vector(palette_list[[palette]])

  ggplot2::continuous_scale(
    aesthetics = "fill",
    palette    = scales::gradient_n_pal(colours, values = NULL, "Lab"),
    na.value   = na_colour,
    guide      = guide,
    ...
  )
}

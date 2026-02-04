#' Return function to use Analysis Function colour palette
#'
#' @param palette Name of palette from `af_colour_palettes`
#' @param reverse Boolean value to indicate whether the palette should be
#'   reversed
#' @param colour_names Boolean value to indicate whether colour names should be
#'   included
#' @param palette_type Currently only the Analysis Function palettes are
#'   supported. Defaults to "af".
#'
#' @noRd

af_palette <- function(palette = "categorical",
                       reverse = FALSE,
                       colour_names = FALSE,
                       palette_type = c("af")) {

  palette_type <- match.arg(palette_type)

  palette_list <- switch(
    palette_type,
    af = afcharts::af_colour_palettes
  )

  # Check valid palette name
  if (!palette %in% names(palette_list)) {
    cli::cli_abort(c(
      "x" = paste("`{palette}` is not a valid palette name ",
                  "in `{palette_type}_colour_palettes`.")
    ))
  }

  function(n) {
    n_available <- length(palette_list[[palette]])

    # Use 'categorical2' if AF categorical palette used and only 2 colours
    # required
    if (
      palette_type == "af" &&
        n == 2 &&
        palette %in% c("categorical", "main")
    ) {
      palette <- "categorical2"
    }


    # Error if more colours requested than exist in palette
    if (n > n_available) {
      cli::cli_abort(
        c(
          "x" = glue::glue(
            "There are not enough colours available in the `{palette}` ",
            "palette from `{palette_type}_colour_palettes` ",
            "({n_available} available)."
          ),
          "i" = glue::glue(
            "Accessibility guidance recommends a limit of four ",
            "colours per chart. If more than four colours are ",
            "required, first consider chart redesign. ",
            "The `categorical` colour palette allows a maximum of 6 colours ",
            "per chart."
          )
        )
      )
    }

    pal <- palette_list[[palette]][seq_len(n)]

    if (reverse) pal <- rev(pal)

    if (colour_names) {
      pal
    } else {
      as.vector(pal)
    }
  }
}

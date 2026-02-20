# nolint start
#' @title Analysis Function colour names and hex codes
#'
#' @description A vector containing colour names and their corresponding
#' hex code.
#'
#' @format A character vector
#' @source [Government Analysis Function Colours Guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)
# nolint end

"af_colour_values"


# nolint start
#' @title Analysis Function colour palettes
#'
#' @description A list grouping colours into palettes. Note that the use of the
#'   `main`, `main2` and `main6` colour palettes is deprecated. Please use
#'   `categorical` and `categorical2` instead, which give access to the same
#'   colours.
#'
#' @format A character list
#' @source [Government Analysis Function Colours Guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)
# nolint end

"af_colour_palettes"


#' @title Individual Analysis Function colours
#' @name af_colours
#' @description Quick access to individual colours from the Analysis Function colour palettes.
#' @source [Government Analysis Function Colours Guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)
#' @examples
#'
#' library(dplyr)
#' library(ggplot2)
#'
#' # Example of using af_dark_blue to colour bars
#' iris %>%
#'   group_by(Species) %>%
#'   summarise(Petal.Width = mean(Petal.Width)) %>%
#'   ggplot() +
#'   geom_col(
#'     aes(Species, Petal.Width),
#'     fill = af_dark_blue
#'  ) +
#'   scale_y_continuous(
#'     expand = expansion(c(0, 0.05))
#'   ) +
#'   theme_af()
#'

"af_dark_blue"

#' @rdname af_colours
"af_orange"

#' @rdname af_colours
"af_grey"

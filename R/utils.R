#' @title Convert millimetres to inches
#'
#' @param x Numeric value in millimetres
#'
#' @return A numerical value in inches
#'
#' @examples mm_to_inch(100)
#'
#' @export

mm_to_inch <- function(x) {

  if (!inherits(x, "numeric")) {
    cli::cli_abort("x must be numeric.")
  }

  x / 25.4

}


#' Save a plot at the correct dimensions for publishing on GOVUK
#'
#' @description
#' This is a wrapper around [ggplot2::ggsave()] with plot dimensions set for
#' publishing on GOVUK.
#'
#' @param filename File name
#' @param plot The plot to save
#' @param device File type to produce (svg, png or jpg). svg is preferred as
#'   it scales well without pixellating
#' @param path Directory to save the plot in
#' @param ... Other params passed to ggplot::ggsave
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(dplyr)
#' library(gapminder)
#'
#' use_afcharts()
#'
#' grouped_bar_data <-
#'   gapminder |>
#'   filter(year %in% c(1967, 2007) &
#'            country %in% c("United Kingdom", "Ireland", "France", "Belgium"))
#'
#' bar_chart <- ggplot(grouped_bar_data,
#'        aes(x = country, y = lifeExp, fill = as.factor(year))) +
#'   geom_bar(stat = "identity", position = "dodge") +
#'   scale_y_continuous(expand = c(0, 0)) +
#'   scale_fill_discrete_af() +
#'   labs(
#'     x = "Country",
#'     y = NULL,
#'     fill = NULL,
#'     title = "Living longer",
#'     subtitle = "Difference in life expectancy, 1967-2007",
#'     caption = "Source: Gapminder"
#'   )
#'
#'  file <- tempfile(fileext = ".svg")
#'  save_govuk(file, bar_chart, device = "svg")
#'  unlink(file)
#'
save_govuk <- function(filename,
                       plot = ggplot2::last_plot(),
                       device	= c("svg", "png", "jpg"),
                       path = NULL,
                       ...) {

  device <- match.arg(device)

  if (device == "svg"){
    width <- 712.5 / 72
    height <- 474 / 72
    units <- "in"
  } else {
    width <- 960
    height <- 640
    units <- "px"
  }

  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    device = device,
    path = path,
    width = width,
    height = height,
    units = units,
    dpi = 72,
    ...
  )

}

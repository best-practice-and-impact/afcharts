#' @title Use afcharts defaults.
#'
#' @description Set afcharts theme, colour palette and geom aesthetic defaults
#'   for ggplot2 charts.
#'
#' @param default_colour Default colour/fill for geoms. Default value is 'blue'
#'   from `af_colour_values`.
#' @param ... Arguments passed to `theme_af()`.
#'
#' @returns NULL. Function is used for side effects of setting ggplot2 plot
#'   theme, colour palette and geom aesthetic defaults.
#'
#' @examples
#' library(ggplot2)
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' use_afcharts()
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
#'
#' @export


use_afcharts <- function(default_colour =
                           afcharts::af_colour_values["dark-blue"],
                         ...) {

  # Use afcharts theme ----

  ggplot2::theme_set(theme_af(...))

  cli::cli_alert_info("Default ggplot2 theme set to `theme_af`.")


  # Use use_afcharts colour palette ----

  options(ggplot2.continuous.fill = scale_fill_continuous_af,
          ggplot2.continuous.colour = scale_colour_continuous_af,
          ggplot2.discrete.fill = scale_fill_discrete_af,
          ggplot2.discrete.colour = scale_colour_discrete_af)

  cli::cli_alert_info("Default colours set.")


  # Set default geom characteristics ----

  # Get default base sizes used in theme
  default <- formals(theme_af)

  # Replace default values with those passed to use_afcharts
  for (i in length(list(...))) {
    default <- replace(default, i, list(...)[i])
  }

  # Evaluate base_size values for use in geom defaults
  base_size <- eval(default$base_size)
  base_line_size <- eval(default$base_line_size)

  # Lines
  ggplot2::update_geom_defaults(
    geom = "line",
    new = list(colour = default_colour,
               linewidth = base_line_size)
  )

  ggplot2::update_geom_defaults(
    geom = "hline",
    new = list(colour = default_colour,
               linewidth = base_line_size)
  )

  ggplot2::update_geom_defaults(
    geom = "vline",
    new = list(colour = default_colour,
               linewidth = base_line_size)
  )

  # Col
  ggplot2::update_geom_defaults(
    geom = "col",
    new = list(fill = default_colour)
  )

  # Bar
  ggplot2::update_geom_defaults(
    geom = "bar",
    new = list(fill = default_colour)
  )

  # Text
  ggplot2::update_geom_defaults(
    geom = "text",
    new = list(colour = "black",
               size = base_size / ggplot2::.pt)
  )

  ggplot2::update_geom_defaults(
    geom = "label",
    new = list(colour = "black",
               size = base_size / ggplot2::.pt)
  )

  # Point
  ggplot2::update_geom_defaults(
    geom = "point",
    new = list(colour = default_colour,
               fill   = default_colour,
               size   = base_size / 8)
  )

  cli::cli_alert_info("Default geom aesthetics set.")

  NULL

}

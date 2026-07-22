#' @title Use afcharts defaults.
#'
#' @description Set afcharts theme, colour palette and geom aesthetic defaults
#'   for ggplot2 charts.
#'
#' @param default_colour Default colour/fill for geoms. Default value is 'blue'
#'   from `af_colour_values`.
#' @param ... Arguments passed to `theme_af()`.
#' @param reset Logical. Turn off use_afcharts. This aims to reset the default
#'   chart setting to their status when `use_afcharts` was first called.
#'
#' @returns NULL. Function is used for side effects of setting ggplot2 plot
#'   theme, colour palette and geom aesthetic defaults.
#'
#' @examples
#' library(afcharts)
#' library(ggplot2)
#' 
#' set_theme(theme_grey(base_size = 12))
#'
#' d <- subset(mpg, manufacturer == "ford")
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class)) + geom_bar()
#'
#' use_afcharts()
#' set_theme(theme_af(base_size = 12))
#'
#' ggplot(d, aes(x = model)) + geom_bar()
#' ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
#'
#' use_afcharts(reset = TRUE)
#' @export


use_afcharts <- function(default_colour =
                           afcharts::af_colour_values["dark-blue"],
                         ...,
                         reset = FALSE) {

  if (!rlang::is_bool(reset)) {
    cli::cli_abort("{.arg reset} must be {.code TRUE} or {.code FALSE}")
  }

  if (isFALSE(reset)) {

    dots <- list(...)

    # Set options for all theme_af arguments provided in ...

    theme_args <- intersect(names(dots), names(formals(theme_af)))
    options(
      setNames(
        dots[theme_args],
        paste0("afcharts.", theme_args, recycle0 = TRUE)
      )
    )


    # Use afcharts theme ----

    old_theme <- ggplot2::theme_set(theme_af(...))

    if (!isTRUE(getOption("afcharts.use_afcharts"))) {
      options("afcharts.old.theme" = old_theme)
    }

    cli::cli_alert_info("Default ggplot2 theme set to `theme_af`.")


    # Use use_afcharts colour palette ----

    old_scales <- options(
      ggplot2.continuous.fill = scale_fill_continuous_af,
      ggplot2.continuous.colour = scale_colour_continuous_af,
      ggplot2.discrete.fill = scale_fill_discrete_af,
      ggplot2.discrete.colour = scale_colour_discrete_af
    )

    if (!isTRUE(getOption("afcharts.use_afcharts"))) {
      options("afcharts.old.scales" = old_scales)
    }


    cli::cli_alert_info("Default colour palettes set.")


    # Set default geom characteristics ----

    # Get default base sizes used in theme
    default <- formals(theme_af)

    # Evaluate base_size values for use in geom defaults
    base_size <- eval(default$base_size)
    base_line_size <- eval(default$base_line_size)

    # Lines
    old_line <- ggplot2::update_geom_defaults(
      geom = "line",
      new = list(colour = default_colour,
                 linewidth = base_line_size)
    )

    old_hline <- ggplot2::update_geom_defaults(
      geom = "hline",
      new = list(colour = default_colour,
                 linewidth = base_line_size)
    )

    old_vline <- ggplot2::update_geom_defaults(
      geom = "vline",
      new = list(colour = default_colour,
                 linewidth = base_line_size)
    )

    # Col
    old_col <- ggplot2::update_geom_defaults(
      geom = "col",
      new = list(fill = default_colour)
    )

    # Bar
    old_bar <- ggplot2::update_geom_defaults(
      geom = "bar",
      new = list(fill = default_colour)
    )

    # Text
    old_text <- ggplot2::update_geom_defaults(
      geom = "text",
      new = list(colour = "black",
                 size = base_size / ggplot2::.pt)
    )

    old_label <- ggplot2::update_geom_defaults(
      geom = "label",
      new = list(colour = "black",
                 size = base_size / ggplot2::.pt)
    )

    # Point
    old_point <- ggplot2::update_geom_defaults(
      geom = "point",
      new = list(colour = default_colour,
                 fill   = default_colour,
                 size   = base_size / 8)
    )


    if (!isTRUE(getOption("afcharts.use_afcharts"))) {
      options(
        afcharts.old.geoms = list(
          line = old_line,
          hline = old_hline,
          vline = old_vline,
          col = old_col,
          bar = old_bar,
          text = old_text,
          label = old_label,
          point = old_point
        )
      )
    }

    cli::cli_alert_info("Default geom aesthetics set.")

    # Record that using use_af ----

    options("afcharts.use_afcharts" = TRUE)

    invisible(NULL)

  } else {

    if (isTRUE(getOption("afcharts.use_afcharts"))) {

      # Reset theme
      old_theme <- getOption("afcharts.old.theme")

      if (!is.null(old_theme)) {
        ggplot2::theme_set(old_theme)
        cli::cli_alert_info("Reverting theme.")
        options("afcharts.old.theme" = NULL)
      }

      # Reset scales
      old_scales <- getOption("afcharts.old.scales")

      if (!is.null(old_scales)) {
        options(old_scales)
        cli::cli_alert_info("Reverting colour palettes.")
        options("afcharts.old.scales" = NULL)
      }

      # Reset geoms

      old_geoms <- getOption("afcharts.old.geoms")

      if (!is.null(old_geoms)) {
        purrr::walk2(
          names(old_geoms), old_geoms,
          \(geom, default) {
            ggplot2::update_geom_defaults(geom, default)
          }

        )
        cli::cli_alert_info("Reverting geom aesthetics.")
        options("afcharts.old.geoms" = NULL)
      }

      theme_args <- names(formals(theme_af))
      options(
        setNames(
          vector("list", length = length(theme_args)),
          paste0("afcharts.", theme_args)
        )
      )

      # Turn off use_afcharts
      options("afcharts.use_afcharts" = NULL)

    }


  }
}

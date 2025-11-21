# Snapshot tests ---------------------------------------------------------------

test_that("theme_af works", {

  plot <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(x = class)) +
    ggplot2::geom_bar() +
    theme_af()

  expect_match_plot("theme_af", plot)
})


test_that("theme_af works with non default options", {

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      grid = "x",
      axis = "none",
      ticks = "y",
      legend = "bottom"
    )

  expect_match_plot("theme_af_non_default", plot)


  plot2 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      grid = "xy",
      ticks = "none",
      axis_title = "none",
      axis_text = "none",
      legend_title = "none"
    )

  expect_match_plot("theme_af_non_default2", plot2)


  plot3 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      grid = "none",
      ticks = "y",
      axis_title = "x",
      axis_text = "y",
      legend_title = "show"
    )

  expect_match_plot("theme_af_non_default3", plot3)

  plot4 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      grid = "x",
      ticks = "xy",
      axis_title = "y",
      axis_text = "x",
      legend_title = "none"
    )

  expect_match_plot("theme_af_non_default4", plot4)

})


test_that("scale_fill_discrete_af works", {

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot <- ggplot2::ggplot(d, ggplot2::aes(x = class, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af()

  expect_match_plot("scale_fill_discrete_af", plot)
})


test_that("scale_fill_continuous_af works", {

  plot <- ggplot2::ggplot(
    ggplot2::faithfuld,
    ggplot2::aes(x = waiting, y = eruptions, fill = density)
  ) +
    ggplot2::geom_raster() +
    scale_fill_continuous_af()

  expect_match_plot("scale_fill_continuous_af", plot)
})


test_that("scale_colour_discrete_af works", {

  plot <- ggplot2::economics_long %>%
    dplyr::filter(variable %in% c("psavert", "uempmed")) %>%
    ggplot2::ggplot(ggplot2::aes(x = date, y = value, colour = variable)) +
    ggplot2::geom_line(linewidth = 1) +
    scale_colour_discrete_af()

  expect_match_plot("scale_colour_discrete_af", plot)
})


test_that("scale_colour_continuous_af works", {

  plot <- ggplot2::ggplot(mtcars, ggplot2::aes(x = mpg, y = wt, colour = cyl)) +
    ggplot2::geom_point() +
    scale_colour_continuous_af()

  expect_match_plot("scale_colour_continuous_af", plot)
})


# Test use_afcharts

test_that("use_afcharts works", {

  # Set default theme, geom and colour scale

  # Set theme

  old_theme <- ggplot2::theme_set(ggplot2::theme_dark())

  withr::defer(ggplot2::theme_set(old_theme))


  # Set geom

  old_geom <- ggplot2::update_geom_defaults(
    geom = "bar",
    new = list(fill = "red")
  )

  withr::defer(
    ggplot2::update_geom_defaults(
      geom = "bar",
      new = old_geom
    )
  )


  # Set scale

  old_options <- options(ggplot2.discrete.fill = ggplot2::scale_fill_viridis_d)
  withr::defer(options(old_options))


  # Turn on use_afcharts - should ignore the above defaults

  use_afcharts()

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot1 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar()

  plot2 <- ggplot2::ggplot(d, ggplot2::aes(x = model)) +
    ggplot2::geom_bar()

  expect_match_plot("use_afcharts_1", plot1)
  expect_match_plot("use_afcharts_2", plot2)


  # Turn use_afcharts off and check default plot settings revert to what they
  # were prior to using use_afcharts

  use_afcharts(reset = TRUE)

  plot3 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar()

  plot4 <- ggplot2::ggplot(d, ggplot2::aes(x = model)) +
    ggplot2::geom_bar()

  expect_match_plot("use_afcharts_3", plot3)
  expect_match_plot("use_afcharts_4", plot4)

})

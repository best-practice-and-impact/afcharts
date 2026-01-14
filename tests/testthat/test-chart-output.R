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

  # Default arguments
  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot1 <- ggplot2::ggplot(d, ggplot2::aes(x = class, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af()

  expect_match_plot("scale_fill_discrete_af1", plot1)


  # Custom arguments
  d2 <- d
  d2$class[d2$class == "suv"] <- NA

  plot2 <- ggplot2::ggplot(d2, ggplot2::aes(x = class, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af(palette = "sequential", na.value = "orange")

  expect_match_plot("scale_fill_discrete_af2", plot2)

})


test_that("scale_fill_continuous_af works", {

  #Default arguments
  plot1 <- ggplot2::ggplot(
    ggplot2::faithfuld,
    ggplot2::aes(x = waiting, y = eruptions, fill = density)
  ) +
    ggplot2::geom_raster() +
    scale_fill_continuous_af()

  expect_match_plot("scale_fill_continuous_af1", plot1)

  # Custom arguments
  faithfuld2 <- ggplot2::faithfuld
  faithfuld2$density[1:100] <- NA

  plot2 <- ggplot2::ggplot(
    faithfuld2,
    ggplot2::aes(x = waiting, y = eruptions, fill = density)
  ) +
    ggplot2::geom_raster() +
    scale_fill_continuous_af(
      palette = "categorical",
      na.value = "red",
      guide = "coloursteps"
    )

  expect_match_plot("scale_fill_continuous_af2", plot2)

})


test_that("scale_colour_discrete_af works", {

  # Default arguments
  plot1 <- ggplot2::economics_long |>
    dplyr::filter(variable %in% c("psavert", "uempmed")) |>
    ggplot2::ggplot(ggplot2::aes(x = date, y = value, colour = variable)) +
    ggplot2::geom_line(linewidth = 1) +
    scale_colour_discrete_af()

  expect_match_plot("scale_colour_discrete_af1", plot1)

  # Custom arguments
  economics_long2 <- ggplot2::economics_long
  economics_long2$variable[economics_long2$variable == "psavert"] <- NA

  plot2 <- economics_long2 |>
    dplyr::filter(variable %in% c(NA, "uempmed")) |>
    ggplot2::ggplot(ggplot2::aes(x = date, y = value, colour = variable)) +
    ggplot2::geom_line(linewidth = 1, na.rm = FALSE) +
    scale_colour_discrete_af(palette = "sequential", na.value = "red")

  expect_match_plot("scale_colour_discrete_af2", plot2)

})


test_that("scale_colour_continuous_af works", {

  # Default arguments
  plot1 <- ggplot2::ggplot(
    mtcars,
    ggplot2::aes(x = mpg, y = wt, colour = cyl)
  ) +
    ggplot2::geom_point() +
    scale_colour_continuous_af()

  expect_match_plot("scale_colour_continuous_af1", plot1)

  # Custom arguments
  mtcars2 <- mtcars
  mtcars2$cyl[1:5] <- NA

  plot2 <- ggplot2::ggplot(
    mtcars2,
    ggplot2::aes(x = mpg, y = wt, colour = cyl)
  ) +
    ggplot2::geom_point() +
    scale_colour_continuous_af(
      palette = "categorical",
      na.value = "green",
      guide = "coloursteps"
    )

  expect_match_plot("scale_colour_continuous_af2", plot2)

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
  d2 <- d
  d2$class[d2$class == "suv"] <- NA

  # No scale function
  plot1 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar()

  plot2 <- ggplot2::ggplot(d, ggplot2::aes(x = model)) +
    ggplot2::geom_bar()

  # Standard scale function
  plot3 <- ggplot2::ggplot(d2, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar() +
    ggplot2::scale_fill_discrete(na.value = "green")

  # afcharts scale function
  plot4 <- ggplot2::ggplot(d2, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af(na.value = "green")

  expect_match_plot("use_afcharts_1", plot1)
  expect_match_plot("use_afcharts_2", plot2)
  expect_match_plot("use_afcharts_3", plot3)
  expect_match_plot("use_afcharts_4", plot4)

  # Turn use_afcharts off and check default plot settings revert to what they
  # were prior to using use_afcharts

  use_afcharts(reset = TRUE)

  plot5 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar()

  plot6 <- ggplot2::ggplot(d, ggplot2::aes(x = model)) +
    ggplot2::geom_bar()

  expect_match_plot("use_afcharts_5", plot5)
  expect_match_plot("use_afcharts_6", plot6)

})

# Test theme_af()

test_that("theme_af() inherits arguments from use_afcharts() including defaults", {

  use_afcharts(reset = TRUE)
  use_afcharts(base_size = 20,
               base_rect_size = 10,
               grid = "x",
               axis = "xy",
               ticks = "none",
               legend = "left")

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot5 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar() +
    theme_af()

  expect_match_plot("use_afcharts_5", plot5)

  use_afcharts(reset = TRUE)
})

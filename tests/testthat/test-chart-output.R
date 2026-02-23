# Snapshot tests ---------------------------------------------------------------

test_that("theme_af works", {

  plot1 <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(x = class)) +
    ggplot2::geom_bar() +
    theme_af()

  expect_match_plot("theme_af1", plot1)

})


test_that("theme_af works with non default options", {

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot1 <- ggplot2::ggplot(
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

  expect_match_plot("theme_af_non_default1", plot1)


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


  plot5 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      legend = "none"
    )

  expect_match_plot("theme_af_non_default5", plot5)


  plot6 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      legend = "top-left"
    )

  expect_match_plot("theme_af_non_default6", plot6)


  plot7 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      legend = "left-centre"
    )

  expect_match_plot("theme_af_non_default7", plot7)


  plot8 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      legend = "right-bottom"
    )

  expect_match_plot("theme_af_non_default8", plot8)


  plot9 <- ggplot2::ggplot(
    d,
    ggplot2::aes(x = model, fill = class, colour = class)
  ) +
    ggplot2::geom_bar() +
    theme_af(
      legend = "bottom-centre"
    )

  expect_match_plot("theme_af_non_default9", plot9)

})


test_that("scale_fill_discrete_af works", {

  # Default arguments
  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot1 <- ggplot2::ggplot(d, ggplot2::aes(x = class, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af()

  expect_match_plot("scale_fill_discrete_af1", plot1)


  # Custom arguments

  d2 <- data.frame(
    age = factor(
      c("<25", "25-44", "45-54", "55-64", "65 plus", NA),
      levels = c("<25", "25-44", "45-54", "55-64", "65 plus", NA)
    ),
    score = c(20, 34, 44, 88, 90, 40)
  )

  plot2 <- ggplot2::ggplot(d2, ggplot2::aes(x = age, y = score, fill = age)) +
    ggplot2::geom_col() +
    scale_fill_discrete_af(palette = "sequential", na.value = "red")

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

test_that("theme_af() inherits arguments from use_afcharts()", {

  use_afcharts(reset = TRUE)

  use_afcharts(
    base_size = 20,
    base_line_size = 15,
    base_rect_size = 10,
    grid = "x",
    axis = "xy",
    ticks = "none",
    legend = "left",
    axis_text = "x",
    axis_title = "y",
    legend_title = "none"
  )

  d <- subset(ggplot2::mpg, manufacturer == "ford")

  plot1 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar() +
    theme_af()

  expect_match_plot("use_afcharts_theme_af1", plot1)

  plot2 <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class)) +
    ggplot2::geom_bar() +
    theme_af(base_size = 5, legend_title = "show")

  expect_match_plot("use_afcharts_theme_af2", plot2)

  use_afcharts(reset = TRUE)

})

# Restart R session before rerunning these tests as otherwise use_afcharts will
# remain active and effect the earlier charts.

# Wrapper functions for testing ------------------------------------------------

save_svg <- function(plot, file, title = ""){
  if (title != "" && !"title" %in% names(plot$labels)) {
    plot <- plot +
      ggplot2::ggtitle(title)
  }

  on.exit(grDevices::dev.off())
  vdiffr:::svglite(file)
  print(plot)
}

expect_match_plot <- function(...) {
  vdiffr::expect_doppelganger(writer = save_svg, ...)
}

# Load test data ---------------------------------------------------------------

data(mpg, package = "ggplot2")
data(faithfuld, package = "ggplot2")
data(economics_long, package = "ggplot2")

# Snapshot tests ---------------------------------------------------------------

test_that("theme_af works", {

  plot <- ggplot2::ggplot(mpg, ggplot2::aes(x = class)) +
    ggplot2::geom_bar() +
    theme_af()

  expect_match_plot("theme_af", plot)
})


test_that("theme_af works with non default options", {

  d <- subset(mpg, manufacturer == "ford")

  plot <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class, colour = class)) +
    ggplot2::geom_bar() +
    theme_af(
      grid = "x",
      axis = "none",
      ticks = "y",
      legend = "bottom"
    )

  expect_match_plot("theme_af_non_default", plot)
})


test_that("scale_fill_discrete_af works", {

  d <- subset(mpg, manufacturer == "ford")

  plot <- ggplot2::ggplot(d, ggplot2::aes(x = class, fill = class)) +
    ggplot2::geom_bar() +
    scale_fill_discrete_af()

  expect_match_plot("scale_fill_discrete_af", plot)
})


test_that("scale_fill_continuous_af works", {

  plot <- ggplot2::ggplot(faithfuld, ggplot2::aes(x = waiting, y = eruptions, fill = density)) +
    ggplot2::geom_raster() +
    scale_fill_continuous_af()

  expect_match_plot("scale_fill_continuous_af", plot)
})


test_that("scale_colour_discrete_af works", {

  plot <- economics_long %>%
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


test_that("use_afcharts works", {

  use_afcharts()

  d <- subset(mpg, manufacturer == "ford")

  plot <- ggplot2::ggplot(d, ggplot2::aes(x = model, fill = class, colour = class)) +
    ggplot2::geom_bar()

  expect_match_plot("use_afcharts", plot)
})

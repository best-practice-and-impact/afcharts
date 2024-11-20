# Wrapper functions for testing ------------------------------------------------

save_svg <- function(plot, file, title = ""){
  if (title != "" && !"title" %in% names(plot$labels)) {
    plot <- plot +
      ggtitle(title)
  }

  on.exit(grDevices::dev.off())
  vdiffr:::svglite(file)
  print(plot)
}

expect_match_plot <- function(...) {
  vdiffr::expect_doppelganger(writer = save_svg, ...)
}


# Snapshot tests ---------------------------------------------------------------

test_that("theme_af works", {

  plot <- ggplot(mpg, aes(x = class)) + geom_bar() +
    theme_af()

  expect_match_plot("theme_af", plot)
})


test_that("theme_af works with non default options", {

  d <- subset(mpg, manufacturer == "ford")

  plot <- ggplot(d, aes(x = model, fill = class, colour = class)) +
    geom_bar() +
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

  plot <- ggplot(d, aes(x = class, fill = class)) +
    geom_bar() +
    scale_fill_discrete_af()

  expect_match_plot("scale_fill_discrete_af", plot)
})


test_that("scale_fill_continuous_af works", {

  plot <- ggplot(faithfuld, aes(x = waiting, y = eruptions, fill = density)) +
    geom_raster() +
    scale_fill_continuous_af()

  expect_match_plot("scale_fill_continuous_af", plot)
})


test_that("scale_colour_discrete_af works", {

  plot <- economics_long %>%
    filter(variable %in% c("psavert", "uempmed")) %>%
    ggplot(aes(x = date, y = value, colour = variable)) +
    geom_line(linewidth = 1) +
    scale_colour_discrete_af()

  expect_match_plot("scale_colour_discrete_af", plot)
})


test_that("scale_colour_continuous_af works", {

  plot <- ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
    geom_point() +
    scale_colour_continuous_af()

  expect_match_plot("scale_colour_continuous_af", plot)
})


test_that("use_afcharts works", {

  use_afcharts()

  d <- subset(mpg, manufacturer == "ford")

  plot <- ggplot(d, aes(x = model, fill = class, colour = class)) +
    geom_bar()

  expect_match_plot("use_afcharts", plot)
})

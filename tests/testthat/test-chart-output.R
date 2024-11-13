save_svg <- function(plot, file, title = ""){
  if (title != "" && !"title" %in% names(plot$labels)) {
    plot <- plot +
      ggtitle(title)
  }

  vdiffr:::svglite(file)
  on.exit(grDevices::dev.off())
  print(plot)
}

expect_match_plot <- function(...) {
  expect_doppelganger(writer = save_svg, ...)
}

test_that("use_afcharts works", {

  d <- subset(mpg, manufacturer == "ford")
  use_afcharts()
  plot <- ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()
  expect_match_plot("use_afcharts", plot)
})

# Wrapper functions for snapshot testing ---------------------------------------

# By default vdiffr::expect_doppelganger calls write_svg to save the charts.
# We can't use write_svg as it sets the chart theme to theme_test.

save_svg <- function(plot, file, title = "") {
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

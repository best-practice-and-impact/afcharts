# Save a plot at the correct dimensions for publishing on GOVUK

This is a wrapper around
[`ggplot2::ggsave()`](https://ggplot2.tidyverse.org/reference/ggsave.html)
with plot dimensions set for publishing on GOVUK.

## Usage

``` r
save_govuk(
  filename,
  plot = ggplot2::last_plot(),
  device = c("svg", "png", "jpg"),
  path = NULL,
  ...
)
```

## Arguments

- filename:

  File name

- plot:

  The plot to save

- device:

  File type to produce (svg, png or jpg). svg is preferred as it scales
  well without pixelating

- path:

  Directory to save the plot in

- ...:

  Other params passed to ggplot::ggsave

## Value

Character vector giving path to saved file

## Examples

``` r
library(ggplot2)
library(dplyr)
library(gapminder)

# Images on GOVUK are shrunk. We therefore recommend using font size 20 pt
# when exporting charts for GOVUK, which will appear as approximately 12 pt on
# the website.
use_afcharts(base_size = 20)
#> ℹ Default ggplot2 theme set to `theme_af`.
#> ℹ Default colour palettes set.
#> ℹ Default geom aesthetics set.

grouped_bar_data <-
  gapminder |>
  filter(year %in% c(1967, 2007) &
           country %in% c("United Kingdom", "Ireland", "France", "Belgium"))

bar_chart <- ggplot(grouped_bar_data,
       aes(x = country, y = lifeExp, fill = as.factor(year))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_discrete_af() +
  labs(
    x = "Country",
    y = NULL,
    fill = NULL,
    title = "Living longer",
    subtitle = "Difference in life expectancy, 1967-2007",
    caption = "Source: Gapminder"
  )

 file <- tempfile(fileext = ".svg")
 save_govuk(file, bar_chart, device = "svg")
 unlink(file)
```

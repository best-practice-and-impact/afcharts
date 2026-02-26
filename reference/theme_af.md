# Analysis Function theme for ggplot2 charts.

ggplot2 theme for Analysis Function plots.

## Usage

``` r
theme_af(
  base_size = getOption("afcharts.base_size", 14),
  base_line_size = getOption("afcharts.base_line_size", base_size/24),
  base_rect_size = getOption("afcharts.base_rect_size", base_size/24),
  grid = getOption("afcharts.grid", "y"),
  axis = getOption("afcharts.axis", "x"),
  ticks = getOption("afcharts.ticks", "xy"),
  legend = getOption("afcharts.legend", "right"),
  axis_text = getOption("afcharts.axis_text", "xy"),
  axis_title = getOption("afcharts.axis_title", "xy"),
  legend_title = getOption("afcharts.legend_title", "show")
)
```

## Arguments

- base_size:

  base font size, given in pts.

- base_line_size:

  base size for line elements.

- base_rect_size:

  base size for rect elements.

- grid, axis, ticks:

  'x', 'y', 'xy' or 'none' to determine for which axes the attribute
  should be drawn. Grid defaults to 'y', axis to 'x', and ticks to 'xy'.

- legend:

  'right', 'left', 'top', 'bottom' or 'none' to determine the position
  of the legend. This can also be followed by a justification along that
  side (top, bottom, left, right or centre) e.g. 'top-left',
  'left-bottom', 'right-centre'. Defaults to 'right'.

- axis_text, axis_title:

  'x', 'y', 'xy' or 'none' to determine whether axis text and/or axis
  titles should be displayed. Text defaults to 'xy', as does title. Note
  that axis text refers to the 'labels' under the tick marks.

- legend_title:

  Set to 'none' to suppress legend titles. Defaults to 'show'.

## Value

ggplot2 plot theme

## Examples

``` r
library(ggplot2)

p <- ggplot(mpg, aes(x = class)) + geom_bar()

p

p + theme_af()

```

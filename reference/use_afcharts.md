# Use afcharts defaults.

Set afcharts theme, colour palette and geom aesthetic defaults for
ggplot2 charts.

## Usage

``` r
use_afcharts(
  default_colour = afcharts::af_colour_values["dark-blue"],
  ...,
  reset = FALSE
)
```

## Arguments

- default_colour:

  Default colour/fill for geoms. Default value is 'blue' from
  `af_colour_values`.

- ...:

  Arguments passed to
  [`theme_af()`](https://best-practice-and-impact.github.io/afcharts/reference/theme_af.md).

- reset:

  Logical. Turn off use_afcharts. This aims to reset the default chart
  setting to their status when `use_afcharts` was first called.

## Value

NULL. Function is used for side effects of setting ggplot2 plot theme,
colour palette and geom aesthetic defaults.

## Examples

``` r
library(ggplot2)

d <- subset(mpg, manufacturer == "ford")

ggplot(d, aes(x = model)) + geom_bar()

ggplot(d, aes(x = model, fill = class)) + geom_bar()


use_afcharts()
#> ℹ Default ggplot2 theme set to `theme_af`.
#> ℹ Default colour palettes set.
#> ℹ Default geom aesthetics set.

ggplot(d, aes(x = model)) + geom_bar()

ggplot(d, aes(x = model, fill = class, colour = class)) + geom_bar()

```

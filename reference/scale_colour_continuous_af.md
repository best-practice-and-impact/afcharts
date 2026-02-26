# Continuous colour scales for Analysis Function plots

Continuous colour scales for Analysis Function plots

## Usage

``` r
scale_colour_continuous_af(
  palette = "sequential",
  palette_type = c("af"),
  reverse = FALSE,
  na.value = afcharts::af_pale_grey,
  guide = "colourbar",
  ...
)
```

## Arguments

- palette:

  Name of palette to use from `af_colour_palettes`; e.g.
  `"categorical"`, `"sequential"`, `"focus"`. Default value is
  `"sequential"`.

- palette_type:

  Currently only the Analysis Function palettes are supported. Defaults
  to "af".

- reverse:

  Boolean value to indicate whether the palette should be reversed.

- na.value:

  Colour to set for missing values.

- guide:

  A name or function used to create guide. Default is "colourbar".

- ...:

  Additional arguments passed to scale type.

## Value

ggplot2 continuous colour scale

## Examples

``` r
library(ggplot2)

ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl)) +
  geom_point() +
  scale_colour_continuous_af()

```

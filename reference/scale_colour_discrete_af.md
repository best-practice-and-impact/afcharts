# Discrete colour scales for Analysis Function plots

Discrete colour scales for Analysis Function plots

## Usage

``` r
scale_colour_discrete_af(
  palette = "categorical",
  palette_type = c("af"),
  reverse = FALSE,
  na.value = afcharts::af_pale_grey,
  ...
)
```

## Arguments

- palette:

  Name of palette to use from `af_colour_palettes`; e.g.
  `"categorical"`, `"sequential"`, `"focus"`. Default value is
  `"categorical"`.

- palette_type:

  Currently only the Analysis Function palettes are supported. Defaults
  to "af".

- reverse:

  Boolean value to indicate whether the palette should be reversed.

- na.value:

  Colour to set for missing values.

- ...:

  Additional arguments passed to scale type.

## Value

ggplot2 discrete colour scale

## Details

If the palette is set to "categorical" or "sequential" and fewer than
the maximum number of colours are required then the colours will be used
in the correct order following the analysis function guidance.

E.g. If only two colours are required and the palette is set to
`"categorical"` then the `"categorical2"` palette will be used instead,
without warning.

## Examples

``` r
library(ggplot2)
library(dplyr)

economics_long %>%
  filter(variable %in% c("psavert", "uempmed")) %>%
  ggplot(aes(x = date, y = value, colour = variable)) +
  geom_line(linewidth = 1) +
  scale_colour_discrete_af()

```

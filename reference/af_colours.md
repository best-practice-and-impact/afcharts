# Individual Analysis Function colours

Quick access to individual colours from the Analysis Function colour
palettes.

## Usage

``` r
af_dark_blue

af_orange

af_grey

af_pale_grey
```

## Format

An object of class `character` of length 1.

An object of class `character` of length 1.

An object of class `character` of length 1.

An object of class `character` of length 1.

## Source

[Government Analysis Function Colours
Guidance](https://analysisfunction.civilservice.gov.uk/policy-store/data-visualisation-colours-in-charts/)

## Examples

``` r

library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
library(ggplot2)

# Example of using af_dark_blue to colour bars
iris %>%
  group_by(Species) %>%
  summarise(Petal.Width = mean(Petal.Width)) %>%
  ggplot() +
  geom_col(
    aes(Species, Petal.Width),
    fill = af_dark_blue
 ) +
  scale_y_continuous(
    expand = expansion(c(0, 0.05))
  ) +
  theme_af()

```

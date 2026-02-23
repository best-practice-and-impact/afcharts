# afcharts 0.5.0

- Updated the `sequential` colour palette to add two new shades (`darkest-blue` and `lightest-blue`).
 This means that the `sequential` palette can now be used to represent five categories, such as deprivation quintiles.

- Renamed `na_colour` argument of `scale_colour_continuous_af` and `scale_fill_continuous_af` to `na.value`. This was necessary to enable `use_afcharts` to work with ggplot2 v4.0.1. Added `na.value` argument to `scale_colour_discrete_af` and `scale_fill_discrete_af`.

- `use_afcharts` gains a `reset` argument to turn off analysis function styling of charts.

- `theme_af` now uses theme options set by earlier calls of `use_afcharts` by default. #51

- Set the `main` colour palettes to `categorical`. The Scale_*_discrete_af functions now use the 6 colour cateogrical palette by default, rather than the 4 colour.

- Added `af_dark_blue`, `af_orange` and `af_grey` to give easier access to the hex codes of these colours.

- Added arguments `axis_text` and `axis_title` to function `theme_af` to set 
whether to show axis titles and labels.

- Added argument `legend_title` to function `theme_af` to set whether to show 
legend titles.

- The `legend` argument of `theme_af` now accepts a legend justification e.g. 'top-right', 'left-centre' #47


# afcharts 0.4.1

-   Fixed bug which prevented some functions from working if called directly without attaching the package.

-   Fixed bug in `use_afcharts` when passing args to `theme_af`.

-   `scale_colour_discrete_af` and `scale_fill_discrete_af` now inform rather than warn when the `main2` colour palette is used instead of `main` if only two colours are required.

# afcharts 0.4.0

First release of package based on [sgplot](https://scotgovanalysis.github.io/sgplot/).

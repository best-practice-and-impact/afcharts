# afcharts (development version)
- Set the `main` colour palettes to `categorical`. The Scale_*_discrete_af functions now use the 6 colour cateogrical palette by default, rather than the 4 colour.

- Added `af_dark_blue`, `af_orange` and `af_grey` to give easier access to the hex codes of these colours.

# afcharts 0.4.1

-   Fixed bug which prevented some functions from working if called directly without attaching the package.

-   Fixed bug in `use_afcharts` when passing args to `theme_af`.

-   `scale_colour_discrete_af` and `scale_fill_discrete_af` now inform rather than warn when the `main2` colour palette is used instead of `main` if only two colours are required.

# afcharts 0.4.0

First release of package based on [sgplot](https://scotgovanalysis.github.io/sgplot/).

## Resubmission
This is a resubmission with no changes. I believe the previous submission failed
due to the binary for the gridtext package (v0.1.6) being built at the same time
on CRAN so it wasn't available. gridtext is a dependency or ggtext. ggtext is
used in afcharts vignettes and is listed in suggests. I've checked afcharts on a
windows machine for R-release and R-devel and there were no issues. I've also
check on macOs and ubuntu R-release and R-devel.

## R CMD check results

0 errors | 0 warnings | 0 note


% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_colour_discrete_af.R
\name{scale_colour_discrete_af}
\alias{scale_colour_discrete_af}
\title{Discrete colour scales for Analysis Function plots}
\usage{
scale_colour_discrete_af(
  palette = "main",
  palette_type = c("af"),
  reverse = FALSE,
  ...
)
}
\arguments{
\item{palette}{Name of palette to use; e.g. "main", "sequential", "focus."
Default value is "main".}

\item{palette_type}{Currently only the Analysis Function palettes are
supported. Defaults to "af".}

\item{reverse}{Boolean value to indicate whether the palette should be
reversed.}

\item{...}{Additional arguments passed to scale type.}
}
\description{
Discrete colour scales for Analysis Function plots
}
\examples{
library(ggplot2)
library(dplyr)

economics_long \%>\%
  filter(variable \%in\% c("psavert", "uempmed")) \%>\%
  ggplot(aes(x = date, y = value, colour = variable)) +
  geom_line(linewidth = 1) +
  scale_colour_discrete_af()

}

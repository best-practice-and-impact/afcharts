#' @title Convert millimetres to inches
#'
#' @param x Numeric value in millimetres
#'
#' @return A numerical value in inches
#'
#' @examples mm_to_inch(100)
#'
#' @export

mm_to_inch <- function(x) {

  if (!inherits(x, "numeric")) {
    cli::cli_abort("x must be numeric.")
  }

  x / 25.4

}



#' Label pounds sterling
#'
#' Label an axis or legend in pounds sterling.
#'
#' @return labelling function
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' scales::demo_continuous(c(0, 1), breaks = seq(0, 1, 0.1),  labels = label_pounds())
#' scales::demo_continuous(c(0, 5000), breaks = seq(0, 5000, 1000), labels = label_pounds())
#' scales::demo_log10(c(1, 1e12), breaks = scales::log_breaks(5, 1e3), labels = label_pounds())
#'
#' set.seed(123)
#'
#' price_data <- data.frame(
#'  date = seq(as.Date("2024-05-12"), as.Date("2024-08-12"), by = 1),
#'  price = runif(93, 0, 1000)
#' )
#'
#' use_afcharts()
#'
#' p <- ggplot(price_data, aes(x = date, y = price)) +
#'  geom_line() +
#'  scale_y_continuous(
#'  labels = label_pounds(),
#'   expand = c(0, 0),
#'   breaks = seq(0, 1000, 100)
#'  ) +
#'  coord_cartesian(ylim = c(0, 1000))
#'
#' p
label_pounds <- function() {
  scales::label_currency(
    prefix = "\u00a3",
    suffix = "",
    big.mark = ",",
    decimal.mark = ".",
    trim = TRUE,
    scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12)
  )
}

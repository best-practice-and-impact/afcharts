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
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' scales::demo_continuous(c(0.1, 1), labels = label_pounds())
#' scales::demo_continuous(c(1, 1e3), labels = label_pounds())
#' scales::demo_log10(c(1, 1e12), breaks = log_breaks(5, 1e3), labels = label_pounds())
label_pounds <- function(...) {
  label_currency(
    prefix = "£",
    big.mark = ",",
    decimal.mark = ".",
    scale_cut = c(0, k = 1e3, m = 1e6, bn = 1e9, tn = 1e12),
    ...)
}

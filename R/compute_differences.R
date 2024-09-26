#' Calculate first differences of a series
#'
#' @param series_ts A ts object.
#' @param lag An integer value.
#'
#' @return A ts object.
#' @export
#'
#' @examples
#' #library(statbanker)
#' #NAQ01 <- getStatBankData("NAQ01", type = "px")
#' PCR_SA <- extract_series(NAQ01, index = 2)
#' compute_differences(PCR_SA, 1)
compute_differences <- function(series_ts, lag){
  series_ts_diff <- (series_ts) - lag((series_ts), k = -lag)
  return(series_ts_diff)
}

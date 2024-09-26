#' Compute growth rates of a series
#'
#' @param series_ts A ts object.
#' @param lag An integer value.
#'
#' @return A ts object.
#' @export
#'
#' @examples
#' library(statbanker)
#' NAQ01 <- getStatBankData("NAQ01", type = "px")
#' PCR_SA <- extract_series(NAQ01, index = 2)
#' compute_growth_rates(PCR_SA, 1)
compute_growth_rates <- function(series_ts, lag){
  # series_ts_gr <- (log(series_ts) - lag(log(series_ts), k = -lag)) * 100
  series_ts_gr <- ((series_ts - lag(series_ts, k = -lag)) / lag(series_ts, k = -lag) ) * 100
  return(series_ts_gr)
}

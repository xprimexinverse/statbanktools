#' Extract series from a CSO table
#'
#' @param table_px A px object from statbanker package.
#' @param index An integer or string to locate the series.
#'
#' @return A ts (time-series) object.
#' @export
#'
#' @examples
#' library(statbanker)
#' NAQ01 <- getStatBankData("NAQ01", type = "px")
#' PCR_SA <- extract_series(NAQ01, index = 2)
extract_series <- function(table_px, index){
  table_ts  <- statbanker::px2ts(table_px)
  series_ts <- table_ts[,index]
  return(series_ts)
}

#' Find series in a CSO table
#'
#' @param text A string of text (i.e. the search term).
#' @param table_px A px object from statbanker package.
#' @param ... Additional arugments
#'
#' @return A list containing the matched series and index numbers.
#' @export
#'
#' @examples
#' library(statbanker)
#' NAQ01 <- getStatBankData("NAQ01", type = "px")
#' find_series("exports", NAQ01)
find_series <- function(text, table_px, ...){
  idx          <- which(grepl(text, list_series(table_px), ignore.case = TRUE, ...))
  found_series <- list_series(table_px)[idx]
  results      <- list(series = found_series, idx = as.numeric(idx))
  return(results)
}

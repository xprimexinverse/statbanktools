#' List series in a CSO table
#'
#' @param table_px A px object from statbanker package.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' library(statbanker)
#' NAQ01 <- getStatBankData("NAQ01", type = "px")
#' list_series(NAQ01)
list_series <- function(table_px){
  series_list <- colnames(px2ts(table_px))
  return(series_list)
}

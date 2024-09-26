#' Create a series-obj
#'
#' @param series_ts A ts object
#' @param ... Other types of arguments
#'
#' @return A series-object
#' @export
#'
#' @examples
#' library(statbanker)
#' library(plotly)
#' NAQ01 <- getStatBankData("NAQ01", type = "px")
#' PCR_SA <- get_series(NAQ01, index = 2)
#' PCR_NEW <- create_series(PCR_SA@raw_data)
create_series <- function(series_ts, ...){

  if(stats::frequency(series_ts) == 4){

    # Compute the growth rates
    series_ts_gr <- cbind(compute_growth_rates(series_ts, 1),
                          compute_growth_rates(series_ts, 4))
    #colnames(series_ts_gr) <- c("Q-on-Q","Y-on-Y")

    # Compute the differences
    series_ts_diff <- cbind(compute_differences(series_ts, 1),
                            compute_differences(series_ts, 4))
    #colnames(series_ts_diff) <- c("Q-diff", "Y-diff")

  }else if(stats::frequency(series_ts) == 1){

    # Compute the growth rates
    series_ts_gr <- compute_growth_rates(series_ts, 1)
    #colnames(series_ts_gr) <- c("Y-on-Y")

    # Compute the differences
    series_ts_diff <- compute_differences(series_ts, 1)
    #colnames(series_ts_diff) <- c("Y-diff")

  }else if(stats::frequency(series_ts) == 12){

    # Compute the growth rates
    series_ts_gr <- cbind(compute_growth_rates(series_ts, 1),
                          compute_growth_rates(series_ts, 12))
    #colnames(series_ts_gr) <- c("M-on-M","Y-on-Y")

    # Compute the differences
    series_ts_diff <- cbind(compute_differences(series_ts, 1),
                            compute_differences(series_ts, 12))
    #colnames(series_ts_diff) <- c("M-diff", "Y-diff")

  }

  # Merge data and transformations
  data_mts <- cbind(series_ts,
                    series_ts_gr,
                    series_ts_diff)
  if(stats::frequency(series_ts) == 4){
    colnames(data_mts) <- c("level", "Q-on-Q", "Y-on-Y", "Q-diff", "Y-diff")
  }else if(stats::frequency(series_ts) == 1){
    colnames(data_mts) <- c("level", "Y-on-Y", "Y-diff")
  }else if(stats::frequency(series_ts) == 12){
    colnames(data_mts) <- c("level", "M-on-M", "Y-on-Y", "M-diff", "Y-diff")
  }

  # Package together the data and metadata
  series_obj <- new("series-obj",
                    frequency    = stats::frequency(series_ts),
                    start_date   = stats::start(series_ts),
                    end_date     = stats::end(series_ts),
                    raw_data     = series_ts,
                    #growth_rates = series_ts_gr,
                    #differences  = series_ts_diff,
                    data         = data_mts,
                    ...)

  return(series_obj)
}

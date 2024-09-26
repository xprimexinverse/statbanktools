#' Get series from a CSO table
#'
#' @param table_px A px object from statbanker package.
#' @param index An integer or string to locate the series.
#' @param ... Other types of arguments.
#'
#' @return A series-object.
#' @importFrom plotly %>%
#' @export
#'
#' @examples
#' #library(statbanker)
#' #library(plotly)
#' #NAQ01 <- getStatBankData("NAQ01", type = "px")
#' #PCR_SA <- get_series(NAQ01, index = 2)
get_series <- function(table_px, index, ...){

  # Extract the time-series
  series_ts  <- extract_series(table_px, index)

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

  if(methods::is(index,"numeric")){
    desc <- (unlist(strsplit(colnames(statbanker::px2ts(table_px))[index], '_')))
  }else if(methods::is(index,"character")){
    id   <- which(colnames(statbanker::px2ts(table_px))==index)
    desc <- (unlist(strsplit(colnames(statbanker::px2ts(table_px))[id], '_')))
  }

  # Package together the data and metadata
  series_obj <- methods::new("series-obj",
                    #mnemonic     = mnemonic,
                    #description  = (unlist(strsplit(colnames(px2ts(table_px))[index], '_'))),
                    description  = desc,
                    units        = table_px$UNITS$value,
                    source       = c(table_px$SOURCE$value,
                                     table_px$MATRIX$value),
                    table        = as.character(substitute(table_px)),
                    index        = index,
                    #model_desc   = model_desc,
                    frequency    = stats::frequency(series_ts),
                    start_date   = stats::start(series_ts),
                    end_date     = stats::end(series_ts),
                    raw_data     = series_ts,
                    #growth_rates = series_ts_gr,
                    #differences  = series_ts_diff,
                    data         = data_mts)

  # Plotting
  if(methods::is(index,"numeric")){
    chart_title <- paste0(sub("_", "\n", colnames(statbanker::px2ts(table_px))[index]))
  }else if(methods::is(index,"character")){
    id <- which(colnames(statbanker::px2ts(table_px)) == index)
    chart_title <- paste0(sub("_", "\n", colnames(statbanker::px2ts(table_px))[id]))
  }

  if(stats::frequency(series_ts)==4){
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = seq(start(series_obj@data)[1],end(series_obj@data)[1],0.25), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    fig1 <- plotly::plot_ly(as.data.frame(series_obj@data), x = seq(from=stats::start(series_obj@data)[1],by=0.25,length.out=length(series_obj@data[,1])), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
  }
  if(stats::frequency(series_ts)==1){
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = seq(start(series_obj@data)[1],end(series_obj@data)[1],1), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    fig1 <- plotly::plot_ly(as.data.frame(series_obj@data), x = seq(from=stats::start(series_obj@data)[1],by=1,length.out=length(series_obj@data[,1])), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
  }
  if(stats::frequency(series_ts)==12){
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = seq(start(series_obj@data)[1],end(series_obj@data)[1],1/12), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    fig1 <- plotly::plot_ly(as.data.frame(series_obj@data), x = round(seq(from=stats::start(series_obj@data)[1],by=1/12,length.out=length(series_obj@data[,1])),2), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
  }

  if(stats::frequency(series_ts)==4){
    fig1 <- fig1 %>% plotly::add_trace(y = series_obj@data[,"Q-diff"], type = 'scatter', mode = 'lines+markers', name = paste0('Q-diff', " (",table_px$UNITS$value,")"), visible='legendonly')
  }
  if(stats::frequency(series_ts)==12){
    fig1 <- fig1 %>% plotly::add_trace(y = series_obj@data[,"M-diff"], type = 'scatter', mode = 'lines+markers', name = paste0('M-diff', " (",table_px$UNITS$value,")"), visible='legendonly')
  }

  fig1 <- fig1 %>% plotly::add_trace(y = series_obj@data[,"Y-diff"], type = 'scatter', mode = 'lines+markers', name = paste0('Y-diff', " (",table_px$UNITS$value,")"), visible='legendonly')
  if(stats::frequency(series_ts)==4){
    fig1 <- fig1 %>% plotly::add_trace(y = round(series_obj@data[,"Q-on-Q"],1), type = 'scatter', mode = 'lines+markers', name = 'Q-on-Q (%)', visible='legendonly')
  }
  if(stats::frequency(series_ts)==12){
    fig1 <- fig1 %>% plotly::add_trace(y = round(series_obj@data[,"M-on-M"],1), type = 'scatter', mode = 'lines+markers', name = 'M-on-M (%)', visible='legendonly')
  }

  fig1 <- fig1 %>% plotly::add_trace(y = round(series_obj@data[,"Y-on-Y"],1), type = 'scatter', mode = 'lines+markers', name = 'Y-on-Y (%)', visible='legendonly')
  fig1 <- fig1 %>% graphics::layout(title = list(text = chart_title, xanchor = 'center', yanchor = 'top', font = list(family = "Times New Roman", size = 12, color = "black")))
  fig1 <- fig1 %>% graphics::layout(xaxis = list(tickformat = ",.", hoverformat = ",."))
  print(fig1)

  return(series_obj)
}

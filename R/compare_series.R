#' Compare series from a CSO table
#'
#' @param ... series-objects.
#'
#' @return An mts object.
#' @export
#'
#' @examples
#' #library(statbanker)
#' #library(plotly)
#' #NAQ01 <- getStatBankData("NAQ01", type = "px")
#' #PCR_SA <- get_series(NAQ01,2)
#' #GCR_SA <- get_series(NAQ01,4)
#' #ITR_SA <- get_series(NAQ01,6)
#' #compare_series(PCR_SA@data[,"Y-on-Y"],ITR_SA@data[,"Y-on-Y"],GCR_SA@data[,"Y-on-Y"])
compare_series <- function(...){
  (data <- cbind(...))
  freq <- stats::frequency(data)
  if(freq==12){
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = seq(start(series_obj@data)[1],end(series_obj@data)[1],1/12), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    #fig1 <- plot_ly(as.data.frame(data), x = seq(start(data)[1],end(data)[1],1/freq), y = data[,1], type = 'scatter', mode = 'lines+markers', name=colnames(data)[1])
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = round(seq(from=start(series_obj@data)[1],by=1/12,length.out=length(series_obj@data[,1])),2), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    fig1 <- plotly::plot_ly(as.data.frame(data), x = seq(from=stats::start(data)[1],by=1/12,length.out=length(data[,1])), y = data[,1], type = 'scatter', mode = 'lines+markers', name=colnames(data)[1])
    for(i in 2:ncol(data)){
      #fig1 <- fig1 %>% add_trace(y = data[,i], type = 'scatter', mode = 'lines+markers', name = colnames(data)[i])
      fig1 <- fig1 %>% plotly::add_trace(as.data.frame(data), x = seq(from=stats::start(data)[1],by=1/12,length.out=length(data[,1])), y = data[,i], type = 'scatter', mode = 'lines+markers', name=colnames(data)[i])
      print(fig1)
    }
  }else if(freq==4) {
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = seq(start(series_obj@data)[1],end(series_obj@data)[1],1/12), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    #fig1 <- plot_ly(as.data.frame(data), x = seq(start(data)[1],end(data)[1],1/freq), y = data[,1], type = 'scatter', mode = 'lines+markers', name=colnames(data)[1])
    #fig1 <- plot_ly(as.data.frame(series_obj@data), x = round(seq(from=start(series_obj@data)[1],by=1/12,length.out=length(series_obj@data[,1])),2), y = series_obj@data[,"level"], type = 'scatter', mode = 'lines', name = paste0('Level', " (",table_px$UNITS$value,")"))
    fig1 <- plotly::plot_ly(as.data.frame(data), x = seq(from=stats::start(data)[1],by=1/4,length.out=length(data[,1])), y = data[,1], type = 'scatter', mode = 'lines+markers', name=colnames(data)[1])
    for(i in 2:ncol(data)){
      #fig1 <- fig1 %>% add_trace(y = data[,i], type = 'scatter', mode = 'lines+markers', name = colnames(data)[i])
      fig1 <- fig1 %>% plotly::add_trace(as.data.frame(data), x = seq(from=stats::start(data)[1],by=1/4,length.out=length(data[,1])), y = data[,i], type = 'scatter', mode = 'lines+markers', name=colnames(data)[i])
      print(fig1)
    }
  } else{
    fig1 <- plotly::plot_ly(as.data.frame(data), x = seq(stats::start(data)[1],stats::end(data)[1],1/freq), y = data[,1], type = 'scatter', mode = 'lines+markers', name=colnames(data)[1])
    #fig1 %>% add_trace(y = data[,2], type = 'scatter', mode = 'lines+markers', name = "MFDDR_SA")
    for(i in 2:ncol(data)){
      #fig1 <- fig1 %>% add_trace(y = data[,i], type = 'scatter', mode = 'lines+markers', name = colnames(data)[i])
      fig1 <- fig1 %>% plotly::add_trace(as.data.frame(data), x = seq(stats::start(data)[1],stats::end(data)[1],1/freq), y = data[,i], type = 'scatter', mode = 'lines+markers', name=colnames(data)[i])
      print(fig1)
    }
  }
  return(data)
}

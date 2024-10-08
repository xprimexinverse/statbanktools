% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_series.R
\name{create_series}
\alias{create_series}
\title{Create a series-obj}
\usage{
create_series(series_ts, ...)
}
\arguments{
\item{series_ts}{A ts object}

\item{...}{Other types of arguments}
}
\value{
A series-object
}
\description{
Create a series-obj
}
\examples{
#library(statbanker)
#library(plotly)
#NAQ01 <- getStatBankData("NAQ01", type = "px")
#PCR_SA <- get_series(NAQ01, index = 2)
#PCR_NEW <- create_series(PCR_SA@raw_data)
}

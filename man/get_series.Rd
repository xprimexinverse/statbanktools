% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_series.R
\name{get_series}
\alias{get_series}
\title{Get series from a CSO table}
\usage{
get_series(table_px, index, ...)
}
\arguments{
\item{table_px}{A px object from statbanker package.}

\item{index}{An integer or string to locate the series.}

\item{...}{Other types of arguments.}
}
\value{
A series-object.
}
\description{
Get series from a CSO table
}
\examples{
#library(statbanker)
#library(plotly)
#NAQ01 <- getStatBankData("NAQ01", type = "px")
#PCR_SA <- get_series(NAQ01, index = 2)
}

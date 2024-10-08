% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_growth_rates.R
\name{compute_growth_rates}
\alias{compute_growth_rates}
\title{Compute growth rates of a series}
\usage{
compute_growth_rates(series_ts, lag)
}
\arguments{
\item{series_ts}{A ts object.}

\item{lag}{An integer value.}
}
\value{
A ts object.
}
\description{
Compute growth rates of a series
}
\examples{
library(statbanker)
NAQ01 <- getStatBankData("NAQ01", type = "px")
PCR_SA <- extract_series(NAQ01, index = 2)
compute_growth_rates(PCR_SA, 1)
}

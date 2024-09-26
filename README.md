
<!-- README.md is generated from README.Rmd. Please edit that file -->

# statbanktools

<!-- badges: start -->
<!-- badges: end -->

The purpose of statbanktools is to provide a set of helper functions to
accompany the statbanker package. statbanktools eases the task of
extracting data from CSO tables and generates interactive charts that
show the data in levels, differences, and growth rates. The series are
stored as an S4 object, which contains the raw data, the transformations
of the data, and metadata.

## Installation

You can install the development version of statbanktools from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("xprimexinverse/statbanktools")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(statbanker)
library(plotly)
#> Loading required package: ggplot2
#> 
#> Attaching package: 'plotly'
#> The following object is masked from 'package:ggplot2':
#> 
#>     last_plot
#> The following object is masked from 'package:stats':
#> 
#>     filter
#> The following object is masked from 'package:graphics':
#> 
#>     layout
library(statbanktools)
NAQ01 <- getStatBankData("NAQ01", type = "px")
#> *** METADATA ***
#> CSO Table =  NAQ01 
#> TITLE =  Expenditure on GNP and Percentage change on Expenditure on GNP at Constant Market Prices - Sectors and Quarter 1995Q1 - 2024Q2 
#> UNITS =  Euro Million 
#> SOURCE =  Central Statistics Office, Ireland 
#> DATABASE =  
#> CREATION DATE =  
#> LAST UPDATED =  20240905 11:00 
#> FILE ADDRESS =  https://ws.cso.ie/public/api.restful/PxStat.Data.Cube_API.ReadDataset/NAQ01/PX/2013/
PCR_SA <- get_series(NAQ01, index = 2)
#> The following `from` values were not present in `x`: dat
#> The following `from` values were not present in `x`: dat
#> The following `from` values were not present in `x`: dat
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.


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
head(PCR_SA@data,n=20)
#>       level       Q-on-Q    Y-on-Y Q-diff Y-diff
#>  [1,] 11661           NA        NA     NA     NA
#>  [2,] 11990  2.821370380        NA    329     NA
#>  [3,] 12288  2.485404504        NA    298     NA
#>  [4,] 12489  1.635742188        NA    201     NA
#>  [5,] 12656  1.337176716  8.532716    167    995
#>  [6,] 12805  1.177307206  6.797331    149    815
#>  [7,] 13048  1.897696212  6.184896    243    760
#>  [8,] 13328  2.145922747  6.717912    280    839
#>  [9,] 13425  0.727791116  6.076169     97    769
#> [10,] 13695  2.011173184  6.950410    270    890
#> [11,] 13963  1.956918583  7.012569    268    915
#> [12,] 14564  4.304232615  9.273709    601   1236
#> [13,] 14653  0.611095853  9.147114     89   1228
#> [14,] 15030  2.572851976  9.748083    377   1335
#> [15,] 15275  1.630073187  9.396262    245   1312
#> [16,] 15463  1.230769231  6.172755    188    899
#> [17,] 16052  3.809092673  9.547533    589   1399
#> [18,] 16053  0.006229753  6.806387      1   1023
#> [19,] 17023  6.042484271 11.443535    970   1748
#> [20,] 17012 -0.064618457 10.017461    -11   1549
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# b2

<!-- badges: start -->
<!-- badges: end -->

The goal of b2 is to create a function that can help get the median
value in each group of a tibble.

## Installation

You can install the development version of b2 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-ChenruZhao/b2")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(b2)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
median_in_group(palmerpenguins::penguins, body_mass_g, island, TRUE)
#> # A tibble: 3 × 2
#>   island    median
#>   <fct>      <dbl>
#> 1 Biscoe     4775 
#> 2 Dream      3688.
#> 3 Torgersen  3700

median_in_group(palmerpenguins::penguins, bill_length_mm, species, FALSE)
#> # A tibble: 3 × 2
#>   species   median
#>   <fct>      <dbl>
#> 1 Adelie      NA  
#> 2 Chinstrap   49.6
#> 3 Gentoo      NA

median_in_group(palmerpenguins::penguins, year, island, TRUE)
#> # A tibble: 3 × 2
#>   island    median
#>   <fct>      <dbl>
#> 1 Biscoe      2008
#> 2 Dream       2008
#> 3 Torgersen   2008
```

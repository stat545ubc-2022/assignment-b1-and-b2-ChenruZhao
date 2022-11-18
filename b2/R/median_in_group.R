#' Median Value in Each Group
#'
#' The function groups all data in a tibble by variable `var_group`
#' and get the median of a numerical variable `var_x` in each group
#'
#' @param data - The input data that you are interested in to get the median value of each group in the tibble
#' @param var_x - A numerical variable x in the data that you are interested in to get the median value in each group
#' @param var_group - A variable in the data that you want to use it to group the data
#' @param na.rm - A parameter determines if remove NA values or not when getting the median
#'
#' @return The function returns the median values of var_x in each var_group, which should be a tibble
#'
#' @import dplyr
#' @import tibble
#' @importFrom magrittr %>%
#' @importFrom stats median
#'
#' @examples
#' median_in_group(palmerpenguins::penguins, body_mass_g, island, TRUE)
#' median_in_group(palmerpenguins::penguins, bill_length_mm, species, FALSE)
#' median_in_group(palmerpenguins::penguins, year, island, TRUE)
#'
#' @export

median_in_group <- function(data, var_x, var_group, na.rm) {

  # determine if the input data is a tibble
  # determine if the variable x that you want to get median values is in numerical format
  # use deparse(substitute(var_x)) to get the name of the var_x
  # data[["name of a variable"]] can help extract the column
  if(!is_tibble(data) || !is.numeric(data[[deparse(substitute(var_x))]])) {
    stop('The data should be a tibble and the variable x should be in numerical format.')
  }

  median_values <- data %>% # load data
    group_by({{var_group}}) %>% # group data by `var_group`
    summarise(median = median({{var_x}}, na.rm = na.rm)) # get the median of var_x in each group, you can remove NA values or not

  return(median_values)
}

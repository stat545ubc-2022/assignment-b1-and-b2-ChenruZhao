test_that("median_in_group function works", {
  median_body_mass_g_in_island <- palmerpenguins::penguins %>%
    group_by(island) %>%
    summarise(median = median(body_mass_g, na.rm = TRUE))

  # Get the correct median of body_mass_g (not remove NA values) in each island to help for testing
  median_body_mass_g_NA_in_island <- palmerpenguins::penguins %>%
    group_by(island) %>%
    summarise(median = median(body_mass_g, na.rm = FALSE))

  # expect the function to get the same result as median_body_mass_g_in_island
  expect_equal(median_in_group(palmerpenguins::penguins, body_mass_g, island, TRUE), median_body_mass_g_in_island)
  # expect the function to get the same result as median_body_mass_g_NA_in_island
  expect_equal(median_in_group(palmerpenguins::penguins, body_mass_g, island, FALSE), median_body_mass_g_NA_in_island)
  # expect the return of the function to be a tibble
  expect_equal(is_tibble(median_in_group(palmerpenguins::penguins, body_mass_g, island, TRUE)), TRUE)
  # expect the var_x to be a numerical variable instead of a categorical variable
  expect_error(median_in_group(palmerpenguins::penguins, island, year))
  # expect the input data to be a tibble instead of a list
  expect_error(median_in_group(c("Biscoe", "Dream", "Torgersen"), island, year))
  # expect the input data to be a tibble instead of a number
  expect_error(median_in_group(numeric(1), island, year))
})

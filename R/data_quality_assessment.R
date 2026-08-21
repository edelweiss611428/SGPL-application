library(dplyr)
library(purrr)
library(tibble)
library(haven)

# This workflow assesses data quality for all variables

readRDS("data/nhanes_2017_2020_merged.rds")

data_quality = map_dfr(names(nhanes_data), function(var) {

  x = nhanes_data[[var]]

  n = length(x)
  n_missing = sum(is.na(x))
  n_complete = n - n_missing
  n_unique = n_distinct(x, na.rm = TRUE)

  # Variable label from XPT metadata

  label = attr(x, "label")
  if (is.null(label)) label = ""

  # Basic information

  out = tibble(
    variable = var,
    label = label,
    class = paste(class(x), collapse = ", "),
    n = n,
    n_missing = n_missing,
    pct_missing = 100 * n_missing / n,
    n_complete = n_complete,
    n_unique = n_unique
  )

  # Numeric statistics
  if (is.numeric(x)) {

    out = out %>%
      mutate(
        mean = mean(x, na.rm = TRUE),
        sd = sd(x, na.rm = TRUE),
        min = min(x, na.rm = TRUE),
        q25 = quantile(x, 0.25, na.rm = TRUE),
        median = median(x, na.rm = TRUE),
        q75 = quantile(x, 0.75, na.rm = TRUE),
        max = max(x, na.rm = TRUE),
        n_zero = sum(x == 0, na.rm = TRUE)
      )

  } else { # For non-numeric variables

    out = out %>%
      mutate(
        mean = NA_real_,
        sd = NA_real_,
        min = NA_real_,
        q25 = NA_real_,
        median = NA_real_,
        q75 = NA_real_,
        max = NA_real_,
        n_zero = NA_real_
      )
  }
  out
})

# Print
print(data_quality, n = Inf)

clean_data <- function(df) {
  clean_data <- df %>%
    mutate(fueltype = as.factor(fueltype))

  return(clean_data)
}




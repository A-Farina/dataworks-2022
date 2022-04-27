clean_data <- function(df) {
  clean_data <- df %>%
    mutate(fueltype = as.factor(fueltype),
           price = price/1000)

  return(clean_data)
}




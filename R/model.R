# Modeling Process

options(tidyverse.quiet = TRUE)
options(tidymodels.quiet = TRUE)
library(tidyverse)
library(tidymodels)
library(rstatix)
tidymodels_prefer()


model <- function(df) {

    lm_model <- lm(price ~ ., data = df)

    return(lm_model)
}

model2 <- function(df) {

  set.seed(63)

  # Create a split object
  dat_split <- initial_split(df, prop = 0.75)
  # Build training data set
  dat_training <- dat_split %>%
    training()
  # Build testing data set
  dat_test <- dat_split %>%
    testing()
  lm_model <- linear_reg() %>%
    set_engine('lm') %>% # adds lm implementation of linear regression
    set_mode('regression')
  lm_fit <- lm_model %>%
    fit(price ~ ., data = dat_training)
  return_list <- list("train" = dat_training,
                      "test" = dat_test,
                      "lm_model" = lm_model,
                      "lm_fit" = lm_fit)
  return(return_list)

}

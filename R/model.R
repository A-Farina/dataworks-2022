# Modeling Process

options(tidyverse.quiet = TRUE)
options(tidymodels.quiet = TRUE)
library(tidyverse)
library(rstatix)

model <- function(df) {

    lm_model <- lm(price ~ horsepower + wheelbase + fueltype, data = df)

    return(lm_model)
}


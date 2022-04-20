# Modeling Process

options(tidyverse.quiet = TRUE)
options(tidymodels.quiet = TRUE)
library(tidyverse)
library(tidymodels)

model_workflow <- function(df) {

    xg_mod <-
      boost_tree() %>% #functional form
      set_engine("xgboost")

    arete_rec <-
        recipe(t1_cqpa ~ ., data = df) %>%
        update_role(pn_id, new_role = "id") %>%
        step_impute_bag(all_predictors()) %>%
        step_normalize(all_numeric_predictors()) %>%
        step_dummy(all_nominal_predictors(), one_hot = TRUE)

    arete_wflow_xg <-
        workflow() %>%
        add_model(xg_mod) %>%
        add_recipe(arete_rec)

    return(arete_wflow_xg)
}

model_fit <- function(df, wflow) {
  final_model <- fit(wflow, df)
  model_fit <- extract_fit_parsnip(final_model) %>% pluck("fit")
  return(model_fit)
}

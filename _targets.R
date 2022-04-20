library(targets)
library(tarchetypes)
source("R/functions.R")
source("R/model.R")
options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "tidymodels", "xgboost"))
list(
  tar_target(raw_data_file, "data/arete_full.rds", format = "file"),
  tar_target(raw_data, readRDS(raw_data_file)),
  tar_target(data, clean_data(raw_data)),
  tar_target(split, split_data(data)),
  tar_target(train, training_data(split)),
  tar_target(test, testing_data(split)),
  tar_target(folds, folded_data(train)),
  tar_target(model_wflow, model_workflow(train)),
  tar_target(model_ft, model_fit(test, model_wflow)),
  tar_render(report, "R/markdown.rmd"),
  tar_render(report2, "R/markdown2.rmd"),
  tar_render(slides, "presentation/index.rmd")
)

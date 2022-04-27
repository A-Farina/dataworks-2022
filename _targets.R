library(targets)
library(tarchetypes)
source("R/functions.R")
source("R/model.R")
options(tidyverse.quiet = TRUE)
options(tidymodels.quiet = TRUE)

list(
  tar_target(raw_data_file, "data/car_price.csv", format = "file"),
  tar_target(raw_data, rio::import(raw_data_file)),
  tar_target(data, clean_data(raw_data)),
  tar_target(linear_model, model(data)),
  tar_target(tidy_model, model2(data)),
  tar_render(report, "R/markdown.rmd"),
  tar_render(slides, "presentation/index.rmd")
)

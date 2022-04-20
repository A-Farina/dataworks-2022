clean_data <- function(df) {
  clean_data <- df %>%
    select(pn_id, nct, t0_LOTR, t0_HARDINESS, t0_ISR, t0_GRIT, t0_PSS,
           t0_IH, t0_GRATITUDE, t0_PURPOSE, t0_SELFCONCEPT, t0_EMPATHY,
           sex, ethnicity, rday_age, athlete, whole_cand_scr, t1_cqpa) %>%
    filter(!is.na(t1_cqpa),
           !is.na(nct))
  return(clean_data)
}

split_data <- function(df) {
  set.seed(63)
  arete_split <- initial_split(df, prop = 1/2)
  return(arete_split)
}

training_data <- function(split) {
  set.seed(63)
  arete_train <- training(split)
  return(arete_train)
}

testing_data <- function(split) {
  set.seed(63)
  arete_test <- testing(split)
  return(arete_test)
}

folded_data <- function(training) {
  set.seed(63)
  arete_folds <- vfold_cv(training)
  return(arete_folds)
}


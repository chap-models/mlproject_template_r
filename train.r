options(warn = 1)

train_chap <- function(csv_fn, model_fn) {
  df <- read.csv(csv_fn)
  df$disease_cases[is.na(df$disease_cases)] <- 0
  model <- lm(disease_cases ~ rainfall + mean_temperature, data = df)
  saveRDS(model, file = model_fn)
}

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 2) {
  train_chap(args[1], args[2])
}

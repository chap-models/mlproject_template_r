options(warn = 1)

predict_chap <- function(model_fn, historic_data_fn, future_climatedata_fn, predictions_fn) {
  df <- read.csv(future_climatedata_fn)
  X <- df[, c("rainfall", "mean_temperature"), drop = FALSE]
  model <- readRDS(model_fn)

  y_pred <- predict(model, newdata = X)
  out <- df[, c("time_period", "location")]
  out$sample_0 <- y_pred
  write.csv(out, predictions_fn, row.names = FALSE)

  print(paste("Forecasted values:", paste(y_pred, collapse = ", ")))
}

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 4) {
  predict_chap(args[1], args[2], args[3], args[4])
}

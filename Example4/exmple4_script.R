library(dplyr)

# Example 4

lm_pred <- test_data %>% 
  dplyr::bind_cols(predict(object = lm_fit, new_data = test_data)) %>% 
  dplyr::rename(pred = .pred)

View(lm_pred)

lm_pred <- test_data %>% 
  dplyr::bind_cols(predict(object = lm_fit, new_data = test_data)) %>% 
  dplyr::rename(pred = .pred) %>% 
  dplyr::mutate(pred = round(pred, 0))

lm_mse <- data.frame(type = "lm", 
                     MSE = round(mean((lm_pred$pred - lm_pred$quality)^2), 4),
                     stringsAsFactors = FALSE)

# 1a

dt_pred <- test_data %>% 
  dplyr::bind_cols(predict(object = dt_fit, new_data = test_data)) %>% 
  dplyr::rename(pred = .pred) %>% 
  dplyr::mutate(pred = round(pred, 0))

dt_mse <- data.frame(type = "dt", 
                     MSE = round(mean((dt_pred$pred - dt_pred$quality)^2), 4),
                     stringsAsFactors = FALSE)

# 1b

rf_pred <- test_data %>% 
  dplyr::bind_cols(predict(object = rf_fit, new_data = test_data)) %>% 
  dplyr::rename(pred = .pred) %>% 
  dplyr::mutate(pred = round(pred, 0))

rf_mse <- data.frame(type = "rf", 
                     MSE = round(mean((rf_pred$pred - rf_pred$quality)^2), 4),
                     stringsAsFactors = FALSE)


# 1c

xgboost_pred <- test_data %>% 
  dplyr::bind_cols(predict(object = xgboost_fit, new_data = test_data)) %>% 
  dplyr::rename(pred = .pred) %>% 
  dplyr::mutate(pred = round(pred, 0))

xgboost_mse <- data.frame(type = "xgboost", 
                     MSE = round(mean((xgboost_pred$pred - xgboost_pred$quality)^2), 4),
                     stringsAsFactors = FALSE)

# Join all results together

res <- dplyr::bind_rows(lm_mse, dt_mse, rf_mse, xgboost_mse)

View(res)


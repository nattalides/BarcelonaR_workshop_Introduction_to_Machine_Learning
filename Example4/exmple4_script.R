# Predict and evaluate a model fit

lm_pred <- test_data %>% 
  bind_cols(predict(object = lm_fit, new_data = test_data))

View(lm_pred)

lm_pred <- test_data %>% 
  bind_cols(predict(object = lm_fit, new_data = test_data)) %>% 
  mutate(pred = round(.pred, 0))

lm_mse <- lm_pred %>% 
  summarise(type = "lm",
            MSE = round(mean((pred - quality)^2), 4))

View(lm_mse)

# Example 4

# 1 a) MSE for: Decision Tree

dt_pred <- test_data %>% 
  bind_cols(predict(object = dt_fit, new_data = test_data)) %>% 
  rename(pred = .pred) %>% 
  mutate(pred = round(pred, 0))

dt_mse <- dt_pred %>% 
  summarise(type = "dt",
            MSE = round(mean((pred - quality)^2), 4))

# 1 b) MSE for: Random Forest

rf_pred <- test_data %>% 
  bind_cols(predict(object = rf_fit, new_data = test_data)) %>% 
  rename(pred = .pred) %>% 
  mutate(pred = round(pred, 0))

rf_mse <- rf_pred %>% 
  summarise(type = "rf",
            MSE = round(mean((pred - quality)^2), 4))

# 1 c) MSE for: xgboost

xgboost_pred <- test_data %>% 
  bind_cols(predict(object = xgboost_fit, new_data = test_data)) %>% 
  rename(pred = .pred) %>% 
  mutate(pred = round(pred, 0))

xgboost_mse <- xgboost_pred %>%  
  summarise(type = "xgboost",
            MSE = round(mean((pred - quality)^2), 4))

# Join all results together

res <- bind_rows(lm_mse, dt_mse, rf_mse, xgboost_mse)

View(res)

View(rf_pred)

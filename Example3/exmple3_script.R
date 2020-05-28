library(parsnip)
library(broom)
library(rpart)

# Example 3

# Fit a linear regression model to the data

# make the parsnip model
lm_mod <- 
  linear_reg() %>% 
  set_mode("regression") %>%
  set_engine("lm")

# The engine is what tells our model which algorithm/package to use to fit
# or train the model.

# train the model
lm_fit <- 
  lm_mod %>% 
  fit(fmla4, data = train_data)

lm_fit

summary(lm_fit$fit)

tidy(lm_fit$fit) %>% mutate_if(is.numeric, round, 3)

# 1 a). 

dt_mod <- 
  decision_tree() %>% 
  set_mode("regression") %>%
  set_engine("rpart")

dt_fit <- 
  dt_mod %>% 
  fit(fmla4, data = train_data)

dt_fit$fit

library(visNetwork)
library(sparkline)
visTree(dt_fit$fit) # Need to install {visNetwork} and {sparkline}

# 1 b). 

rf_mod <- 
  rand_forest() %>% 
  set_mode("regression") %>%
  set_engine("randomForest")

rf_fit <- 
  rf_mod %>% 
  fit(fmla4, data = train_data)

rf_fit$fit


# 1 c). 

xgboost_mod <- 
  boost_tree() %>% 
  set_mode("regression") %>% # Need to add this to specify regression problem
  set_engine("xgboost")

xgboost_fit <- 
  xgboost_mod %>% 
  fit(fmla4, data = train_data)

xgboost_fit$fit


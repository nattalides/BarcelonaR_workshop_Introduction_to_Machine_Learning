# Fit a linear regression model to the data

lm_fit <- # Create the object that will store the model fit
  linear_reg() %>% # Specify the model
  set_mode("regression") %>% # Specify that this is a regression problem
  set_engine("lm") %>% # Specify which package to use to train the model
  fit(fmla1, data = train_data) # Supply train dataset and fit model

print(lm_fit$fit)

summary(lm_fit$fit)

# A nicer way to visualise the fit summary using {broom}
tidy(lm_fit$fit) %>% mutate_if(is.numeric, round, 3)

# Example 3

# 1 a) Decision Tree
# You need to install {rpart}

dt_fit <- 
  decision_tree() %>% 
  set_mode("regression") %>%
  set_engine("rpart") %>% 
  fit(fmla1, data = train_data)

print(dt_fit$fit)

# Nice way to visualise a decision tree ...
# Need to install {visNetwork} and {sparkline}
# library(visNetwork)
# library(sparkline)
visTree(dt_fit$fit)

# 1 b) Random Forest
# You need to install {randomForest}

rf_fit <- 
  rand_forest() %>% 
  set_mode("regression") %>%
  set_engine("randomForest") %>% 
  fit(fmla1, data = train_data)

print(rf_fit$fit)

# 1 c) Xgboost
# You need to install {xgboost}

xgboost_fit <- 
  boost_tree() %>% 
  set_mode("regression") %>%
  set_engine("xgboost") %>% 
  fit(fmla1, data = train_data)

print(xgboost_fit$fit)

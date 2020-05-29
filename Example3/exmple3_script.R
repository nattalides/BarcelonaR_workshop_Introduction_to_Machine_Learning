# Example 3

# Fit a linear regression model to the data

# make the parsnip model
lm_fit <- 
  linear_reg() %>% 
  set_mode("regression") %>%
  set_engine("lm") %>% 
  fit(fmla1, data = train_data)

# The engine is what tells our model which algorithm to use to fit 
# or train the model.

lm_fit

summary(lm_fit$fit)

tidy(lm_fit$fit) %>% mutate_if(is.numeric, round, 3)

# 1 a) Decision Tree
# You need to install {rpart}

dt_mod <- 
  decision_tree() %>% 
  set_mode("regression") %>%  # Need to add this to specify regression problem
  set_engine("rpart") %>% 
  fit(fmla1, data = train_data)

dt_fit$fit

# Nice way to visualise a decision tree ... you need {visNetwork} and {sparkline}
#library(visNetwork)
#library(sparkline)
visTree(dt_fit$fit) # Need to install {visNetwork} and {sparkline}

# 1 b) Random Forest
# You need to install {randomForest}

rf_mod <- 
  rand_forest() %>% 
  set_mode("regression") %>%
  set_engine("randomForest") %>% 
  fit(fmla1, data = train_data)

rf_fit$fit

# 1 c) Xgboost
# You need to install {xgboost}

xgboost_mod <- 
  boost_tree() %>% 
  set_mode("regression") %>%
  set_engine("xgboost") %>% 
  fit(fmla1, data = train_data)

xgboost_fit$fit

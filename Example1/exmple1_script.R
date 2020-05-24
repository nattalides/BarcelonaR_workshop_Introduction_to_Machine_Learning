df <- winequality_red

saveRDS(df, "data/data.rds")

library(dplyr)
library(magrittr)
library(corrplot)
library(strignr)
library(rsample)

# Example 1

# Load and view the data.
df <- readRDS("data/data.rds")

View(df)

# Do some exploratory data analysis (EDA).
# 1. A summary of the data frame
df %>% summary

# 2. A correlation plot of the data
df %>% cor() %>% corrplot.mixed(upper = "circle",
                                tl.cex = 1,
                                tl.pos = 'lt',
                                number.cex = 0.75)

# Fix column names
colnames(df) <- df %>% colnames() %>% str_replace_all(pattern = " ",
                                                      replacement = "_")

# Remove any missing values
df <- df %>% na.omit()

# Split the data into: a) Train set, b) Test set

set.seed(12345) # Fix randomisation by setting the seed (reproducability)
# Put 3/4 of the data into the training set 
data_split <- initial_split(df, prop = 0.8)

# Create data frames for the two sets:
train_data <- training(data_split)

test_data  <- testing(data_split)

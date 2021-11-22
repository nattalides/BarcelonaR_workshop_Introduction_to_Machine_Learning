# Example 2

# For the below tasks, please store each formula in a different R object.

# 1. Using the data define: 
# a) The target variable (is it numeric or a class?)
# b) The features of the model

# a) "quality" is the target variable and it is numeric (can also be thought of as a class!)
# b) one or more of the other variables can be model a feature (these are numeric)

# 2. Design a simple formula to predict the target variable.

# Formula that uses all available features
fmla1 <- formula(quality ~ fixed_acidity + volatile_acidity + citric_acid + 
                   residual_sugar + chlorides + free_sulfur_dioxide + 
                   total_sulfur_dioxide + density + pH + sulphates + alcohol)

# Or the same as above but in shorter format
fmla1 <- formula(quality ~ .) # The "." says use all available features

# 3. Get creative and engineer some features to design other formulas!

# Remove some of the correlated features
fmla2 <- formula(quality ~ fixed_acidity + volatile_acidity + residual_sugar +
                   chlorides + free_sulfur_dioxide + pH + sulphates + alcohol)

# Engineer some new features
fmla3 <- formula(quality ~ log(volatile_acidity) + log(alcohol))

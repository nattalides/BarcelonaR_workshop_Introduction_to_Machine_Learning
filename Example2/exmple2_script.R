# Example 2

View(train_data)

?formula

# For the below, please store each formula in different R objects.

# 1.	Using the data define: 
# a) The target variable (is it numeric or a class?)
# b) The features of the model

# quality is the Target variable
# Any of the other variables can be model features (1, 2, 3 or all of them)

# 2.Design a simple formula to predict the target variable.

# Using all available features
fmla1 <- as.formula(quality ~ fixed_acidity + volatile_acidity + citric_acid + residual_sugar +
                   chlorides + free_sulfur_dioxide + total_sulfur_dioxide + density + pH + 
                   sulphates + alcohol)

# 3. Get creative and engineer some simple features to design other formulas.

# Remove some correlated features
fmla2 <- formula(quality ~ fixed_acidity + volatile_acidity + residual_sugar +
                   chlorides + free_sulfur_dioxide + pH + sulphates + alcohol)

# Engineer some features
fmla3 <- formula(quality ~ volatile_acidity + alcohol + 
                   volatile_acidity^2 + alcohol^2)

fmla4 <- formula(quality ~ log(volatile_acidity) + log(alcohol))


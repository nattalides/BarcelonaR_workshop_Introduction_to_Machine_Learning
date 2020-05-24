library(dplyr)

# Create a column for height in meters
df <- mutate(starwars, height_m = height/100)

# Find the min/mean/max mass value for each species category
df <- summarise(group_by(starwars, species), 
                min_mass = min(mass, na.rm = TRUE),
                mean_mass = mean(mass, na.rm = TRUE),
                max_mass = max(mass, na.rm = TRUE))

# Find the max mass value for each species category
df <- summarise(group_by(starwars, species), max_mass = mean(mass, na.rm = TRUE))

# Example 2

# Select columns
df <- select(starwars, -films, -vehicles, -starships)

# Filter rows that have missing mass
df <- filter(df, !is.na(mass))

# Create columns of: height in meters and the Body Mass Index (BMI) value
df <- mutate(df, height_m = height/100, BMI = mass / (height_m)^2)

# Arrange rows according to descending “BMI” values
df <- arrange(df, desc(BMI))

# Calculate the median BMI value for each gender
df <- summarise(group_by(df, gender), median_BMI = median(BMI))


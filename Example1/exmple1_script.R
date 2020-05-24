library(dplyr)

data(package = "dplyr")

View(starwars)

# Example 1

# Select columns
df <- select(starwars, name, height, mass, species)

# Filter rows by height condition
df <- filter(df, height >= 175)

# Filter rows by species condition
df <- filter(df, species == "Human")

# Arrange rows by descending mass
df <- arrange(df, desc(mass))
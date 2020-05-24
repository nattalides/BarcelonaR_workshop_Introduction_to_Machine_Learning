library(stringr)

# Make all character names as lower case
string <- str_to_lower(starwars$name)

# Combine the name, hair colour & eye colour of characters in a sentence
string <- str_c(starwars$name, " has ",
                starwars$hair_color, " hair and ",
                starwars$eye_color, " eyes.")

# Create an indicator where the specific pattern matches
ind <- str_detect(string = starwars$name, pattern = "Skywalker")

# Example 5

# Make all character names as upper case
string <- str_to_upper(starwars$name)

# Combine the name, hair colour & eye colour of characters in a sentence
string <- str_c(starwars$name, " is from ",
                starwars$homeworld, ".")

# Create an indicator where the specific pattern matches
ind <- str_detect(string = starwars$skin_color, pattern = "green")

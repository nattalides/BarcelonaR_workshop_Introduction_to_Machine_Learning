library(dplyr)
library(magrittr)

# Pipe each data manipulation operation to the next one
df <- starwars %>% 
  select(-films, -vehicles, -starships) %>% 
  filter(!is.na(mass)) %>% 
  mutate(height_m = height/100, 
         BMI = mass / (height_m)^2) %>% 
  arrange(desc(BMI)) %>% 
  group_by(gender) %>% 
  summarise(median_BMI = median(BMI))


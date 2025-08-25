data/         # put your cleaned CSV here

  install.packages(c(
    "tidyverse","lubridate","janitor","readr","readxl",
    "writexl","ggplot2","scales","hexbin","here"
  ))
install.packages("readxl")
library(readxl)
# Load data
collisions <- read_excel("data/Cleaned data.xlsx")

# Check first few rows
head(collisions)
str(collisions)   # column types
summary(collisions)  # quick summary

install.packages("janitor")
library(janitor)
collisions <- clean_names(collisions)
names(collisions)

install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")      # run once
library(dplyr)                 # load it every session



agg_hour <- collisions %>%
  count(hour, name = "collisions")

head(agg_hour)

agg_day_of_week <- collisions %>%
  count(day_of_week, name = "collisions")
agg_month <- collisions %>%
  count(month, name = "collisions")


agg_boro <- collisions %>% group_by(borough_clean) %>%
  summarise(collisions = n(),
            injuries   = sum(number_of_persons_injured, na.rm=TRUE),
            fatalities = sum(number_of_persons_killed,  na.rm=TRUE)) %>%
  arrange(desc(collisions))

top_factors <- collisions %>% count(contributing_factor_vehicle_1, name="collisions") %>%
  arrange(desc(collisions)) %>% slice_head(n=15)
library(ggplot2)


library(dplyr)

agg_hour <- collisions %>%
  count(hour, name = "collisions")

ggplot(agg_hour, aes(x = hour, y = collisions)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Collisions by Hour of Day",
    x = "Hour of Day",
    y = "Number of Collisions"
  ) +
  theme_minimal()

ggsave("outputs/plots/collisions_by_hour.png", p_hour, width = 8, height = 4, dpi = 200)
agg_borough <- collisions %>%
  count(borough, name = "collisions")

# Collisions by borough
p_borough <- ggplot(agg_borough, aes(x = reorder(borough, -collisions), y = collisions)) +
  geom_col(fill = "tomato") +
  labs(title = "Collisions by Borough",
       x = "Borough", y = "Number of Collisions") +
  theme_minimal()

ggsave("outputs/plots/collisions_by_borough.png", p_borough, width = 7, height = 4, dpi = 200)

agg_factor <- collisions %>%
  count(contributing_factor_vehicle_1, name = "collisions") %>%
  arrange(desc(collisions)) %>%
  head(10)   # top 10 factors
# Top 10 contributing factors
p_factors <- ggplot(agg_factor, aes(x = reorder(contributing_factor_vehicle_1, collisions), 
                                    y = collisions)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Top 10 Contributing Factors",
    x = "Factor",
    y = "Number of Collisions"
  ) +
  theme_minimal()

# Save it
ggsave("outputs/plots/top_contributing_factors.png", 
       p_factors, width = 8, height = 6, dpi = 200)




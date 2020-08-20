#Name: Stephanie Hurtado
#Date: 8/11/20
#Purpose: Exercise 06

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)

head(covid, 6)

# Question 1

top_states <- covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6)

covid %>%
  filter(state %in% top_states) %>%
  group_by(state, date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_line(aes(color = state)) +
  labs(title = "Cummulative Case Counts: COVID-19 Pandemic", x= "Data", y= "Cases", color = "" ) +
  facet_wrap(~state) +
  theme(legend.position = 'NA')

# Question 2

covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(aes(fill = "darkred", color = "darkred", alpha = 0.25)) +
  geom_line(color = "darkred", size = 2) +
  theme_classic() +
  labs(title = "National Cummulative Counts: COVID-19 Pandemic",
       x= "Data",
       y= "Cases",
       caption = "Daily Exercise 06") +
  theme(legend.position = 'NA')





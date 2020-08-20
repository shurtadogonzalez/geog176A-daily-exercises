#Name:Stephanie Hurtado
#Date:8/18/20
#Exercise: 08


library(tidyverse)
library(knitr)
url = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
covid = read_csv(url)
head(covid)

state.of.interest = "Oregon"


four_states = covid %>%
  filter (state == state.of.interest)%>%
  group_by(date) %>%
  summarize(cases = sum(cases)) %>%
  mutate(daily_new_cases= cases-lag(cases),
         seven_day_roll= rollmean(daily_new_cases, 7, fill = NA, align="right"))



ggplot(four_states, aes( x = date)) +
  geom_col(aes(y = daily_new_cases, col= "NA", fill = "#F5B8B5")) +
  geom_line(aes(y = seven_day_roll), col = "darkred", size = 1) +
  theme_minimal() +
  labs(title = "Oregon: Daily New COVID Cases", x= "Date", y= "Cases", caption = "Exercise 08", subtitle = "COVID-19 Data: NY Times" ) +
  theme(legend.position = 'NA')




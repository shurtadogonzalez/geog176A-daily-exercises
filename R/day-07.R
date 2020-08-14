# Name: Stephanie Hurtado
# Date: 08/13/20
# Exercise 07

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)
head(covid)

region <- data.frame(abb = state.abb, state = state.name, region = state.region)
head(region)

right_join(covid, region, by = "state") %>%
#?right_join
  count(region) %>%
  mutate(tot =sum(n))


covid_region <- covid %>%
  right_join(region, by = "state") %>%
  group_by(region, date)  %>%
  summarize(cases = sum(cases), deaths= sum(deaths)) %>%
  pivot_longer(cols = c('cases', 'deaths'))


ggplot(covid_region, aes( x = date, y = value)) +
  geom_line(aes(color = region)) +
  facet_grid(name~region, scale = "free_y") +
  labs(title = "Region Case and Death Counts: COVID-19 Pandemic", x= "Data", y= "Cases", color = "", caption = "Daily Exercise 07", subtitle = "COVID-19 Data: NY Times" ) +
  theme_light() +
  theme(legend.position = 'NA')



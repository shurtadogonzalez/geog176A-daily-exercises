#Name:Stephanie Hurtado
#Date:8/19/20
#Exercise: 10

library(tidyverse)

conus <- USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico", "Alaska", "Hawaii"))

length(st_geometry(conus))


us_combine = st_combine(conus) %>%
  st_cast("MULTILINESTRING")

us_union = st_union(conus) %>%
  st_cast("MULTILINESTRING")

plot(us_combine)


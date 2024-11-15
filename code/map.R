here::i_am("code/map.R")

pacman::p_load(
  tidyverse,
  sf,        # manage space data
  tigris    # grab US geo data
)

## read cleaned data
sdoh1 <- readRDS(
  here::here("output/cleaned_2009.rds")
)

## download map
us_counties <- tigris::counties(
  state = unique(sdoh1$STATEFIPS), 
  year = 2020, 
  class = "sf")

## prepare map data
map_data <- sdoh1 %>%
  select(COUNTYFIPS, cancer_mortality_rate) %>%
  left_join(us_counties, by = c("COUNTYFIPS" = "GEOID"))
map_data_sf <- st_as_sf(map_data)

## plot the map
map <- ggplot(data = map_data_sf) +
  geom_sf(aes(fill = cancer_mortality_rate), color = "white", size = 0.1) +
  scale_fill_viridis_c(option = "plasma", na.value = "grey90", name = "Crude Cancer Mortality Rate") +
  theme_void() +
  ggtitle("County-level Crude Cancer Mortality Rate in the United States (2009)") +
  theme(
    plot.title = element_text(hjust = 0.5),
    panel.background = element_rect(fill = "white", color = "white"), # Set panel background to white
    plot.background = element_rect(fill = "white", color = "white")  # Set plot background to white
  )

### save map
ggsave(
  filename = here::here("output/map.png"),
  plot = map,
  width = 12,   # Increase width
  height = 6,   # Decrease height
  units = "in"  # You can also use "cm" or "px"
)
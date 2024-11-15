here::i_am("code/table.R")

pacman::p_load(
  tidyverse,
  table1
)

## read raw data
sdoh <- read.csv(here::here("Analytic_Data_Set_Creationsdoh_2009.csv"), 
                 colClasses = rep("character", 680))
num_cols <- setdiff(1:680, c(2:7, 258, 298:311, 587))
sdoh[, num_cols] <- lapply(sdoh[, num_cols], as.numeric)


## data cleaning
sdoh1 <- sdoh %>% 
  filter(!is.na(Deaths) & !is.na(Population)) %>% 
  mutate(cancer_mortality_rate = Deaths / Population * 100000)

### save the cleaned data
saveRDS(
  sdoh1,
  here::here("output/cleaned_2009.rds")
  )

## create table
sdoh_table <- sdoh1 %>%
  mutate(
    REGION = factor(REGION, levels = names(sort(table(REGION), decreasing = TRUE))),
    Population = Population / 100
  )

excluded_counties <- nrow(sdoh) - nrow(sdoh_table)

label(sdoh_table$Deaths)     <- "Cancer Related Deaths"
label(sdoh_table$Population) <- "Population*"
label(sdoh_table$cancer_mortality_rate) <- "Crude Cancer Mortality Rate**"

table1 <- table1(
  ~ Deaths + Population + cancer_mortality_rate | REGION,
  data = sdoh_table,
  caption = paste0("County-Level Crude Cancer Mortality Rates by Region in 2009",
  overall = "Total",
  footnote = paste(
    "Excluding", excluded_counties, "counties due to missing data.",
    "* per 100 people",
    "** per 100,000 people."
    )
  )
)
### save table
saveRDS(
  table1,
  here::here("output/region_table.rds")
)
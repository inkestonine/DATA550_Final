# Data Source

The data `Analytic_Data_Set_Creationsdoh_2009.csv` is a combined data \
from these two data source
- [County-level SDOH](https://www.ahrq.gov/sdoh/data-analytics/sdoh-data.html)
- [Cancer mortality rates](https://wonder.cdc.gov/ucd-icd10.html)

# Project Description

This project aims to explore the spatial distribution of cancer mortality rates \
at the county level across the United States for the year 2009, with a \
particular focus on identifying and understanding regional disparities. \
The analysis will examine variations in crude cancer mortality rates across \
the four major U.S. Census regions: South, Midwest, West, and Northeast. \
Through a combination of statistical summaries and visualizations, this study \
will highlight key patterns and trends in cancer-related deaths, including the \
identification of counties with significantly elevated or reduced mortality rates. \
By conducting a comparative analysis of mean and median mortality rates within \
each region, the project will provide insights into regional differences and \
contribute to a better understanding of the geographic factors that influence \
cancer mortality.

The findings from this study will be used to inform public health initiatives \
and policy recommendations aimed at addressing cancer disparities and optimizing \
resource allocation in areas with high mortality rates. Key deliverables include \
statistical summaries of regional mortality rates, as well as a geographic \
visualization that clearly illustrates the disparities across counties.

# Project Structure

- `code/table.R` processes and summarizes county-level cancer mortality data for \
2009, focusing on the U.S. Census regions (South, Midwest, West, Northeast). \
It cleans the data, excluding counties with missing information, and outputs \
a cleaned dataset `output/cleaned_2009.rds` and a summary table \
`output/region_table.rds`. The table includes key statistics (mean, median, \
range) for cancer-related deaths, population size, and crude cancer mortality \
rates by region.

- `code/map.R` creates a map visualizing county-level cancer mortality rates \
in the U.S. for 2009. It joins cleaned data with U.S. county geography, \
generates a map `output/map.png`.

- `code/render_report.R` renders `report.Rmd`.
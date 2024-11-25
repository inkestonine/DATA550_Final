# Data Source

The data `Analytic_Data_Set_Creationsdoh_2009.csv` is a combined dataset derived from the following sources:
- [County-level SDOH](https://www.ahrq.gov/sdoh/data-analytics/sdoh-data.html)
- [Cancer mortality rates](https://wonder.cdc.gov/ucd-icd10.html)

This dataset was created by merging cancer mortality data at the county level with county-level Social Determinants of Health (SDOH) data for the year 2009.


# Project Description

This project aims to explore the spatial distribution of cancer mortality rates at the county level across the United States for the year 2009, with a particular focus on identifying and understanding regional disparities. The analysis will examine variations in crude cancer mortality rates across the four major U.S. Census regions: South, Midwest, West, and Northeast. Through a combination of statistical summaries and visualizations, this study will highlight key patterns and trends in cancer-related deaths, including the identification of counties with significantly elevated or reduced mortality rates. By conducting a comparative analysis of mean and median mortality rates within each region, the project will provide insights into regional differences and contribute to a better understanding of the geographic factors that influence cancer mortality.

The findings from this study will be used to inform public health initiatives and policy recommendations aimed at addressing cancer disparities and optimizing resource allocation in areas with high mortality rates. Key deliverables include statistical summaries of regional mortality rates, as well as a geographic visualization that clearly illustrates the disparities across counties.

# Project Structure

- `code/table.R`: Processes and summarizes county-level cancer mortality data for 2009, focusing on the U.S. Census regions (South, Midwest, West, Northeast). It cleans the data, excluding counties with missing information, and outputs a cleaned dataset (`output/cleaned_2009.rds`) and a summary table (`output/region_table.rds`). The summary table includes key statistics (mean, median, range) for cancer-related deaths, population size, and crude cancer mortality rates by region.

- `code/map.R`: Creates a choropleth map visualizing county-level cancer mortality rates in the U.S. for 2009. It joins the cleaned data with U.S. county geography and generates a map (`output/map.png`) to visually display disparities across regions.

- `code/render_report.R`: Renders the final report (`report.Rmd`) by calling `rmarkdown::render()`.


# Project Image

- There are two ways to reach the project image:

  - The project image is available in DockerHub [inkestonine/data550final](https://hub.docker.com/r/inkestonine/data550final), to download the image:
```{bash}
docker pull inkestonine/data550final
```

  - You can also build a image by yourself with:
```{bash}
make final
```

# Run the Project

## Working Directory
Make sure you are in the root directory of the project, where the `Makefile` and `report.Rmd` are located. To check the current working directory:
```{bash}
pwd
```

## Windows User
- To clone the Github repository:
```{bash}
git clone git@github.com:inkestonine/DATA550_Final.git
```

  - To build the report `report.Rmd`, run the following command:
```{bash}
make
```

  - To clean the output files in the `output/` directory and remove `.Rhistory`, run:

```{bash}
make clean
```

  - When you clone this repository for the first time, use the following command to restore the required packages:

```{bash}
make install
```

  - If you add, remove, or update any packages during development, use the following command to update the project library and synchronize the renv.lock file:

```{r}
renv::snapshot()
```
- To run the automated version of the image and generate the report
```{bash}
docker run -v "/$(pwd)":/project/report final
```

## Mac/Linux-OS User


- To run the automated version of the image and generate the report `report.html`, use the following command:

```{bash}
docker run -v "$(pwd)":/project/report final
```
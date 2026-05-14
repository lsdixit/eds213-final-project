# Exploring patterns of benthic invertebrates in the Sacramento-San Joaquin Bay-Delta
### EDS 213 Final Project

This repository contains all code and output for the final project for the course EDS 213 - Databases and Data Management for the University of California, Santa Barbara Master of Environmental Data Science Program.

In this project, we developed a relational database based on publicly available data. We pulled raw data, cleaned, and ingested into a relational database using Duckdb. This database was then queried using SQL to answer an analytical question and visualize using R. This process was presented as a speed talk at the end of the quarter.

## Data Sources
Data for this project come from the Interagency Ecological Program's [Environmental Monitoring Program](https://portal.edirepository.org/nis/mapbrowse?scope=edi&identifier=1036&revision=6). These data were accessed on April 6, 2026. This dataset contains multiple tables with information on multiple metrics, and this project used CPUE, taxonomy, and location datasets. This program monitors the benthic invertebrate assembleges of the upper San Francisco Estuary at 10 sites monthly since 1975. 

## Repository Structure
├── data
│   ├── processed : Cleaned data before duckdb database ingestion.
│   │   ├── cpue.csv
│   │   ├── org_keylist.csv
│   │   └── site.csv
│   └── raw : Raw data, uncleaned.
│       ├── Benthic organism keylist 2024.csv
│       ├── DWR Benthic CPUE data 1975-2024.csv
│       └── DWR benthic monitoring, active and historic site locations.csv
├── data_cleaning.qmd : Code for cleaning data before ingesting into a duckdb database.
├── data_exploration.sql : SQL code for generating a table to use for data visualization.
├── data_ingestion.sql : SQL to ingest processed data into a duckdb database.
├── eds213-final-project.duckdb : duckdb database for this project.
├── eds213-final-project.Rproj : Rproject files for this project.
├── plotting.qmd : R code for querying the database and data visualization.
├── README.md : File for the README.
├── requirements.txt : Depedencies required to reproduce this project.

## Citations
Wells, E. and Interagency Ecological Program. 2025. Interagency Ecological Program: Benthic invertebrate monitoring in the Sacramento-San Joaquin Bay-Delta, collected by the Environmental Monitoring Program, 1975-2024. ver 6. Environmental Data Initiative. https://doi.org/10.6073/pasta/49c541e4457528c3a9cfac33aa76bcd7 (Accessed 2026-05-14).

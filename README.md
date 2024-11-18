# COVID-19 Data Analysis and Tableau Integration

This repository contains SQL queries for two projects focused on COVID-19 data analysis:

1. **Tableau Portfolio Project**
2. **COVID Data Exploration**

Both projects utilize comprehensive datasets on COVID-19 cases, deaths, and vaccinations. The analysis aims to derive meaningful insights from the data and visualize the findings using **Tableau**.

## Project 1: Tableau Portfolio Project

### Description
This project explores COVID-19 statistics across various countries and continents, focusing on key metrics such as:
- Total cases and deaths
- Death percentage
- Population infection rates
- Vaccination trends

### SQL Queries Overview
The following queries were used:
- **Total Cases and Death Analysis**: Aggregates the total number of cases and deaths, calculating the death percentage.
- **Location-Based Death Count**: Analyzes death statistics excluding specific regions like 'World' or 'European Union' for better accuracy.
- **Infection Rate Analysis**: Calculates the percentage of the population infected across different locations.
- **Vaccination Coverage View**: Creates a view for analyzing the rolling sum of vaccinations by country.

### Tableau Integration
The processed data was exported to Tableau for creating dynamic dashboards and visualizations. Some of the key visualizations include:
- **Global Heatmap of COVID-19 Cases**: Displays the intensity of COVID-19 cases globally.
- **Trend Analysis of Infection Rates**: Line charts to show the progression of infection rates over time.
- **Vaccination Rollout Dashboard**: Tracks the progress of vaccinations using cumulative metrics.

The use of Tableau allowed for interactive exploration of the data, with filters and drill-down capabilities for in-depth analysis.

## Project 2: COVID Data Exploration

### Description
The COVID Data Exploration project dives deeper into the data to uncover patterns and trends. The analysis focuses on:
- Daily average deaths and case percentages
- Rolling averages for new cases
- Population-based infection rate analysis

### SQL Queries Overview
- **Worldwide Case and Death Analysis**: Computes average daily deaths and maximum cases per country.
- **Rolling Average Calculation**: Uses window functions to compute a 7-day rolling average of new cases.
- **Population-Based Infection Rate**: Analyzes infection rates by comparing reported cases to the total population.

### Tableau Integration
The insights from this analysis were visualized using Tableau. Key dashboards include:
- **Daily Trends Dashboard**: Showcases the rolling average of new cases, helping identify spikes and trends.
- **Infection Rate Comparison**: A comparative view of infection rates across countries.
- **Top Affected Countries**: Highlights the countries with the highest infection rates and total cases.

## Datasets
The data used in these projects was sourced from publicly available COVID-19 datasets, which included information on:
- Total cases, new cases, and deaths
- Population statistics
- Vaccination details
- Link to dataset: https://ourworldindata.org/covid-deaths

## Prerequisites
To run the SQL queries locally, you need:
- **SQL Server** or a compatible SQL database.
- Datasets loaded into the database as tables: `COVID_Statistics` and `Vaccination_Records` for Tableau Portfolio Project, and `COVID_Details` for Data Exploration.

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/covid-data-analysis.git

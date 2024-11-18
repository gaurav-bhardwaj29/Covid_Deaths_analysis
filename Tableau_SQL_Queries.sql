
/* 
Modified Queries for Tableau Project 
*/

/* Query 1: Calculate Total Cases, Total Deaths, and Death Percentage */
SELECT 
    SUM(new_cases) AS total_cases, 
    SUM(CAST(deaths_reported AS INT)) AS total_deaths, 
    (SUM(CAST(deaths_reported AS INT)) / NULLIF(SUM(new_cases), 0)) * 100 AS death_percentage
FROM 
    ProjectDatabase.COVID_Statistics
WHERE 
    region IS NOT NULL
ORDER BY 
    total_cases DESC;

/* Query 2: Total Death Count by Location (Excluding World, EU, International) */
SELECT 
    region_name, 
    SUM(CAST(deaths_reported AS INT)) AS total_death_count
FROM 
    ProjectDatabase.COVID_Statistics
WHERE 
    region IS NULL 
    AND region_name NOT IN ('Global', 'EU Group', 'International Zone')
GROUP BY 
    region_name
ORDER BY 
    total_death_count DESC;

/* Query 3: Infection Statistics by Location */
SELECT 
    region_name, 
    population, 
    MAX(cases_reported) AS peak_cases,  
    MAX((cases_reported / NULLIF(population, 0)) * 100) AS percent_infected
FROM 
    ProjectDatabase.COVID_Statistics
GROUP BY 
    region_name, population
ORDER BY 
    percent_infected DESC;

/* Query 4: Date-wise Infection Analysis */
SELECT 
    region_name, 
    population, 
    date_reported, 
    MAX(cases_reported) AS peak_cases,  
    MAX((cases_reported / NULLIF(population, 0)) * 100) AS percent_infected
FROM 
    ProjectDatabase.COVID_Statistics
GROUP BY 
    region_name, population, date_reported
ORDER BY 
    date_reported;

/* View Creation for Vaccination Analysis */
CREATE VIEW VaccinationCoverage AS
SELECT 
    region, 
    country_name, 
    report_date, 
    population, 
    vaccinations_administered,
    SUM(CONVERT(INT, vaccinations_administered)) OVER (PARTITION BY country_name ORDER BY report_date) AS cumulative_vaccinations
FROM 
    ProjectDatabase.Vaccination_Records
WHERE 
    region IS NOT NULL;

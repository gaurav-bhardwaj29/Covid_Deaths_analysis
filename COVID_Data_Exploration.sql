
/* 
Modified COVID Data Exploration Queries 
*/

/* Query 1: Worldwide Case and Death Analysis */
SELECT 
    country, 
    continent, 
    AVG(cast(deaths AS FLOAT)) AS avg_daily_deaths, 
    MAX(total_cases) AS max_cases, 
    (MAX(total_cases) / NULLIF(AVG(population), 0)) * 100 AS case_percent_population
FROM 
    GlobalHealth.COVID_Details
WHERE 
    country NOT IN ('Antarctica')
GROUP BY 
    country, continent
ORDER BY 
    avg_daily_deaths DESC;

/* Query 2: Rolling Average of New Cases */
WITH CaseTrends AS (
    SELECT 
        date_reported, 
        country, 
        new_cases,
        AVG(new_cases) OVER (PARTITION BY country ORDER BY date_reported ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_avg_cases
    FROM 
        GlobalHealth.COVID_Details
)
SELECT 
    * 
FROM 
    CaseTrends
WHERE 
    rolling_avg_cases > 100;

/* Temporary Table for Population-based Analysis */
DROP TABLE IF EXISTS #PopulationAnalysis;
CREATE TABLE #PopulationAnalysis (
    country_name NVARCHAR(100),
    total_population NUMERIC,
    infected_population NUMERIC
);

INSERT INTO #PopulationAnalysis
SELECT 
    country, 
    population, 
    SUM(cases_reported)
FROM 
    GlobalHealth.COVID_Details
GROUP BY 
    country, population;

SELECT 
    country_name, 
    (infected_population / NULLIF(total_population, 0)) * 100 AS infection_rate
FROM 
    #PopulationAnalysis
ORDER BY 
    infection_rate DESC;

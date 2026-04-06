use esmel
--- Q1 — Top 10 most populated countries and their population density
SELECT
    country,
    african_region,
    total_population,
    population_rank,
    population_density
FROM africa_countries
ORDER BY total_population DESC
LIMIT 10;
-- Decision: prioritize these countries for demographic investment strategies

--- Q2 — Region with the highest total population
SELECT
    african_region,
    SUM(total_population)        AS total_population_region,
    ROUND(AVG(population_density), 2) AS avg_density,
    COUNT(country)               AS nb_countries
FROM africa_countries
GROUP BY african_region
ORDER BY total_population_region DESC;
-- Decision: target high-population regions for market or development programs

--- Q3 — Top 10 largest countries by area and their size category
SELECT
    country,
    african_region,
    area_km2,
    area_category
FROM africa_countries
ORDER BY area_km2 DESC
LIMIT 10;
-- Decision: large territory = higher infrastructure and logistics complexity

--- Q4 — Region covering the largest total area
SELECT
    african_region,
    ROUND(SUM(area_km2), 2)  AS total_area_km2,
    ROUND(AVG(area_km2), 2)  AS avg_area_km2,
    COUNT(country)           AS nb_countries
FROM africa_countries
GROUP BY african_region
ORDER BY total_area_km2 DESC;
-- Decision: vast regions require differentiated territorial strategies

--- Q5 — Countries with the highest language count and diversity level
SELECT
    country,
    african_region,
    language_count,
    linguistic_diversity_level
FROM africa_countries
ORDER BY language_count DESC
LIMIT 10;
-- Decision: high linguistic diversity = higher communication and governance costs

--- Q6 — Region with the highest average linguistic diversity
SELECT
    african_region,
    ROUND(AVG(language_count), 2)  AS avg_language_count,
    MAX(language_count)            AS max_language_count,
    COUNT(country)                 AS nb_countries
FROM africa_countries
GROUP BY african_region
ORDER BY avg_language_count DESC;
-- Decision: regions with high avg diversity need multilingual policy frameworks

--- Q7 — Top 10 countries with the highest complexity score
SELECT
    country,
    african_region,
    complexity_score,
    total_population,
    area_km2,
    language_count
FROM africa_countries
ORDER BY complexity_score DESC
LIMIT 10;
-- Decision: these countries require the most sophisticated multi-sector strategies

--- Q8 — Countries combining high complexity score AND high linguistic diversity
SELECT
    country,
    african_region,
    complexity_score,
    language_count,
    linguistic_diversity_level
FROM africa_countries
WHERE linguistic_diversity_level IN ('High', 'Very High')
ORDER BY complexity_score DESC;
-- Decision: these countries combine scale and linguistic fragmentation — highest strategic risk

--- Q9 — Landlocked countries with the most borders and their connectivity profile
SELECT
    country,
    african_region,
    border_count,
    is_landlocked,
    connectivity_profile
FROM africa_countries
WHERE is_landlocked = 1
ORDER BY border_count DESC;
-- Decision: landlocked but well-connected countries have strong regional trade potential

--- Q10 — Average profile (population, area, languages) by African region
SELECT
    african_region,
    COUNT(country)                        AS nb_countries,
    ROUND(AVG(total_population), 0)       AS avg_population,
    ROUND(AVG(area_km2), 2)               AS avg_area_km2,
    ROUND(AVG(language_count), 2)         AS avg_language_count,
    ROUND(AVG(complexity_score), 2)       AS avg_complexity_score,
    ROUND(AVG(population_density), 2)     AS avg_population_density
FROM africa_countries
GROUP BY african_region
ORDER BY avg_complexity_score DESC;
-- Decision: regional benchmarking for cross-regional strategy prioritization
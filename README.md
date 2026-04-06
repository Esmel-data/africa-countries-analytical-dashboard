# africa-countries-analytical-dashboard
End-to-end data analysis project on African countries — REST API → Python → SQL → Power BI

# 🌍 Africa Countries:Population, Territory & Linguistic Complexity

> Which African countries combine the highest population, the largest territory,
> and the greatest linguistic diversity — and how do these dimensions define
> strategic complexity profiles?


## 1. Project Overview

Africa is a continent of 54 countries with highly heterogeneous demographic,
territorial, and linguistic profiles. This project leverages data collected via
REST API (Africa Countries API) to produce a complete, reproducible, and
decision-oriented analysis.

The goal is to identify countries that simultaneously combine demographic weight,
territorial extent, and linguistic diversity — and to deliver an interactive
Power BI dashboard enabling executives and managers to compare, filter, and
prioritize African countries by strategic complexity.


## 2. Dataset

| Criteria         | Details                                      |
|------------------|----------------------------------------------|
| Source           | Africa Countries REST API (JSON → CSV)       |
| Raw variables    | 9                                            |
| Final variables  | 14 (after feature engineering)               |
| Rows             | 54 (one per African country)                 |
| Time dimension   | Static — no temporal coverage                |
| Access method    | HTTP GET request → JSON parsed into pandas   |

Variable categories:
- Geographic: `country`, `african_region`, `area_km2`, `is_landlocked`
- Demographic: `total_population`, `population_density`, `population_rank`
- Linguistic: `language_count`, `currency_count`
- Connectivity: `border_count`, `connectivity_profile`
- Engineered: `area_category`, `linguistic_diversity_level`, `complexity_score`


## 3. Tools & Technologies

| Tool                  | Role in pipeline                                          |
|-----------------------|-----------------------------------------------------------|
| REST API          | Data collection via HTTP GET (Africa Countries API)       |
| Python / Jupyter  | Data quality audit, cleaning, feature engineering, export |
| SQL / MySQL       | 10 analytical queries covering all decision dimensions    |
| Power BI Desktop  | Interactive dashboard — DAX measures, KPI cards, slicers  |
| Gamma             | Analytical presentation for stakeholders                  |


## 4. Project Steps

1. API Data Collection (Python)
   Extracted data from the Africa Countries REST API via HTTP GET request.
   JSON response parsed into a pandas DataFrame and exported to CSV.

2. Data Quality Audit (Python)
   Verified variable types, checked for missing values (none found),
   detected outliers via IQR method (retained as valid geographic realities),
   converted boolean to int for SQL/Power BI compatibility.

3. Feature Engineering (Python)
   Created 6 business variables: `population_density`, `population_rank`,
   `area_category`, `linguistic_diversity_level`, `connectivity_profile`,
   and the central KPI `complexity_score` (normalized 0–100).
   Dropped `capital_city` — no KPI or visual uses it.
   Renamed all columns to snake_case for SQL and Power BI readability.

4. SQL Analysis (MySQL Workbench)
   Imported clean dataset via SQLAlchemy + pymysql (`to_sql`).
   Executed 10 analytical queries covering demographic power, territorial
   dominance, linguistic diversity, complexity ranking, and geopolitical
   connectivity.

5. Decision-Making Dashboard (Power BI)
   Built a single-page dashboard with 5 KPI cards, 7 analytical visuals,
   and 5 interactive slicers. Created 19 DAX measures covering totals,
   averages, ratios, and rankings.

6. Analytical Report & Presentation (Gamma)
   Produced a professional portfolio report and a stakeholder presentation
   covering all pipeline steps, SQL findings, and business recommendations.


## 5. Dashboard Preview

Key visuals on the dashboard:
- Top 5 countries by complexity score: ranked bar chart directly
  answering the central business question
- Population & Area by region: clustered bar chart for regional
  benchmarking across 2 dimensions simultaneously
- Scatter plot: Population vs Complexity Score — bubble size = area_km2,
  color = african_region — reveals multi-dimensional country profiles at a glance
- 100% stacked bar: Linguistic diversity by region — shows distribution
  of Low / Medium / High / Very High levels per region


## 6. Key Results & Insights

1. DR Congo, South Africa, and Nigeria are the most complex countries
   on the continent — they dominate simultaneously on population, territory,
   and linguistic diversity. Any continental strategy must prioritize these
   markets first.

2. Southern Africa has the highest average linguistic diversity (6.83
   languages per country), significantly higher than Central or West Africa —
   a counter-intuitive result with major implications for multilingual strategy.

3. Landlocked does not mean isolated — Zambia (8 borders), Niger and Mali
   (7 borders each) display a "Landlocked Connected" profile with strong
   regional trade potential despite having no sea access.

4. Northern Africa dominates in territory (avg 1.13M km² per country)
   but has the lowest population density on the continent — signaling
   significant under-exploited potential in energy and agriculture sectors.

5. Within-region heterogeneity is high — uniform regional strategies are
   ineffective. The complexity_score reveals that countries within the same
   region can have vastly different strategic profiles, requiring
   country-level differentiated approaches.


## 7. How to Run

### Prerequisites
```bash
pip install pandas numpy sqlalchemy pymysql mysql-connector-python jupyter
```

### Steps

1. Clone this repository:
```bash
   git clone https://github.com/your-username/africa-countries-analytical-dashboard.git
   cd africa-countries-analytical-dashboard
```

2. Open and run the Jupyter Notebook:
```bash
   jupyter notebook africa_countries_api.ipynb
```
   > This will call the API, clean the data, engineer features,
   > and export `africa_countries_clean.csv`

3. Import into MySQL:
   - Open MySQL Workbench
   - Create database: `CREATE DATABASE esmel_db;`
   - Run the SQLAlchemy import cell in the notebook
   - Execute the 10 SQL queries from `queries.sql`

4. Open Power BI:
   - Connect to MySQL database `esmel_db`
   - Load table `africa_countries`
   - Import DAX measures from `dax_measures.txt`
   - Rebuild or open `africa_countries.pbix`

### Dataset

The dataset is fetched live via the Africa Countries REST API.
No manual download required — the API call is included in the notebook.


## Author

ESMEL — Data Analyst
[LinkedIn](www.linkedin.com/in/esmel-amari)

end-to-end pipeline from API data collection to executive dashboard.

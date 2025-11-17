#  MLB SQL Analysis Project
**Author:** Roberto Chiaiese  
**Type:** SQL Data Analysis  
**Database:** MLB (Major League Baseball)  
**Focus:** Window functions, aggregations, CTEs, decade-based analytics  

---

##  Overview

This project analyzes MLB (Major League Baseball) data using SQL.  
The goal is to extract meaningful insights on:

- Schools that produced MLB players  
-  Team spending behavior  
-  Player career trajectories  
- Decade-level trends  
-  Batting and demographic characteristics  

Queries are modularized and organized in separate folders for clarity and maintainability.  
The dataset is initialized via a dedicated SQL file included in the `data/` directory.

---

##  Project Structure

```
mlb-sql-analysis/
│
├── README.md
│
├── data/
│ └── init_mlb_database.sql
│
├── queries/
│ ├── 01_schools/
│ │ ├── q1_schools_by_decade.sql
│ │ ├── q2_top5_schools.sql
│ │ └── q3_top3_schools_per_decade.sql
│ │
│ ├── 02_teams_salaries/
│ │ ├── q1_top20_percent_spending.sql
│ │ ├── q2_cumulative_spending.sql
│ │ └── q3_first_year_surpassing_1b.sql
│ │
│ ├── 03_players_careers/
│ │ ├── q1_ages_and_career_length.sql
│ │ ├── q2_first_and_last_team.sql
│ │ └── q3_same_team_over_decade.sql
│ │
│ └── 04_misc/
│ ├── q1_same_birthday.sql
│ ├── q2_batting_percentage_by_team.sql
│ └── q3_height_weight_by_decade.sql
│
└── outputs/

```



##  How to Run

1. Install MySQL or a compatible SQL engine.  
2. Load the MLB dataset in mySQL.

3. Select the database:
```
USE MLBdb;
```

4. Execute any of the SQL files inside the queries/ directory.


##  SQL Techniques Demonstrated

### 🔹 Window Functions
- `ROW_NUMBER()`
- `LAG()`
- `NTILE()`
- `SUM() OVER (PARTITION BY ...)`

### 🔹 Aggregation & Grouping
- `COUNT(DISTINCT ...)`
- `AVG()`
- `SUM()`
- Multi-level grouping

### 🔹 CTEs (Common Table Expressions)
- Multi-stage analytical transformations  
- Readable structuring of complex logic  

### 🔹 Join Operations
- `LEFT JOIN`
- `INNER JOIN`
- `RIGHT JOIN`

### 🔹 Temporal Analysis
- Decade calculations  
- Career length computation  
- Cumulative financial trends  

---

##  Example Insights

###  Schools
- The number of schools producing MLB players steadily increases across decades.  
- Only a few schools dominate in player production.

###  Spending Behavior
- The top 20% of MLB teams spend dramatically more than the median.  
- Teams surpass the $1B cumulative spending mark at very different times.

###  Player Careers
- Most players start and end on different teams.  
- Only a small subset plays more than a decade on the same team.

---

##  Contact

**Roberto Chiaiese**  
Bioinformatics & Data Engineering Student  

LinkedIn: *[Roberto Chiaiese](https://www.linkedin.com/in/roberto-chiaiese-7b90b8248/)*

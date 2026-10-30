# Tech Company Job Market Analytics

## Project Overview

**Tech Company Job Market Analytics** is a data analytics project that explores publicly listed job postings from Stripe to understand hiring patterns, job categories, locations, seniority levels, and technical skill demand.

The project uses Python for data processing and analysis, MySQL for querying and validating data, and Power BI to build an interactive dashboard that helps users explore hiring trends.

## Objectives

- Analyze the distribution of job postings across job categories and departments.
- Identify locations with the highest number of job postings.
- Explore seniority levels across available positions.
- Compare keyword mentions for SQL and Python across departments.
- Build an interactive Power BI dashboard with filters for deeper exploration.
- Demonstrate an end-to-end data analytics workflow.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data collection, cleaning, and analysis |
| Jupyter Notebook | Exploratory data analysis and workflow documentation |
| Pandas | Data manipulation and preparation |
| Requests and BeautifulSoup | Retrieving job data and parsing HTML descriptions |
| MySQL | Data storage, querying, and validation |
| SQL | Data analysis and aggregation |
| Power BI | Interactive dashboard and visualizations |
| GitHub | Project version control and portfolio presentation |

## Dataset

The dataset was collected from the publicly accessible Stripe Greenhouse job board API:

**Data source:** https://boards-api.greenhouse.io/v1/boards/stripe/jobs?content=true

The featured dataset contains **720 job postings and 43 columns**.

The data includes job-related information such as titles, departments, locations, job URLs, seniority classifications, and skill keyword indicators.

**Data note:** Job listings and hiring requirements can change over time. The dataset represents the postings collected for this project and should not be interpreted as a live count of Stripe vacancies.

## Project Workflow

1. **Data Collection:** Retrieve job-posting information from the public Greenhouse API.
2. **Data Cleaning:** Prepare the dataset, handle missing values, and organize relevant fields.
3. **Feature Engineering:** Classify job categories and seniority levels and create skill keyword indicators.
4. **SQL Analysis:** Store and query the data in MySQL to validate records and analyze hiring patterns.
5. **Exploratory Data Analysis:** Examine job distributions, locations, departments, and skill mentions.
6. **Power BI Visualization:** Build an interactive dashboard with KPI cards, charts, and slicers.
7. **GitHub Documentation:** Publish the project files and explain the analysis and findings.

## Power BI Dashboard

The interactive Power BI dashboard provides an overview of job postings, category distribution, seniority levels, hiring locations, and technical skill mentions.

### Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Job Postings | 720 |
| Unique Job Categories | 17 |
| SQL Keyword Mentions | 150 |
| Python Keyword Mentions | 87 |

### Dashboard Visualizations

- Job Postings by Category
- Job Postings by Seniority Level
- Top 5 Hiring Locations
- SQL vs Python Demand by Department

### Interactive Filters

Users can explore the dashboard using slicers for:

- Job Category
- Location
- Department
- Seniority Level

Hover over chart bars to view exact values through tooltips. Use the slicers to explore how distributions change for different categories, locations, departments, and seniority levels.

## Dashboard Data Labels & Insights

The following numerical results were calculated directly from the featured CSV dataset containing 720 job postings.

### 1. Job Postings by Category

**Chart type:** Horizontal bar chart

| Job Category | Job Postings | Percentage |
|---|---:|---:|
| Sales / Business Development | 173 | 24.03% |
| Software Engineering | 128 | 17.78% |
| Strategy / Operations | 83 | 11.53% |
| Other | 59 | 8.19% |
| Technical Solutions | 54 | 7.50% |
| Product | 43 | 5.97% |
| Risk / Fraud | 38 | 5.28% |
| Marketing | 35 | 4.86% |
| Customer Success / Support | 23 | 3.19% |
| Internship | 22 | 3.06% |
| Human Resources | 13 | 1.81% |
| Legal / Compliance | 13 | 1.81% |
| Finance | 12 | 1.67% |
| AI / Machine Learning | 12 | 1.67% |
| Data Analytics | 9 | 1.25% |
| Data Engineering | 2 | 0.28% |
| Security | 1 | 0.14% |

**Key Insights:**

- Sales / Business Development leads with 173 postings, representing 24.03% of the dataset.
- Software Engineering ranks second with 128 postings (17.78%).
- Strategy / Operations contributes 83 postings (11.53%).
- The top three categories account for 43.34% of all collected postings.
- Data Analytics, Data Engineering, and Security have comparatively fewer classified postings.

**Business Interpretation:**

The distribution shows that the collected job postings are concentrated in business development, software engineering, and strategy-related roles. It also demonstrates that the company recruits across a wide range of technical and non-technical functions.

### 2. Job Postings by Seniority Level

**Chart type:** Column chart

| Seniority Level | Job Postings | Percentage |
|---|---:|---:|
| Unspecified | 417 | 57.92% |
| Lead / Manager | 220 | 30.56% |
| Staff / Principal | 47 | 6.53% |
| Intern | 22 | 3.06% |
| Senior | 12 | 1.67% |
| Entry Level | 1 | 0.14% |
| Executive / Director | 1 | 0.14% |

**Key Insights:**

- Unspecified seniority represents the largest group, with 417 postings (57.92%).
- Lead / Manager positions account for 220 postings (30.56%).
- Staff / Principal roles contribute 47 postings (6.53%).
- Internship positions account for 22 postings (3.06%).
- Senior, Entry Level, and Executive / Director classifications have relatively low counts.

**Business Interpretation:**

The large unspecified category indicates that seniority information is not clearly identifiable in many job postings using the project's classification rules. Therefore, seniority-based conclusions should be interpreted carefully rather than assuming that unspecified roles represent a particular experience level.

### 3. Top 5 Hiring Locations

**Chart type:** Horizontal bar chart

| Rank | Location | Job Postings | Percentage of Total |
|---:|---|---:|---:|
| 1 | Singapore | 50 | 6.94% |
| 2 | Dublin | 46 | 6.39% |
| 3 | Bengaluru | 34 | 4.72% |
| 4 | London | 32 | 4.44% |
| 5 | Mexico City | 20 | 2.78% |

**Key Insights:**

- Singapore leads the displayed locations with 50 postings.
- Dublin follows closely with 46 postings.
- Bengaluru ranks third with 34 postings.
- London and Mexico City have 32 and 20 postings, respectively.
- The five displayed locations together account for 182 postings, or 25.28% of the dataset.

**Business Interpretation:**

The location distribution highlights several important international hiring markets. Singapore and Dublin lead the displayed locations, while Bengaluru and London also represent significant hiring activity in the collected dataset.

### 4. SQL vs Python Demand by Department

**Chart type:** Clustered horizontal bar chart

The chart compares the number of job descriptions containing SQL and Python keywords across selected departments.

| Department | Python Mentions | SQL Mentions |
|---|---:|---:|
| 8611 Security Analytics | 14 | 13 |
| Global Operations | 10 | 9 |
| 7112 Data Science | 9 | 9 |
| 4119 Product Support | 1 | 8 |
| 1520 Sales Operations (SS&O) | 0 | 10 |

**Key Insights:**

- Security Analytics has the highest Python mentions (14) and SQL mentions (13) among the five displayed departments.
- Global Operations records 10 Python mentions and 9 SQL mentions.
- Data Science has equal mentions of Python and SQL, with 9 each.
- Product Support shows more SQL mentions (8) than Python mentions (1).
- Sales Operations has 10 SQL mentions and no Python mentions in the collected data.

**Business Interpretation:**

The comparison shows that technical skill mentions vary across departments. Security Analytics and Data Science show demand for both Python and SQL, while Product Support and Sales Operations have more SQL mentions than Python.

This can help job seekers understand how technical skill mentions differ across business functions.

## Overall Dashboard Findings

The analysis of 720 collected job postings produced the following findings:

- **720 job postings** were analyzed across 17 job categories.
- **Sales / Business Development** was the largest job category, with 173 postings (24.03%).
- **Software Engineering** ranked second, with 128 postings (17.78%).
- **Unspecified seniority** accounted for 417 postings (57.92%), indicating a major classification limitation.
- **Singapore** was the leading displayed hiring location, with 50 postings.
- **SQL appeared in 150 postings**, compared with **87 postings mentioning Python**.
- Among the five displayed departments, Security Analytics had the highest SQL and Python keyword counts.

## Important Methodological Notes

- Skill indicators represent keyword mentions in job-posting content. A mention does not necessarily mean the skill is a mandatory requirement.
- Seniority classifications depend on the available job information and classification rules.
- Missing location values were represented as `Unknown` for analysis. The top-five location percentages use all 720 postings as the denominator.
- Location counts use the location values as represented in the featured CSV. Different spellings or combined-location entries may be treated as separate values.
- Department-level SQL and Python counts are calculated by summing the binary skill indicator columns for the displayed departments.
- The `date_updated` field reflects the update information available in the collected data; it should not be assumed to represent the original publication date of each job posting.
- Results depend on the dataset snapshot and the processing rules used in the project.

## Business Interpretation

This project demonstrates how publicly available job-posting data can be transformed into useful hiring-market insights.

The dashboard helps explore:

- Which job categories have more listed opportunities.
- Which seniority classifications appear most frequently.
- Which locations have greater representation in the collected postings.
- How SQL and Python keyword mentions differ across departments.

The analysis can help students, job seekers, and analysts understand patterns in job descriptions and explore the technical skills mentioned across different business functions.

## Project Files

The repository is intended to contain the following core files:

```text
Tech-Company-Job-Market-Analytics/
│
├── README.md
├── Job_Market_Analytics.ipynb
├── job_market_analysis.sql
├── job_market_additional_queries.sql
├── import_stripe_jobs.py
├── Stripe_Job_Postings_Featured.csv
└── Job_Market_Analytics.pbix
```


## How to Explore the Project

1. Review the Jupyter Notebook to understand the Python workflow.
2. Open the SQL files to explore the database queries.
3. Review the featured CSV dataset to understand the analyzed records.
4. Open the Power BI report in Power BI Desktop to interact with the dashboard.

The Python environment and MySQL database connection may need to be configured locally before rerunning the workflow. Do not publish database passwords, credentials, or other secrets.



## Author

**Harshit Kaushik**

B.Tech — Computer Science and Engineering

This project was developed as part of a data analytics portfolio to demonstrate practical skills in Python, SQL, MySQL, exploratory data analysis, and Power BI.

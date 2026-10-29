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

The featured dataset contains **720 job postings and 42 columns**.

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

The dashboard includes the following KPIs and visualizations.

### Key Performance Indicators

- Total Job Postings
- Unique Job Categories
- SQL Keyword Mentions
- Python Keyword Mentions

### Visualizations

- **Job Postings by Category:** Compares the number of postings across job categories.
- **Job Postings by Seniority Level:** Shows how postings are distributed by seniority classification.
- **Top Hiring Locations:** Highlights locations with the most job postings.
- **SQL vs. Python Demand by Department:** Compares SQL and Python keyword mentions across departments.

### Interactive Filters

Users can explore the dashboard using slicers for:

- Job Category
- Location
- Department
- Seniority Level

Hover over chart bars to view exact values through tooltips. Use the slicers to explore how the distributions change for different categories, locations, departments, and seniority levels.

## Initial Findings

The analysis produced the following observations from the collected dataset:

- **720 job postings** were included in the featured dataset.
- **17 job categories** were represented in the dashboard.
- SQL appeared as a keyword in **150 postings**, while Python appeared in **87 postings**.
- Singapore, Dublin, and Bengaluru were among the leading locations by posting count.
- A large portion of postings had an unspecified seniority classification, highlighting a limitation of classifying seniority from available job-posting information.

These are observations from the collected dataset, not necessarily a complete picture of Stripe's hiring activity.

## Important Methodological Notes

- Skill indicators represent keyword mentions in job-posting content. A mention does not necessarily mean the skill is a mandatory requirement.
- Seniority classifications depend on the available job information and classification rules.
- Missing location values were represented as `Unknown` for analysis.
- The `date_updated` field reflects the update information available in the collected data; it should not be assumed to represent the original publication date of each job posting.
- Results depend on the dataset snapshot and the processing rules used in the project.

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

*The filenames above are the intended repository names. Adjust them to match the actual files you upload.*

## How to Explore the Project

1. Review the Jupyter Notebook to understand the Python workflow.
2. Open the SQL files to explore the database queries.
3. Review the featured CSV dataset to understand the analyzed records.
4. Open the Power BI report in Power BI Desktop to interact with the dashboard.

The Python environment and MySQL database connection may need to be configured locally before rerunning the workflow. Do not publish database passwords, credentials, or other secrets.

## Future Improvements

- Add historical snapshots to analyze changes in job postings over time.
- Improve skill extraction using more comprehensive text-processing techniques.
- Expand the analysis to additional companies and job boards.
- Add more department-level and location-level comparisons.
- Automate periodic data collection to monitor hiring trends.

## Author

**Harshit Kaushik**

B.Tech — Computer Science and Engineering

This project was developed as part of a data analytics portfolio to demonstrate practical skills in Python, SQL, MySQL, exploratory data analysis, and Power BI.

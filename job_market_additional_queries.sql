USE stripe_job_analytics;

DROP TABLE IF EXISTS stripe_go_update;

CREATE TABLE stripe_go_update (
    job_id VARCHAR(50) PRIMARY KEY,
    skill_go TINYINT NOT NULL
);

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT job_id) AS unique_job_ids,
    SUM(skill_go) AS corrected_go_count
FROM stripe_go_update;

UPDATE stripe_jobs_import AS original
JOIN stripe_go_update AS corrected
    ON original.job_id = corrected.job_id
SET original.skill_go = corrected.skill_go
WHERE corrected.job_id IS NOT NULL;

SET SQL_SAFE_UPDATES = 0;

SELECT
    COUNT(*) AS total_rows,
    SUM(CAST(skill_go AS UNSIGNED)) AS updated_go_count
FROM stripe_jobs_import;

DROP TABLE stripe_go_update;

USE stripe_job_analytics;

DROP TABLE IF EXISTS stripe_excel_update;

CREATE TABLE stripe_excel_update (
    job_id VARCHAR(50) PRIMARY KEY,
    skill_excel TINYINT NOT NULL
);

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT job_id) AS unique_job_ids,
    SUM(skill_excel) AS excel_count
FROM stripe_excel_update;

SET SQL_SAFE_UPDATES = 0;

UPDATE stripe_jobs_import AS original
JOIN stripe_excel_update AS corrected
    ON original.job_id = corrected.job_id
SET original.skill_excel = corrected.skill_excel;

SELECT
    COUNT(*) AS total_rows,
    SUM(CAST(skill_go AS UNSIGNED)) AS go_count,
    SUM(CAST(skill_excel AS UNSIGNED)) AS excel_count
FROM stripe_jobs_import;

DROP TABLE stripe_excel_update;

USE stripe_job_analytics;

SELECT
    COUNT(*) AS total_jobs,
    COUNT(DISTINCT job_id) AS unique_job_ids,
    SUM(CAST(skill_go AS UNSIGNED)) AS go_mentions,
    SUM(CAST(skill_excel AS UNSIGNED)) AS excel_mentions
FROM stripe_jobs_import;

SELECT
    job_category,
    COUNT(*) AS total_postings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM stripe_jobs_import),
        2
    ) AS percentage_of_postings
FROM stripe_jobs_import
GROUP BY job_category
ORDER BY total_postings DESC;

SELECT
    seniority_level,
    COUNT(*) AS total_postings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM stripe_jobs_import),
        2
    ) AS percentage_of_postings
FROM stripe_jobs_import
GROUP BY seniority_level
ORDER BY total_postings DESC;

SELECT
    location,
    COUNT(*) AS total_postings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM stripe_jobs_import),
        2
    ) AS percentage_of_all_postings
FROM stripe_jobs_import
WHERE location IS NOT NULL
  AND TRIM(location) <> ''
GROUP BY location
ORDER BY total_postings DESC
LIMIT 10;

SELECT
    department,
    COUNT(*) AS total_postings,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM stripe_jobs_import),
        2
    ) AS percentage_of_postings
FROM stripe_jobs_import
WHERE department IS NOT NULL
  AND TRIM(department) <> ''
GROUP BY department
ORDER BY total_postings DESC
LIMIT 10;

SELECT
    'SQL' AS skill,
    SUM(CAST(skill_sql AS UNSIGNED)) AS job_postings
FROM stripe_jobs_import

UNION ALL

SELECT
    'Python',
    SUM(CAST(skill_python AS UNSIGNED))
FROM stripe_jobs_import

UNION ALL

SELECT
    'Go',
    SUM(CAST(skill_go AS UNSIGNED))
FROM stripe_jobs_import

UNION ALL

SELECT
    'Java',
    SUM(CAST(skill_java AS UNSIGNED))
FROM stripe_jobs_import

UNION ALL

SELECT
    'Ruby',
    SUM(CAST(skill_ruby AS UNSIGNED))
FROM stripe_jobs_import

UNION ALL

SELECT
    'Excel',
    SUM(CAST(skill_excel AS UNSIGNED))
FROM stripe_jobs_import

ORDER BY job_postings DESC;

SELECT
    updated_year,
    updated_month,
    COUNT(*) AS total_postings
FROM stripe_jobs_import
WHERE updated_year IS NOT NULL
  AND TRIM(updated_year) <> ''
  AND updated_month IS NOT NULL
  AND TRIM(updated_month) <> ''
GROUP BY updated_year, updated_month
ORDER BY
    CAST(updated_year AS UNSIGNED),
    CAST(updated_month AS UNSIGNED);
    
    USE stripe_job_analytics;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT job_id) AS unique_job_ids,

    SUM(
        CASE
            WHEN job_title IS NULL OR TRIM(job_title) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_job_titles,

    SUM(
        CASE
            WHEN department IS NULL OR TRIM(department) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_departments,

    SUM(
        CASE
            WHEN location IS NULL OR TRIM(location) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_locations,

    SUM(
        CASE
            WHEN job_url IS NULL OR TRIM(job_url) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_job_urls

FROM stripe_jobs_import;

SELECT
    job_id,
    job_title,
    department,
    location
FROM stripe_jobs_import
WHERE location IS NULL
   OR TRIM(location) = '';
   
SELECT COUNT(*) AS blank_locations
FROM stripe_jobs_import
WHERE location IS NULL
   OR TRIM(location) = '';   
   
SET SQL_SAFE_UPDATES = 0;

UPDATE stripe_jobs_import
SET location = 'Unknown'
WHERE location IS NULL
   OR TRIM(location) = '';
   
SELECT
    COUNT(*) AS total_jobs,
    SUM(
        CASE
            WHEN location = 'Unknown' THEN 1
            ELSE 0
        END
    ) AS unknown_locations
FROM stripe_jobs_import;

SELECT
    SUM(CAST(skill_go AS UNSIGNED)) AS go_mentions,
    SUM(CAST(skill_excel AS UNSIGNED)) AS excel_mentions,
    SUM(CASE
        WHEN CAST(skill_go AS UNSIGNED) NOT IN (0, 1)
        THEN 1 ELSE 0
    END) AS invalid_go_values,
    SUM(CASE
        WHEN CAST(skill_excel AS UNSIGNED) NOT IN (0, 1)
        THEN 1 ELSE 0
    END) AS invalid_excel_values
FROM stripe_jobs_import;

SELECT
    SUM(CAST(skill_sql AS UNSIGNED)) AS sql_mentions,
    SUM(CAST(skill_python AS UNSIGNED)) AS python_mentions,
    SUM(CAST(skill_java AS UNSIGNED)) AS java_mentions,
    SUM(CAST(skill_ruby AS UNSIGNED)) AS ruby_mentions,
    SUM(CAST(skill_go AS UNSIGNED)) AS go_mentions,
    SUM(CAST(skill_excel AS UNSIGNED)) AS excel_mentions,

    SUM(CASE WHEN CAST(skill_sql AS UNSIGNED) NOT IN (0,1)
        THEN 1 ELSE 0 END) AS invalid_sql,

    SUM(CASE WHEN CAST(skill_python AS UNSIGNED) NOT IN (0,1)
        THEN 1 ELSE 0 END) AS invalid_python,

    SUM(CASE WHEN CAST(skill_java AS UNSIGNED) NOT IN (0,1)
        THEN 1 ELSE 0 END) AS invalid_java,

    SUM(CASE WHEN CAST(skill_ruby AS UNSIGNED) NOT IN (0,1)
        THEN 1 ELSE 0 END) AS invalid_ruby

FROM stripe_jobs_import;

SELECT
    job_category,
    seniority_level,
    COUNT(*) AS total_postings
FROM stripe_jobs_import
GROUP BY
    job_category,
    seniority_level
ORDER BY
    job_category,
    total_postings DESC;
    
SELECT
    department,
    COUNT(*) AS total_postings,
    SUM(CAST(skill_sql AS UNSIGNED)) AS sql_mentions,
    SUM(CAST(skill_python AS UNSIGNED)) AS python_mentions
FROM stripe_jobs_import
GROUP BY department
HAVING COUNT(*) >= 5
ORDER BY total_postings DESC
LIMIT 15;


SELECT
    department,
    COUNT(*) AS total_postings,

    SUM(CAST(skill_sql AS UNSIGNED)) AS sql_mentions,

    ROUND(
        SUM(CAST(skill_sql AS UNSIGNED)) * 100.0
        / COUNT(*),
        2
    ) AS sql_percentage,

    SUM(CAST(skill_python AS UNSIGNED)) AS python_mentions,

    ROUND(
        SUM(CAST(skill_python AS UNSIGNED)) * 100.0
        / COUNT(*),
        2
    ) AS python_percentage

FROM stripe_jobs_import

GROUP BY department

HAVING COUNT(*) >= 5

ORDER BY sql_percentage DESC
LIMIT 15;

USE stripe_job_analytics;

SELECT
    COUNT(*) AS total_jobs,
    COUNT(DISTINCT job_id) AS unique_job_ids,
    MIN(date_updated) AS earliest_update_date,
    MAX(date_updated) AS latest_update_date,
    SUM(
        CASE
            WHEN date_updated IS NULL
              OR TRIM(date_updated) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_update_dates
FROM stripe_jobs_import;

SELECT
    job_category,
    COUNT(*) AS total_postings,
    ROUND(COUNT(*) * 100.0 / 720, 2) AS percentage_of_postings
FROM stripe_jobs_import
GROUP BY job_category
ORDER BY total_postings DESC;
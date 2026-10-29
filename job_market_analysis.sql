CREATE DATABASE stripe_job_analytics;
USE stripe_job_analytics;

SHOW TABLES;
DESCRIBE stripe_jobs;
SELECT * FROM stripe_jobs;

SHOW TABLES FROM stripe_job_analytics;

USE stripe_job_analytics;

SELECT COUNT(*) AS total_postings
FROM stripe_jobs_import;

SELECT *
FROM stripe_jobs_import
LIMIT 5;

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
    location,
    COUNT(*) AS total_postings
FROM stripe_jobs_import
WHERE location IS NOT NULL
  AND TRIM(location) <> ''
GROUP BY location
ORDER BY total_postings DESC
LIMIT 10;

SELECT
    SUM(CAST(skill_sql AS UNSIGNED)) AS sql_mentions,
    SUM(CAST(skill_python AS UNSIGNED)) AS python_mentions,
    SUM(CAST(skill_go AS UNSIGNED)) AS go_mentions,
    SUM(CAST(skill_java AS UNSIGNED)) AS java_mentions,
    SUM(CAST(skill_ruby AS UNSIGNED)) AS ruby_mentions,
    SUM(CAST(skill_excel AS UNSIGNED)) AS excel_mentions
FROM stripe_jobs_import;

SELECT
    skill_go,
    COUNT(*) AS row_count
FROM stripe_jobs_import
GROUP BY skill_go
ORDER BY row_count DESC;

SELECT
    skill_excel,
    COUNT(*) AS row_count
FROM stripe_jobs_import
GROUP BY skill_excel
ORDER BY row_count DESC;

SELECT
    job_title,
    skill_go,
    LEFT(job_description, 250) AS description_sample
FROM stripe_jobs_import
WHERE skill_go = '1'
LIMIT 10;

SELECT
    job_title,
    skill_go,
    LOCATE('Go', job_description) AS go_position,
    SUBSTRING(
        job_description,
        GREATEST(1, LOCATE('Go', job_description) - 80),
        200
    ) AS matching_text
FROM stripe_jobs_import
WHERE skill_go = '1'
LIMIT 10;

USE stripe_job_analytics;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT job_id) AS unique_job_ids,
    SUM(CAST(skill_go AS UNSIGNED)) AS current_go_count
FROM stripe_jobs_import;
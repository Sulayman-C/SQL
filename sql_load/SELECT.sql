SELECT 
job_title_short AS title,
job_location AS location, 
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM job_postings_fact
LIMIT 10;

CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM january_jobs;

SELECT job_title_short,
job_location, 
CASE
WHEN job_location = 'anywhere' THEN 'remote'
WHEN job_location = 'New York, NY' THEN 'NY Local'
ELSE 'other'
END AS location_category
FROM job_postings_fact;

WITH june_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 6
)
SELECT *
FROM june_jobs


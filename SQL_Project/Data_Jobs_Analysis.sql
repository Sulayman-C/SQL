-- What are the top paying jobs for data analysts?
-- Top 100 highest paying jobs that are remote and skills required

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Analyst' AND
    (job_location = 'Anywhere' OR
    job_location = 'Remote' OR
    job_location = 'London') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 100


-- What are the top paying jobs for data analysts?
-- Top 10 highest paying jobs that are remote and skills required

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        company_id
    FROM
        job_postings_fact
    WHERE
        job_title = 'Data Analyst' AND
        (job_location = 'Anywhere' OR
         job_location = 'Remote' OR
         job_location = 'London') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 1000
)

SELECT top_paying_jobs.*,
        skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;
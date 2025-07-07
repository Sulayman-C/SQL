-- Combining the demand and the salary for skills to find the optimal
-- Some parisomony needed between the two codes put into the CTEs
-- This can be written more concisely with 2 inner joins

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS skill_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,  
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 2) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)

SELECT
        skills_demand.skill_id,
        skills_demand.skills,
        skill_count,
        average_salary
FROM 
        skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
        skill_count DESC, 
        average_salary DESC
LIMIT 30;
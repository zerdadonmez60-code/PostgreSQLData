/*
Question: What are the most in-demand skills for data analysts?
Identify the top 5 in-demand skills for a data analyst.
Focus on all job postings. 
Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers. 
*/



SELECT
    skills,
    COUNT(skills_job_dim.job_id)AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5



/*
🥇 1st – SQL (16082)

SQL dominates the market.

Interpretation:

SQL is the foundation of data analysis.
Almost every data analyst role requires SQL.

This confirms SQL is non-negotiable.

🥈 2nd – Python (10386)

Python is the second most requested skill.

Indicates:

Data analysts are increasingly expected to perform:

Data manipulation

Automation

Advanced analysis

Python significantly boosts employability.

🥉 3rd – Excel (9849)

Excel remains extremely relevant.

Despite being considered “basic,”
it is still heavily required in business environments.

Shows that traditional BI workflows are still strong.

4️⃣ Tableau (8704)

Tableau is the leading visualization tool in demand.

Indicates:

Data storytelling and dashboarding are critical skills.

5️⃣ Power BI (6300)

Power BI is also highly demanded.

Especially strong in corporate environments
*/
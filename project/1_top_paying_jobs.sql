/*
**Question: What are the top-paying data analyst jobs?**
- Identify the top 12 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries.
- Why? Aims to highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name,
    job_country
FROM    
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL 
ORDER BY
    salary_year_avg DESC
LIMIT 12

/*

***RESULTS BREAKDOWN (Data Analysis)

1️⃣ Highest Salary

Highest salary:
650,000 USD
Company: Mantys
Country: India

This is significantly higher than the rest 

2️⃣ Repeated High-Paying Companies

Netflix appears 3 times with:
445,000 USD salary

This suggests:
Netflix strongly invests in senior-level analytics roles.

Meta also appears with:
336,500 USD salary for Director of Analytics.

3️⃣ Seniority Insight

Many top-paying roles are not simple “Data Analyst” positions:

Analytics Engineer (L5)

Director of Analytics

Director of Engineering - Analytics

Associate Director

AI Quantitative Analyst

This shows:
The highest salaries are strongly linked to seniority and leadership roles.

*/

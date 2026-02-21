/*
**Question: What are the top-paying data analyst jobs, and what skills are required?** 
- Identify the top 12 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    name AS company_name
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
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
RESULTS ANALYSIS (Skill + Salary Insight)
🥇 Highest Paying Role

Company: Netflix
Role: Analytics Engineer (L5)
Salary: 445,000

Required Skills:

SQL
Python
Go
Scala
TypeScript

🔎 Insight:
High-paying analytics engineering roles require strong programming depth beyond traditional SQL.

🥈 Senior-Level Roles

Example:
Associate Director – Data Insights (AT&T)
Salary: 255,829.5

Skills include:

SQL
Python
R
Azure
Databricks
AWS
PySpark
Pandas
Jupyter
Tableau
Excel
Power BI
PowerPoint

🔎 Insight:
Leadership roles require both:

Technical stack (cloud + big data)
AND
Business intelligence tools

🥉 Core Technical Skill Patterns

Across high-paying roles, the most repeated skills are:

SQL
Python
R
Tableau
AWS
Databricks

This suggests:

SQL + Python remain foundational for high salary growth.

🔬 Engineering-Oriented Roles

Example:
Edge & Node – Data Analyst (264,000)

Skills include:

SQL
Go
GraphQL
Node
Git
Looker
Tableau



📈 Skill Categories Observed

We can group skills into:

1️⃣ Core Data Skills

SQL
Python
R

2️⃣ Big Data / Engineering

Spark
Hadoop
Databricks
PySpark

3️⃣ Cloud

AWS
Azure

4️⃣ BI / Visualization

Tableau
Power BI
Looker
Excel

5️⃣ Programming

Go
Scala
TypeScript
Node
*/


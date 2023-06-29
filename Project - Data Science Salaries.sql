-- Obtain the top 20 records from the data science salaries table
SELECT TOP 20 * FROM dbo.ds_salaries;


-- Obtain the total number of rows this table has
SELECT COUNT(*) AS [Total Number of Records]
FROM dbo.ds_salaries;

-- Check for missing values for a few columns in this dataset
SELECT COUNT(*) AS [Missing Value Count]
FROM dbo.ds_salaries
WHERE work_year IS NULL;

SELECT COUNT(*) AS [Missing Value Count]
FROM dbo.ds_salaries
WHERE job_title IS NULL;

SELECT COUNT(*) AS [Missing Value Count]
FROM dbo.ds_salaries
WHERE experience_level IS NULL;

SELECT COUNT(*) AS [Missing Value Count]
FROM dbo.ds_salaries
WHERE salary IS NULL;

-- Obtain the distinct values for some of the columns
SELECT DISTINCT work_year 
FROM dbo.ds_salaries;

SELECT DISTINCT experience_level 
FROM dbo.ds_salaries;

SELECT DISTINCT job_title 
FROM dbo.ds_salaries;

SELECT DISTINCT employee_residence 
FROM dbo.ds_salaries;

SELECT DISTINCT company_location 
FROM dbo.ds_salaries;

SELECT DISTINCT company_size 
FROM dbo.ds_salaries;

-- Obtain the count of the distinct values for some of the above columns
SELECT COUNT(DISTINCT (experience_level)) AS [Distinct Experience Levels]
FROM dbo.ds_salaries;

SELECT COUNT(DISTINCT (job_title)) AS [Distinct Job Titles]
FROM dbo.ds_salaries;

SELECT COUNT(DISTINCT (employee_residence)) AS [Distinct Employee Residences]
FROM dbo.ds_salaries;

SELECT COUNT(DISTINCT (company_location)) AS [Distinct Company Locations]
FROM dbo.ds_salaries;

SELECT COUNT(DISTINCT (company_size)) AS [Distinct Company Sizes]
FROM dbo.ds_salaries;

-- Obtain the value counts for some of the attributes
SELECT work_year, COUNT(work_year) AS [Work Year Count]
FROM dbo.ds_salaries
GROUP BY work_year;

SELECT experience_level, COUNT(experience_level) AS [Experience Level Count]
FROM dbo.ds_salaries
GROUP BY experience_level;

SELECT job_title, COUNT(job_title) AS [Job Title Count]
FROM dbo.ds_salaries
GROUP BY job_title;

SELECT employee_residence, COUNT(employee_residence) AS [Employee Residence Count]
FROM dbo.ds_salaries
GROUP BY employee_residence;

SELECT employment_type, COUNT(employment_type) AS [Employement Type Count]
FROM dbo.ds_salaries
GROUP BY employment_type;

SELECT company_location, COUNT(company_location) AS [Company Location Count]
FROM dbo.ds_salaries
GROUP BY company_location;

SELECT company_size, COUNT(company_size) AS [Company Size Count]
FROM dbo.ds_salaries
GROUP BY company_size;

SELECT company_location, company_size, COUNT(*) AS [Count]
FROM dbo.ds_salaries
GROUP BY company_location, company_size;



-- Obtain the top 10 employees with the highest salaries
SELECT TOP 10 *
FROM dbo.ds_salaries
ORDER BY salary DESC;

-- Obtain the 5 most popular job titles
SELECT TOP 5 job_title, COUNT(job_title) AS [Most Popular Job Titles]
FROM dbo.ds_salaries
GROUP BY job_title
ORDER BY COUNT(job_title) DESC;

-- Convert the salaries column to decimal
ALTER TABLE dbo.ds_salaries
ALTER COLUMN salary DECIMAL(10, 2);

ALTER TABLE dbo.ds_salaries
ALTER COLUMN salary_in_usd DECIMAL(10, 2);


-- Obtain the average salaries for each of the job titles
SELECT job_title, AVG(salary) AS average_salary
FROM dbo.ds_salaries
GROUP BY job_title;

-- Obtain the average salaries grouped by the experience level
SELECT experience_level, AVG(salary) AS average_salary
FROM dbo.ds_salaries
GROUP BY experience_level;

-- Find out which experience level has the highest salary
SELECT CASE WHEN experience_level = 'MI' THEN 'Mid Level'
            WHEN experience_level = 'SE' THEN 'Senior Level'
			WHEN experience_level = 'EN' THEN 'Entry Level'
			WHEN experience_level = 'EX' THEN 'Executive Level'
			ELSE NULL END AS [Experience Category], COUNT(1) AS [Number of Category],
			ROUND(MAX(salary_in_usd), 2) AS [Highest Salary]
FROM dbo.ds_salaries
GROUP BY CASE WHEN experience_level = 'MI' THEN 'Mid Level'
            WHEN experience_level = 'SE' THEN 'Senior Level'
			WHEN experience_level = 'EN' THEN 'Entry Level'
			WHEN experience_level = 'EX' THEN 'Executive Level'
			ELSE NULL END 
ORDER BY [Highest Salary] DESC;

-- Find the average salaries for each of the employment type
SELECT CASE WHEN employment_type = 'FT' THEN 'Full Time'
            WHEN employment_type = 'PT' THEN 'Part Time'
			WHEN employment_type = 'FL' THEN 'Freelance'
			WHEN employment_type = 'CT' THEN 'Contract'
			ELSE NULL END AS [Employment Category],
			ROUND(AVG(salary_in_usd), 2) AS [Average Salary]
FROM dbo.ds_salaries
GROUP BY CASE WHEN employment_type = 'FT' THEN 'Full Time'
            WHEN employment_type = 'PT' THEN 'Part Time'
			WHEN employment_type = 'FL' THEN 'Freelance'
			WHEN employment_type = 'CT' THEN 'Contract'
			ELSE NULL END 
ORDER BY [Average Salary] DESC;


-- Find the average salaries per USD for each of the job titles
SELECT job_title, ROUND(AVG(salary_in_usd), 2) AS [Average Salary in USD]
FROM dbo.ds_salaries
GROUP BY job_title
ORDER BY [Average Salary in USD] DESC;

-- Find the top 5 job titles with the highest salaries
SELECT TOP 5 job_title, ROUND(MAX(salary_in_usd), 2) AS [Highest Salary in USD]
FROM dbo.ds_salaries
GROUP BY job_title
ORDER BY [Highest Salary in USD] DESC;

-- Obtain the top 5 highest paying entry level data science jobs
SELECT TOP 5 job_title, ROUND(MAX(salary_in_usd), 2) AS [Highest Salary in USD]
FROM dbo.ds_salaries
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY [Highest Salary in USD] DESC;

-- Obtain the top 5 highest paying mid-level data science jobs 
SELECT TOP 5 job_title, ROUND(MAX(salary_in_usd), 2) AS [Highest Salary in USD]
FROM dbo.ds_salaries
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY [Highest Salary in USD] DESC;

-- Obtain the top 5 highest paying senior level data science jobs
SELECT TOP 5 job_title, ROUND(MAX(salary_in_usd), 2) AS [Highest Salary in USD]
FROM dbo.ds_salaries
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY [Highest Salary in USD] DESC;

-- Obtain the top 5 highest paying executive level data science jobs
SELECT TOP 5 job_title, ROUND(MAX(salary_in_usd), 2) AS [Highest Salary in USD]
FROM dbo.ds_salaries
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY [Highest Salary in USD] DESC;

-- Obtain the average salaries for each experience level
SELECT CASE WHEN experience_level = 'EN' THEN 'Entry Level'
            WHEN experience_level = 'SE' THEN 'Senior Level'
			WHEN experience_level = 'EX' THEN 'Experienced'
			WHEN experience_level = 'MI' THEN 'Mid Level'
			ELSE NULL END AS [Experience Level],
			ROUND(AVG(salary_in_usd), 2) AS [Average Salary]
FROM dbo.ds_salaries
GROUP BY CASE WHEN experience_level = 'EN' THEN 'Entry Level'
            WHEN experience_level = 'SE' THEN 'Senior Level'
			WHEN experience_level = 'EX' THEN 'Experienced'
			WHEN experience_level = 'MI' THEN 'Mid Level'
			ELSE NULL END 
ORDER BY [Average Salary] DESC;

-- Obtain the 10 lowest paying entry level data science job
SELECT TOP 10 MIN(salary_in_usd) AS [Lowest Salary], job_title
FROM dbo.ds_salaries
WHERE experience_level = 'EN'
GROUP BY job_title
ORDER BY [Lowest Salary];

-- Obtain the 10 lowest paying mid-level data science jobs
SELECT TOP 10 MIN(salary_in_usd) AS [Lowest Salary], job_title
FROM dbo.ds_salaries
WHERE experience_level = 'MI'
GROUP BY job_title
ORDER BY [Lowest Salary];

-- Obtain the 10 lowest paying senior level data science jobs
SELECT TOP 10 MIN(salary_in_usd) AS [Lowest Salary], job_title
FROM dbo.ds_salaries
WHERE experience_level = 'SE'
GROUP BY job_title
ORDER BY [Lowest Salary];

-- Obtain the 10 lowest paying executive level data science jobs
SELECT TOP 10 MIN(salary_in_usd) AS [Lowest Salary], job_title
FROM dbo.ds_salaries
WHERE experience_level = 'EX'
GROUP BY job_title
ORDER BY [Lowest Salary];

-- Find out the effect of the company size on salaries
SELECT CASE WHEN company_size = 'L' THEN 'Large Firm'
            WHEN company_size = 'M' THEN 'Medium Firm'
			WHEN company_size = 'S' THEN 'Small Firm'
			ELSE NULL END AS new_company_size,
			ROUND(MIN(salary_in_usd), 2) AS [Minimum Salary],
			ROUND(MAX(salary_in_usd), 2) AS [Maximum Salary]
FROM dbo.ds_salaries
GROUP BY CASE WHEN company_size = 'L' THEN 'Large Firm'
            WHEN company_size = 'M' THEN 'Medium Firm'
			WHEN company_size = 'S' THEN 'Small Firm'
			ELSE NULL END;

-- Find out if company location affects salary or not
SELECT CASE WHEN company_location  = 'US' THEN 'In the US'
       ELSE 'Not in US' END AS company_loc_category,
	   ROUND(MIN(salary_in_usd), 2) AS [Minimum Salary],
			ROUND(MAX(salary_in_usd), 2) AS [Maximum Salary]
FROM dbo.ds_salaries
GROUP BY CASE WHEN company_location  = 'US' THEN 'In the US'
       ELSE 'Not in US' END;











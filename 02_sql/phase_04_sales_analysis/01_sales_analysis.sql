-- SALES TRENDS

-- ===================================================================
-- MONTHLY SALES TRENDS
-- Which month generates the highest sales?
-- Helps identify seasonal trends and peak revenue months.
-- This will help with inventory planning, staffing and promotions.
-- ===================================================================
SELECT 
      MONTH(date) AS month_number,
      DATENAME(MONTH, date) AS month_name,
      ROUND(SUM(weekly_sales), 2) AS total_sales
FROM [dbo].[Sales]
GROUP BY MONTH(date),
         DATENAME(MONTH, date)
ORDER BY total_sales DESC;


-- =====================================================================
-- YEARLY SALES TRENDS
-- Is sales performaance growing or declining over time?
-- Helps with identifying yearly performance patterns.
-- Helps with future strategic planning.
-- =====================================================================
SELECT 
      YEAR(date) AS sales_year,
      ROUND(SUM(weekly_sales), 2) AS total_sales
FROM [dbo].[Sales]
GROUP BY YEAR(date)
ORDER BY total_sales DESC;


-- ======================================================================
-- YEARLY DATASET COMPLETENESS VALIDATION
-- Validate if 2012 dataset is complete looking at the 2012 total_sales.
-- Year to year comparisons must consider data completeness.
-- ======================================================================
SELECT 
      YEAR(date) AS sales_year,
      MIN(date) AS start_date,
      MAX(date) AS end_date,
      COUNT(DISTINCT date) AS weeks_available
FROM sales
GROUP BY YEAR(date)
ORDER BY sales_year;


-- ================================================
-- WEEKLY SALES TRENDS
-- Are there recurring weekly sales patterns?
-- Identifies strong and weak sales periods.
-- ================================================
SELECT 
      DATEPART(WEEK, date) AS week_number,
      ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM sales
GROUP BY DATEPART(WEEK, date)
ORDER BY week_number;


-- ===================================================
-- TOP PERFORMING WEEKS
-- Which weeks generate the highest average sales>
-- This identifies shopping behaviour.
-- This phelps with promotions and inventory planning.
-- ===================================================
SELECT TOP 10
       DATEPART(WEEK, date) AS week_number,
       ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM sales
GROUP BY DATEPART(WEEK, date)
ORDER BY avg_sales DESC;

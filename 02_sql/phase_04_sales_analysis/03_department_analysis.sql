-- DEPARTMENT ANALYSIS

-- ==================================================
-- TOP PERFORMING DEPARTMENTS
-- Identifies key revenue-driving departments.
-- Highlights strongest business contributors.
-- ==================================================
SELECT TOP 10
       dept,
       ROUND(SUM(weekly_sales), 2) AS total_sales
FROM [dbo].[Sales]
GROUP BY dept
ORDER BY total_sales DESC;


-- ===============================================================
-- BOTTOM PERFORMING DEPARTMENTS
-- Identify departments generating the lowest sales performance.
-- Identifies low-revenue product areas.
-- ===============================================================
SELECT TOP 10
       dept,
       ROUND(SUM(weekly_sales), 2) AS total_sales
FROM [dbo].[Sales]
GROUP BY dept
ORDER BY total_sales ASC;


-- ===========================================
-- NEGATIVE DEPARTMENT INVESTIGATION
-- Detects possible returns or corrections.
-- Identifies unusual department behavior.
-- ===========================================
SELECT
      dept,
      COUNT(*) AS negative_transactions,
      ROUND(SUM(weekly_sales), 2) AS total_negative_sales
FROM [dbo].[Sales]
WHERE weekly_sales < 0
GROUP BY dept
ORDER BY total_negative_sales ASC;


-- ======================================================
-- DEPARTMENT RANKING ANALYSIS
-- Rank departments based on overall sales performance.
-- Identifies strongest and weakest departments.
-- Measures contribution to business revenue.
-- =======================================================
SELECT
      dept,
      ROUND(SUM(weekly_sales), 2) AS total_sales,
      RANK() OVER (
        ORDER BY SUM(weekly_sales) DESC
      ) AS department_rank
FROM [dbo].[Sales]
GROUP BY dept
ORDER BY department_rank;
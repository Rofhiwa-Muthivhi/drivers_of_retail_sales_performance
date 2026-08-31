-- ===================================================================
-- STORE CHARACTERISTICS
-- ===================================================================

-- 1) How does weekly sales performance vary across individual stores?

-- Average weekly sales by store
SELECT store,
       AVG(weekly_sales) AS average_weekly_sales
FROM [retail_analysis].[dbo].[sales]
GROUP BY store
ORDER BY average_weekly_sales DESC;

-- Total weekly sales by store
SELECT store,
       SUM(weekly_sales) AS total_sales
FROM [retail_analysis].[dbo].[sales]
GROUP BY store
ORDER BY total_sales DESC;


-- 2) Does store size influence weekly sales performance?

SELECT A.Store
      ,A.[Size]
      ,AVG(B.[Weekly_Sales]) AS average_weekly_sales
FROM [retail_analysis].[dbo].[stores] A
INNER JOIN [retail_analysis].[dbo].[sales] B
ON A.store = B.store
GROUP BY A.Store
        ,A.[Size]
ORDER BY average_weekly_sales DESC;

--3) How does weekly sales performance differ across store types (A, B, and C)?

SELECT A.[Type]
      ,AVG(B.[Weekly_Sales]) AS average_weekly_sales
FROM [retail_analysis].[dbo].[stores] A
INNER JOIN [retail_analysis].[dbo].[sales] B
ON A.store = B.store
GROUP BY A.[Type]
ORDER BY average_weekly_sales DESC;

--4) Which stores consistently outperform or underperform other stores of the same type? 


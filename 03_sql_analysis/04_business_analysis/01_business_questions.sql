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

SELECT A.store
      ,A.[size]
      ,AVG(B.[weekly_sales]) AS average_weekly_sales
FROM [retail_analysis].[dbo].[stores] A
INNER JOIN [retail_analysis].[dbo].[sales] B
ON A.store = B.store
GROUP BY A.store
        ,A.[size]
ORDER BY average_weekly_sales DESC;

--3) How does weekly sales performance differ across store types (A, B, and C)?

SELECT A.[type]
      ,AVG(B.[weekly_sales]) AS average_weekly_sales
FROM [retail_analysis].[dbo].[stores] A
INNER JOIN [retail_analysis].[dbo].[sales] B
ON A.store = B.store
GROUP BY A.[type]
ORDER BY average_weekly_sales DESC;

--4) Which stores consistently outperform or underperform other stores of the same type? 

WITH store_weekly_sales AS (
    SELECT
        A.[type] AS store_type,
        A.store AS store_id,
        B.[date],
        SUM(B.weekly_sales) AS total_weekly_sales
    FROM [retail_analysis].[dbo].[stores] A
    INNER JOIN [retail_analysis].[dbo].[sales] B
    ON A.store = B.store
    GROUP BY A.[type],
             A.store,
             B.[date]
),

type_weekly_average AS (
    SELECT store_type,
           [date],
           AVG(total_weekly_sales) AS type_average_weekly_sales
    FROM store_weekly_sales
    GROUP BY store_type,
             [date]
),

weekly_performance AS (
    SELECT store_weekly_sales.store_type,
           store_weekly_sales.store_id,
           store_weekly_sales.[date],
           store_weekly_sales.total_weekly_sales,
           type_weekly_average.type_average_weekly_sales,

           CASE
                WHEN store_weekly_sales.total_weekly_sales > type_weekly_average.type_average_weekly_sales THEN 1
                ELSE 0
           END AS above_peer
    FROM store_weekly_sales
    JOIN type_weekly_average
    ON store_weekly_sales.store_type = type_weekly_average.store_type
    AND  store_weekly_sales.[date] = type_weekly_average.[date]
),

store_performance AS (
    SELECT store_type,
           store_id,
           AVG(total_weekly_sales) AS average_weekly_sales,
           AVG(type_average_weekly_sales) AS average_peer_weekly_sales,
           COUNT(*) AS total_weeks,
           SUM(above_peer) AS weeks_above_peer,

           CAST(
                SUM(above_peer) * 100.0 / COUNT(*) AS DECIMAL(5,2)
           ) AS percent_weeks_above_peer

    FROM weekly_performance

    GROUP BY store_type,
             store_id
)

SELECT
    store_type,
    store_id,
    average_weekly_sales,
    average_peer_weekly_sales,
    total_weeks,
    weeks_above_peer,
    percent_weeks_above_peer,

    CASE
        WHEN percent_weeks_above_peer >= 70 THEN 'Consistently Outperforming'
        WHEN percent_weeks_above_peer <= 30 THEN 'Consistently Underperforming'
        ELSE 'Mixed Performance'
    END AS performance_category

FROM store_performance

ORDER BY store_type,
         percent_weeks_above_peer DESC;
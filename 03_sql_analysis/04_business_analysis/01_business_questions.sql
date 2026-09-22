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


-- ===================================================================
-- SEASONAL EFFECTS
-- ===================================================================

-- 5) Do holiday weeks generate higher weekly sales than non-holiday weeks?

    -- Logic 1:
    -- First, I need to get the total sales for each store for each week.
    -- The sales table has separate rows for different departments,
    -- so I add those sales together to get one weekly sales figure per store.

WITH weekly_sales AS
(
    SELECT B.store,
           B.[date],
           SUM(B.weekly_sales) AS total_weekly_sales
    FROM [retail_analysis].[dbo].[sales] AS B
    GROUP BY B.store,
             B.[date]
),

 -- Logic:
    -- Now I need to know whether each week's sales happened during
    -- a holiday or a normal week.
    -- I use the features table to bring in the IsHoliday information
    -- for each store and date.

weekly_sales_holiday AS
(
    SELECT B.store,
           B.[date],
           B.total_weekly_sales,
           C.isholiday
    FROM weekly_sales AS B
    INNER JOIN features AS C
    ON B.store = C.store AND B.[Date] = C.[Date]
)

-- Logic 2:
-- Now I have weekly sales and I know whether each week was a holiday
-- or non-holiday.
-- I separate the two groups and calculate their average weekly sales
-- so I can compare their weekly performance.

SELECT
     CASE
        WHEN B.isholiday = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS week_type,
    COUNT(*) AS number_of_weeks,
    AVG(B.total_weekly_sales) AS average_weekly_sales
FROM weekly_sales_holiday AS B
GROUP BY B.isholiday;



-- 6) How does weekly sales performance vary across months and years?

WITH weekly_sales AS
(
    -- Logic 1:
    -- I first get the total sales for each store for each week.
    -- The sales table has separate rows for each department,
    -- so I add them together to get one weekly sales figure per store.

    SELECT B.store,
           B.[date],
           SUM(B.weekly_sales) AS total_weekly_sales
    FROM [retail_analysis].[dbo].[sales] AS B
    GROUP BY B.store,
             B.[date]
),

weekly_sales_time AS
(
    -- Logic 2:
    -- I then extract the year and month from the date.
    -- This allows me to compare weekly sales performance
    -- across different months and years.

    SELECT B.store,
           B.[date],
           DATEPART(YEAR, B.[date]) AS sales_year,
           DATEPART(MONTH, B.[date]) AS sales_month,
           B.total_weekly_sales
    FROM weekly_sales AS B
)

-- Main query:
-- I group the weekly sales by year and month.
-- I use the average to see the typical weekly sales performance
-- for each month and compare the pattern across years.

SELECT B.sales_year,
       B.sales_month,
       AVG(B.total_weekly_sales) AS average_weekly_sales
FROM weekly_sales_time AS B
GROUP BY B.sales_year,
         B.sales_month
ORDER BY B.sales_year,
         B.sales_month;



-- 7) How does weekly temperature influence departmental sales performance?

-- Logic 1:
-- First, I get the total weekly sales for each department.
-- The sales table can have multiple rows for the same
-- store, date and department, so I add those sales together.

WITH departmental_sales AS
(
    SELECT B.store,
           B.[date],
           B.dept,
           SUM(B.weekly_sales) AS total_weekly_sales
    FROM [retail_analysis].[dbo].[sales] AS B
    GROUP BY B.store,
             B.[date],
             B.dept
),

-- Logic 2:
-- Now I bring in the temperature for each store and date.
-- The temperature comes from the features table.

departmental_temperature AS
(
    SELECT B.store,
           B.[date],
           B.dept,
           B.total_weekly_sales,
           C.temperature
    FROM departmental_sales AS B
    INNER JOIN [retail_analysis].[dbo].[features] AS C
    ON B.store = C.store AND B.[date] = C.[date]
),

  -- Logic 3:
  -- Now I classify each week's temperature into a temperature band.

temperature_classification AS
(
    SELECT B.store,
           B.[date],
           B.dept,
           B.total_weekly_sales,
           B.temperature,
        CASE
            WHEN B.temperature < 30 THEN 'Cold'
            WHEN B.temperature BETWEEN 30 AND 60 THEN 'Moderate'
            ELSE 'Hot'
        END AS weather_classification
    FROM departmental_temperature AS B
)

-- MAIN QUERY:
-- Now I compare the average weekly sales for each department
-- across the different temperature bands.

SELECT B.dept,
       B.weather_classification,
       CAST(AVG(B.total_weekly_sales) AS  DECIMAL(10,2)) AS average_weekly_sales
FROM temperature_classification AS B
GROUP BY B.dept,
         B.weather_classification
ORDER BY B.dept,
         B.weather_classification;


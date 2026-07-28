-- Missing Values: Identify missing values on all datasets to determine which columns require cleaning before analysis.

   -- ==============
   -- Sales Dataset
   -- ==============

   SELECT
    SUM(CASE WHEN store IS NULL THEN 1 ELSE 0 END) AS missing_store,
    SUM(CASE WHEN dept IS NULL THEN 1 ELSE 0 END) AS missing_dept,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN weekly_sales IS NULL THEN 1 ELSE 0 END) AS missing_weekly_sales,
    SUM(CASE WHEN isholiday IS NULL THEN 1 ELSE 0 END) AS missing_IsHoliday
FROM [retail_analysis].[dbo].[sales];
-- Result:
-- No missing values were identified in the sales dataset.


   -- ==============
   -- Stores Dataset
   -- ==============

   SELECT
    SUM(CASE WHEN store IS NULL THEN 1 ELSE 0 END) AS missing_store,
    SUM(CASE WHEN [type] IS NULL THEN 1 ELSE 0 END) AS missing_type,
    SUM(CASE WHEN [size] IS NULL THEN 1 ELSE 0 END) AS missing_size
FROM [retail_analysis].[dbo].[stores];
-- Result:
-- No missing values were identified in the Stores dataset.


   -- ===================
   -- Features Dataset
   -- ===================
SELECT
    SUM(CASE WHEN store IS NULL THEN 1 ELSE 0 END) AS missing_store,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN fuel_price IS NULL THEN 1 ELSE 0 END) AS missing_fuel_price,
    SUM(CASE WHEN markdown1 IS NULL THEN 1 ELSE 0 END) AS missing_markdown1,
    SUM(CASE WHEN markdown2 IS NULL THEN 1 ELSE 0 END) AS missing_markdown2,
    SUM(CASE WHEN markdown3 IS NULL THEN 1 ELSE 0 END) AS missing_markdown3,
    SUM(CASE WHEN markdown4 IS NULL THEN 1 ELSE 0 END) AS missing_markdown4,
    SUM(CASE WHEN markdown5 IS NULL THEN 1 ELSE 0 END) AS missing_markdown5,
    SUM(CASE WHEN cpi IS NULL THEN 1 ELSE 0 END) AS missing_cpi,   
    SUM(CASE WHEN unemployment IS NULL THEN 1 ELSE 0 END) AS missing_unemployment,
    SUM(CASE WHEN temperature IS NULL THEN 1 ELSE 0 END) AS missing_temperature,
    SUM(CASE WHEN isholiday IS NULL THEN 1 ELSE 0 END) AS missing_isholiday
FROM [retail_analysis].[dbo].[features];
-- Result:
-- No NULL values were identified in the cleaned Features dataset.
-- Missing values present in the raw dataset were addressed during the data cleaning stage.

  
/* Data Profiling examines the structure, content, and distribution of each column 
  to understand the dataset, summarise key characteristics, and identify potential
  data quality issues before cleaning. */

-- =================================================================================
-- Sales Table
-- =================================================================================

-- Store: Count unique stores.
SELECT COUNT(DISTINCT store) AS total_number_of_stores
From[retail_analysis].[dbo].[sales];


-- Store: List unique store IDs.
SELECT DISTINCT store 
From[retail_analysis].[dbo].[sales]
ORDER BY store;


-- Dept: Count unique department.
SELECT COUNT(DISTINCT dept) AS total_number_of_dept
From[retail_analysis].[dbo].[sales];


-- Dept: List unique departmentt.
SELECT DISTINCT dept
From[retail_analysis].[dbo].[sales]
ORDER BY dept;


-- Date: Identify the date range covered by the dataset.
SELECT MIN(Date) AS earliest_sale_date,
       MAX(Date) AS latest_sale_date
From[retail_analysis].[dbo].[sales];


-- Weekly_Sales: Calculate the minimum, maximum, and average weekly sales.
SELECT MIN(weekly_sales) AS minimum_weekly_sales,
       MAX(weekly_sales) AS maximum_weekly_sales,
       AVG(weekly_sales) AS average_weekly_sales
From[retail_analysis].[dbo].[sales];


-- IsHoliday: Summarize holiday and non-holiday records.
 SELECT 
        CASE
            WHEN isholiday = 'True' THEN 'holiday season'
            ELSE 'non-holiday season'
            END AS holiday_type,
            COUNT(*) AS record_count
From[retail_analysis].[dbo].[sales]
GROUP BY isholiday;


-- ===============================================================================
-- Stores Table
-- ===============================================================================

-- Store: Count the total number of stores.
SELECT COUNT(DISTINCT store) AS total_number_of_stores
From[retail_analysis].[dbo].[stores];

-- Store: List unique stores IDs.
SELECT DISTINCT store 
From[retail_analysis].[dbo].[stores]
ORDER BY store;


-- Store Type:  Identify unique store type categories.
SELECT DISTINCT type
From[retail_analysis].[dbo].[stores]
ORDER BY [type];


-- Store Type: Count stores by store type.
SELECT [Type],
       COUNT(*) AS store_count
FROM [retail_analysis].[dbo].[stores]
GROUP BY [type]
ORDER BY [type];


-- Store Size: Calculate the minimum, maximum, and average store size.
SELECT MIN([size]) AS smallest_store_size, 
       MAX([size]) AS largest_store_size, 
       AVG([size]) AS average_store_size
FROM [retail_analysis].[dbo].[stores]


-- ==============================================================================
-- Features Table
-- ==============================================================================

-- Date: Identify the date range covered by the dataset.
SELECT MIN(Date) AS earliest_sale_date,
       MAX(Date) AS latest_sale_date
From[retail_analysis].[dbo].[features];


  /* -- Fuel_Price: Calculate the minimum, maximum, and average fuel_price values.
   -- Observation: Fuel_price is stored as VARCHAR.
   -- Statistics require a numeric data type and will be calculated after Data Cleaning.
SELECT MIN(fuel_price) AS minimum_fuel_price, 
       MAX(fuel_price) AS maximum_fuel_price, 
       AVG(fuel_price) AS average_fuel_price
FROM [retail_analysis].[dbo].[features]; */


-- MarkDown1: Calculate the minimum, maximum, and average markdown1 values.
SELECT MIN(markdown1) AS minimum_markdown1, 
       MAX(markdown1) AS maximum_markdown1, 
       AVG(markdown1) AS average_markdown1
FROM [retail_analysis].[dbo].[features];

-- MarkDown1: Count records with zero markdown values.
SELECT COUNT(*) AS zero_count
FROM [retail_analysis].[dbo].[features]
WHERE MarkDown1 = 0;


-- MarkDown2: Calculate the minimum, maximum, and average markdown2 values.
SELECT MIN(markdown2) AS minimum_markdown2, 
       MAX(markdown2) AS maximum_markdown2, 
       AVG(markdown2) AS average_markdown2
FROM [retail_analysis].[dbo].[features];

-- MarkDown2: Count records with zero markdown values.
SELECT COUNT(*) AS zero_count
FROM [retail_analysis].[dbo].[features]
WHERE MarkDown2 = 0;


-- MarkDown3: Calculate the minimum, maximum, and average markdown3 values.
SELECT MIN(markdown3) AS minimum_markdown3, 
       MAX(markdown3) AS maximum_markdown3, 
       AVG(markdown3) AS average_markdown3
FROM [retail_analysis].[dbo].[features];

-- MarkDown3: Count records with zero markdown values.
SELECT COUNT(*) AS zero_count
FROM [retail_analysis].[dbo].[features]
WHERE MarkDown3 = 0;


-- MarkDown4: Calculate the minimum, maximum, and average markdown4 values.
SELECT MIN(markdown4) AS minimum_markdown4, 
       MAX(markdown4) AS maximum_markdown4, 
       AVG(markdown4) AS average_markdown4
FROM [retail_analysis].[dbo].[features];

-- MarkDown4: Count records with zero markdown values.
SELECT COUNT(*) AS zero_count
FROM [retail_analysis].[dbo].[features]
WHERE MarkDown4 = 0;


-- MarkDown5: Calculate the minimum, maximum, and average markdown5 values.
SELECT MIN(markdown5) AS minimum_markdown5, 
       MAX(markdown5) AS maximum_markdown5, 
       AVG(markdown5) AS average_markdown5
FROM [retail_analysis].[dbo].[features];

-- MarkDown5: Count records with zero markdown values.
SELECT COUNT(*) AS zero_count
FROM [retail_analysis].[dbo].[features]
WHERE MarkDown5 = 0;


/* -- CPI: Calculate the minimum, maximum, and average consumer price index values
   -- Observation: Cpi is stored as VARCHAR.
   -- Statistics require a numeric data type and will be calculated after Data Cleaning.
SELECT MIN(cpi) AS minimum_cpi, 
       MAX(cpi) AS maximum_cpi, 
       AVG(cpi) AS average_cpi
FROM [retail_analysis].[dbo].[features]; */



/* -- Unemployment: Calculate the minimum, maximum, and average unemployment values
   -- Observation: Unemployment is stored as VARCHAR.
   -- Statistics require a numeric data type and will be calculated after Data Cleaning.
SELECT MIN(unemployment) AS minimum_unemployment, 
       MAX(unemployment) AS maximum_unemployment, 
       AVG(unemployment) AS average_unemployment
FROM [retail_analysis].[dbo].[features]; */


/* -- Temperature: Calculate the minimum, maximum, and average temperature values.
   -- Observation: Temperature is stored as VARCHAR.
   -- Statistics require a numeric data type and will be calculated after Data Cleaning.
SELECT MIN(temperature) AS minimum_temperature, 
       MAX(temperature) AS maximum_temperature, 
       AVG(temperature) AS average_temperature
FROM [retail_analysis].[dbo].[features]; */


-- IsHoliday: Summarize holiday and non-holiday records.
 SELECT 
        CASE
            WHEN isholiday = 'True' THEN 'holiday season'
            ELSE 'non-holiday season'
            END AS holiday_type,
            COUNT(*) AS record_count
From[retail_analysis].[dbo].[features]
GROUP BY isholiday;

select *
From[retail_analysis].[dbo].[sales]
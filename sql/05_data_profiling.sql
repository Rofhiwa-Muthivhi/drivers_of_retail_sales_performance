/* The queries below are used to profile the dataset
   and identify potential data quality issues */

-- MISSING VALUES
   -- ===================
   -- Store Counting.
   -- ===================
   SELECT COUNT(*) AS number_of_stores
   FROM stores;


   -- ===================
   -- Features Counting.
   -- ===================
   SELECT COUNT(*) AS number_of_feature_records
   FROM features;

   -- ===================
   -- Sales Counting.
   -- ===================
   SELECT COUNT(*) AS number_of_sales_records
   FROM sales;

   -- ==========================================
   -- Missing Values Checking on Features Table.
   -- ==========================================
   SELECT COUNT(*) AS total_rows,
          COUNT(markdown1) AS markdown1_not_null
   FROM features;


   -- ==============================================================================================
   -- Checking markdown1 values to confirm whether values are stored as text instead of NULL values.
   -- ==============================================================================================
   SELECT TOP 20
          markdown1
   FROM features;


   -- ===================================================================================
   -- Counting number of 'NA' values in markdown1 to understand the missing value issue.
   -- ===================================================================================
   SELECT
          COUNT(*) AS total_rows,
          COUNT(CASE WHEN markdown1 = 'NA' THEN 1 END)
          AS markdown1_na_count
   FROM features;


   -- ================================================
   -- Checking missing values for all markdown columns.
   -- ================================================
   SELECT
          COUNT(CASE WHEN markdown1 = 'NA' THEN 1 END) AS markdown1_na,
          COUNT(CASE WHEN markdown2 = 'NA' THEN 1 END) AS markdown2_na,
          COUNT(CASE WHEN markdown3 = 'NA' THEN 1 END) AS markdown3_na,
          COUNT(CASE WHEN markdown4 = 'NA' THEN 1 END) AS markdown4_na,
          COUNT(CASE WHEN markdown5 = 'NA' THEN 1 END) AS markdown5_na
   FROM features;

   
   -- DUPLICATES INVESTINGATION

   -- ============================================================
   -- Cheking if store appears more than once in the stores table.
   -- No duplicate stores found, aligns with table strucutre.
   -- ============================================================
   SELECT store,
          COUNT(*) AS duplicate
   FROM stores
   GROUP BY store
   HAVING COUNT(*) > 1;


   -- ===========================================
   -- Features table duplicates check.
   -- No duplicates found in the featurse table.
   -- ===========================================
   SELECT store,
          date,
          COUNT(*) AS duplicate
   FROM features
   GROUP BY store, date
   HAVING COUNT(*) > 1;

   
   -- ============================================
   -- Sales table duplicates check.
   -- ============================================
   SELECT store,
          dept,
          date,
          COUNT(*) AS duplicate
   FROM sales
   GROUP BY store, dept, date
   HAVING COUNT(*) > 1;

   
   --DATE FORMAT CONSISTENCY
   
   -- =================================
   -- Date format checking
   -- =================================
   SELECT TOP 10
          date
   FROM sales;


   -- ==========================================================================
   -- Date data type inspection
   -- Date is imported and stored as varchar at the moment, requires conversion.
   -- ==========================================================================
   SELECT column_name,
          data_type
   FROM information_schema.columns
   WHERE table_name = 'sales';

   -- =============================================================================
   -- Checking if weekly sales looks numerical even though we found the as varchar.
   -- Weekly sales looks good meaning it will be easy to convert.
   -- =============================================================================
   SELECT TOP 20
          weekly_sales
   FROM sales;


   -- OUTLIERS CHECK
   -- =================================================================================================
   -- Min weekly sales = -4,988.94, this could be returns or refunds causing negative net sales.
   -- Max weekly sales = 693,099.3, maybe reasonable for large stores or holiday periods.
   -- Avg weekly sales = 15,981, Shows significant spread between minimum,average, and maximum sales.
   -- ==================================================================================================
   SELECT
          MIN(CAST(weekly_sales AS FLOAT)) AS minimum_sales,
          MAX(CAST(weekly_sales AS FLOAT)) AS maximum_sales,
          AVG(CAST(weekly_sales AS FLOAT)) AS average_sales
   FROM sales;


   -- ===============================================================================================================
   -- Negative sales investigation
   -- Negative weekly sales values were identified.
   -- Most negative values are small and appear in certain departments(e.g., department 47).
   -- Negative sales can represent product returns,refunds, or accounting adjustments rather than data entry errors
   -- Keep negative sales for analysis.
   -- ===============================================================================================================
   SELECT TOP 20 *
   FROM sales
   WHERE CAST(weekly_sales AS FLOAT) < 0;


   -- NULL EXISTENCE CHECK

   -- =========================================
   -- Checking NULLS on the sales table.
   -- No NULLS found.
   -- =========================================
   SELECT
          COUNT(CASE WHEN weekly_sales IS NULL THEN 1 END) AS null_weekly_sales,
          COUNT(CASE WHEN date IS NULL THEN 1 END) AS null_dates,
          COUNT(CASE WHEN store IS NULL THEN 1 END) AS null_store
   FROM sales;

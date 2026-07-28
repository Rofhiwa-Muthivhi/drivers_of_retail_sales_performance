-- Duplicates Analysis: Identify duplicate records on sales, stores, and features datasets to ensure data integrity before analysis.

-- ==============
-- Sales Dataset
-- ==============
SELECT store,
       dept,
       date,
       COUNT(*) AS duplicate_records
FROM [retail_analysis].[dbo].[sales]
GROUP BY store, dept, date
HAVING COUNT(*) > 1;
-- Result:
-- No duplicate records were identified in the Sales dataset.


-- ==============
-- Store Dataset
-- ==============
SELECT store,
       COUNT(*) AS duplicate_records
FROM [retail_analysis].[dbo].[stores]
GROUP BY store
HAVING COUNT(*) > 1;
-- Result:
-- No duplicate records were identified in the Stores dataset.


-- =================
-- Features Dataset
-- =================
SELECT  store,
        date,
        COUNT(*) AS duplicate_records
FROM [retail_analysis].[dbo].[features]
GROUP BY store, date
HAVING COUNT(*) > 1;
-- Result:
-- No duplicate records were identified in the features dataset.
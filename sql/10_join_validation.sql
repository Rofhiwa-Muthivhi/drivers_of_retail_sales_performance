-- JOIN VALIDATION

-- ========================================================================================================
-- Validation of whether sales, stores, and features join correctly without duplicates and missing records.
-- Verifies that sales records matches store and features data.
-- INNER JOIN is used because it only keeps matches.
-- ========================================================================================================
SELECT 
      COUNT(*) AS total_rows
FROM sales s
INNER JOIN stores st
ON s.store = st.store
INNER JOIN features f
ON s.store = f.store AND s.date = f.date;


-- ===================================================================================================
-- We want to identify any sales records that do not have matches with store or feature records.
-- This matters because e can find missing relationships between datasets
-- The 0 missing matches confirms that all sales records connects to store and features data
-- ===================================================================================================


SELECT 
      COUNT(*) AS missing_matches
FROM sales s
LEFT JOIN stores st
ON s.store = st.store
LEFT JOIN features f
ON s.store = f.store
AND s.date = f.date
WHERE st.store IS NULL OR f.store IS NULL;
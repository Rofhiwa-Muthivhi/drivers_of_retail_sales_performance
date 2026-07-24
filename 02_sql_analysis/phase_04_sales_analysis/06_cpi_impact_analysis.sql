-- CPI IMPACT ON SALES PERFEORMANCE

-- =====================================================
-- Checking for non numeric values in the CPI column.
-- 'NA' text was found in the CPI column.
-- CPI column was imported as varchar.
-- =====================================================
SELECT DISTINCT cpi
FROM [dbo].[Features]
ORDER BY cpi;


-- ===============================================================
-- Relationship between CPI and retail sales performance.
-- This measures the impact of inflation on consumer spending.
-- Identifies whether higher consumer prices influence sales.
-- ===============================================================
SELECT
      CASE
          WHEN TRY_CAST(f.cpi AS DECIMAL(10,3)) < 160 THEN 'Low CPI'
          WHEN TRY_CAST(f.cpi AS DECIMAL(10,3)) BETWEEN 160 AND 200 THEN 'Moderate CPI'
      ELSE 'High CPI'
      END AS cpi_category,
      ROUND(AVG(s.weekly_sales), 2) AS avg_sales,
      COUNT(*) AS transaction_count
FROM [dbo].[Sales] s
INNER JOIN dbo.Features f
ON s.store = f.store AND s.date = f.date
GROUP BY
        CASE
            WHEN TRY_CAST(f.cpi AS DECIMAL(10,3)) < 160 THEN 'Low CPI'
            WHEN TRY_CAST(f.cpi AS DECIMAL(10,3)) BETWEEN 160 AND 200 THEN 'Moderate CPI'
        ELSE 'High CPI'
        END
ORDER BY avg_sales DESC;

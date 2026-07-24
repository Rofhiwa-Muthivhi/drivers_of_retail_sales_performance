-- UNEMPLOYMENT EFFECT ON SALES PERFORMANCE

-- ===================================================
-- 'NA'text found on the unemployment column row 405.
-- Unemployment column was imported as varchar.
-- ===================================================
SELECT DISTINCT unemployment
FROM [dbo].[Features]
ORDER BY unemployment;

-- ===============================================================
-- Relationship between unemployment levels and retail sales performance.
-- This measures economic impact on consumer spending.
-- Identifies whether unemployment influences sales.
-- Supports strategic planning during economic downturns
-- ===============================================================
SELECT
      CASE
          WHEN TRY_CAST(f.unemployment AS DECIMAL(10,3)) < 6 THEN 'Low Unemployment'
          WHEN TRY_CAST(f.unemployment AS DECIMAL(10,3)) BETWEEN 6 AND 8 THEN 'Moderate Unemployment'
      ELSE 'High Unemployment'
      END AS unemployment_category,
      ROUND(AVG(s.weekly_sales), 2) AS avg_sales,
      COUNT(*) AS transaction_count
FROM [dbo].[Sales] s
INNER JOIN features f
ON s.store = f.store AND s.date = f.date
GROUP BY
        CASE
            WHEN TRY_CAST(f.unemployment AS DECIMAL(10,3)) < 6 THEN 'Low Unemployment'
            WHEN TRY_CAST(f.unemployment AS DECIMAL(10,3)) BETWEEN 6 AND 8 THEN 'Moderate Unemployment'
        ELSE 'High Unemployment'
        END
ORDER BY avg_sales DESC;
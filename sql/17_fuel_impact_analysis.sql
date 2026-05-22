-- FUEL IMPACT ON SALES

-- ======================================
-- No missing or non numeric text found.
-- ======================================
SELECT DISTINCT fuel_price
FROM [dbo].[Features]
ORDER BY fuel_price;


-- ==============================================
-- Checking the highest and lowest price of fuel.
-- ==============================================
SELECT
    MIN(fuel_price) AS min_fuel_price,
    MAX(fuel_price) AS max_fuel_price
FROM [dbo].[Features];


-- ===============================================================
-- Relationship between fuel prices and retail sales performance.
-- This measures whether fuel prices affect customer spending.
-- Identifies whether rising transport costs influence sales.
-- ===============================================================
SELECT
      CASE
          WHEN f.fuel_price < 3.0 THEN 'Low Fuel Price'
          WHEN f.fuel_price BETWEEN 3.0 AND 3.7 THEN 'Moderate Fuel Price'
      ELSE 'High Fuel Price'
      END AS fuel_price_category,
      ROUND(AVG(s.weekly_sales), 2) AS avg_sales,
      COUNT(*) AS transaction_count
FROM dbo.Sales s
INNER JOIN dbo.Features f
ON s.store = f.store AND s.date = f.date
GROUP BY
        CASE
            WHEN f.fuel_price < 3.0 THEN 'Low Fuel Price'
            WHEN f.fuel_price BETWEEN 3.0 AND 3.7 THEN 'Moderate Fuel Price'
        ELSE 'High Fuel Price'
        END
ORDER BY avg_sales DESC;
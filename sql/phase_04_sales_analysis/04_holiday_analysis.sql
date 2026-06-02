-- HOLIDAY ANALYSIS

-- ===========================================================================
-- HOLIDAYS VS NON-HOLIDAYS SALES PERFORMANCE
-- Measures holiday impact on sales.
-- Identifies seasonal demand patterns.
-- Supports marketing and staffing decisions.
-- Helps businesses optimize promotions, inventory, and operational planning.
-- ===========================================================================
SELECT
      CASE
          WHEN isholiday = 'TRUE' THEN 'Holiday Week'
      ELSE 'Non-Holiday Week'
      END AS holiday_period,
      COUNT(DISTINCT date) AS total_weeks,
      ROUND(SUM(weekly_sales), 2) AS total_sales,
      ROUND(AVG(weekly_sales), 2) AS avg_sales
FROM sales
GROUP BY CASE
             WHEN isholiday = 'TRUE' THEN 'Holiday Week'
             ELSE 'Non-Holiday Week'
             END;


-- ========================================
-- TOP HOLIDAYS SALES WEEK
-- Measures weekly holiday performance.
-- Identifies strongest seasonal periods.
-- ========================================
SELECT
      date,
      ROUND(SUM(weekly_sales), 2) AS total_sales
FROM sales
WHERE isholiday = 'TRUE'
GROUP BY date
ORDER BY total_sales DESC;
  
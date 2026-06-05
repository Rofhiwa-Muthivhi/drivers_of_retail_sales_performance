
-- MARKDOWN PROMOTION IMPACT ON SALES PERFORMANCE

-- ================================================
-- Checking NULL values.
-- Checking id markdowns are recorded as amounts.
-- ================================================
SELECT
    MIN(markdown1) AS min_markdown1,
    MAX(markdown1) AS max_markdown1,
    MIN(markdown2) AS min_markdown2,
    MAX(markdown2) AS max_markdown2,
    MIN(markdown3) AS min_markdown3,
    MAX(markdown3) AS max_markdown3,
    MIN(markdown4) AS min_markdown4,
    MAX(markdown4) AS max_markdown4,
    MIN(markdown5) AS min_markdown5,
    MAX(markdown5) AS max_markdown5
FROM [dbo].[Features];


-- ===============================================================
-- Relationship between markdown promotions and retail sales.
-- This measures whether promotions improved sales performance.
-- Identifies whether stores performed better during markdown periods.
-- This helps with promotional decision-making.
-- ===============================================================
SELECT
      CASE
          WHEN
              ISNULL(f.markdown1, 0) > 0
              OR ISNULL(f.markdown2, 0) > 0
              OR ISNULL(f.markdown3, 0) > 0
              OR ISNULL(f.markdown4, 0) > 0
              OR ISNULL(f.markdown5, 0) > 0
          THEN 'Markdown Applied'
      ELSE 'No Markdown'
      END AS markdown_status,
      ROUND(AVG(s.weekly_sales), 2) AS avg_sales,
      COUNT(*) AS transaction_count
FROM [dbo].[Sales] s
INNER JOIN [dbo].[Features] f
ON s.store = f.store AND s.date = f.date
GROUP BY
        CASE
            WHEN
                ISNULL(f.markdown1, 0) > 0
                OR ISNULL(f.markdown2, 0) > 0
                OR ISNULL(f.markdown3, 0) > 0
                OR ISNULL(f.markdown4, 0) > 0
                OR ISNULL(f.markdown5, 0) > 0
            THEN 'Markdown Applied'
        ELSE 'No Markdown'
        END
ORDER BY avg_sales DESC;


-- ======================================================================================================================
-- Which markdown categories influence sales the most?
-- Measures the average value of each markdown category and compares promotional activity across categories.
-- Helps identify which markdown categories are most utilized and may have the greatest influence on sales performance.
-- ======================================================================================================================
SELECT
    ROUND(AVG(markdown1), 2) AS avg_markdown1,
    ROUND(AVG(markdown2), 2) AS avg_markdown2,
    ROUND(AVG(markdown3), 2) AS avg_markdown3,
    ROUND(AVG(markdown4), 2) AS avg_markdown4,
    ROUND(AVG(markdown5), 2) AS avg_markdown5,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales
FROM [dbo].[Sales] s
INNER JOIN features f
ON s.store = f.store AND s.date = f.date;
-- STORE PERFORMANCE 

-- =========================================================
-- RANKING STORES
-- Identifies top performing and underperforming stores.
-- Helps with operational and investment decisions.
-- =========================================================
SELECT
      store,
      ROUND(SUM(weekly_sales), 2) AS total_sales,
      RANK() OVER (
        ORDER BY SUM(weekly_sales) DESC
      ) AS sales_rank
FROM [dbo].[Sales]
GROUP BY store
ORDER BY total_sales DESC;


-- =================================================================================================
-- BOTTOM PERFORMING STORES
-- Helps identify stores generating the lowest sales.
-- Helps with performance improvement strategies.
-- Understanding weak performing stores helps businesses optimize support, and resource allocation.
-- ================================================================================================
SELECT TOP 10
       store,
       ROUND(SUM(weekly_sales), 2) AS total_sales,
       RANK() OVER (
        ORDER BY SUM(weekly_sales) ASC
       ) AS sales_rank
FROM [dbo].[Sales]
GROUP BY store
ORDER BY total_sales ASC;


-- =================================================
-- STORE TYPE PERFORMANCE
-- Do larger store types perform better?
-- Evaluates which store categories perform best
-- =================================================
SELECT
      st.type AS store_type,
      ROUND(SUM(s.weekly_sales), 2) AS total_sales,
      COUNT(DISTINCT s.store) AS number_of_stores
FROM [dbo].[Sales] s
INNER JOIN stores st
ON s.store = st.store
GROUP BY st.type
ORDER BY total_sales DESC;


-- ===================================================================
-- AVERAGE SALES BY STORE TYPE
-- Which store type performs best on average?
-- Evaluate store type performance based on average sales per store.
-- Removes bias caused by unequal store counts.
-- Measures operational performance more fairly.
-- Identifies strongest-performing store categories.
-- ===================================================================
SELECT
      st.type AS store_type,
      COUNT(DISTINCT s.store) AS number_of_stores,
      ROUND(SUM(s.weekly_sales), 2) AS total_sales,
      ROUND(
        SUM(s.weekly_sales) /
        COUNT(DISTINCT s.store), 2
      ) AS avg_sales_per_store
FROM [dbo].[Sales] s
INNER JOIN stores st
ON s.store = st.store
GROUP BY st.type
ORDER BY avg_sales_per_store DESC;


-- ============================================================
-- STORE SIZE VS SALES
-- Do bigger stores generate more sales?
-- Identifies relationship between store size and revenue
-- ============================================================
SELECT
      s.store,
      st.size,
      ROUND(SUM(s.weekly_sales), 2) AS total_sales
FROM [dbo].[Sales] s
INNER JOIN stores st
ON s.store = st.store
GROUP BY s.store, st.size
ORDER BY st.size DESC;


-- ===================================================================================================
-- STORE SIZE SEGMENTATION
-- Store size categories.
-- Evaluate whether larger stores generate higher sales by grouping stores into size categories.
-- Identifies relationship between size and sales performance.
-- Helps with understanding how store size influences revenue.
-- ===================================================================================================
SELECT
      CASE
          WHEN st.size >= 150000 THEN 'Large'
          WHEN st.size >= 100000 THEN 'Medium'
      ELSE 'Small'
      END AS store_size_category,
      COUNT(DISTINCT s.store) AS number_of_stores,
      ROUND(SUM(s.weekly_sales), 2) AS total_sales,
      ROUND(SUM(s.weekly_sales) /COUNT(DISTINCT s.store), 2) AS avg_sales_per_store
FROM [dbo].[Sales] s
INNER JOIN stores st
ON s.store = st.store
GROUP BY
      CASE
          WHEN st.size >= 150000 THEN 'Large'
          WHEN st.size >= 100000 THEN 'Medium'
          ELSE 'Small'
      END
ORDER BY avg_sales_per_store DESC;
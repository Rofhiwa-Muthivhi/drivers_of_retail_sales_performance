/* This queries will output previews for tables we created and this will help us to understand
   the database and the relationships between the tables */

-- ================================
-- Stores Table previewing
-- ================================
SELECT TOP 5 *
FROM stores;


-- ================================
-- Sales Table previewing
-- ================================
SELECT TOP 5 *
FROM sales;


-- ================================
-- Features Table previewing
-- ================================
SELECT TOP 5 *
FROM features;


-- ==============================================
-- Sales and Features table relationship testing
-- ==============================================
SELECT TOP 10
       s.store,
       s.date,
       s.weekly_sales,
       f.temperature
FROM sales s
JOIN features f
ON s.store = f.store AND s.date = f.date;


-- ============================================
-- Stores and sales table relationship testing
-- ============================================
SELECT TOP 10
       st.store,
       st.type,
       st.size,
       sa.weekly_sales
FROM stores st
JOIN sales sa
ON st.store = sa.store;
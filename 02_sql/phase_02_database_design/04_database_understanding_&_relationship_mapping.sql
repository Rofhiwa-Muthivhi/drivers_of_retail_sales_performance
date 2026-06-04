/* These queries output previews of the tables created and help
   understand the database structure and relationships between tables. */

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
INNER JOIN features f
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
INNER JOIN sales sa
ON st.store = sa.store;
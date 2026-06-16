-- FINAL ANALYSIS TABLE

-- =======================================================================
-- This Query will join all the tables on the retail_analysis database.
-- Unified table will be used to create visuals.
-- Aliases used because on first attempt my table copied without columns.
-- =======================================================================

SELECT
      s.store AS store,
      s.date AS sale_date,
      s.dept AS department,
      s.weekly_sales AS weekly_sales,
      s.isholiday AS isholiday,

      st.type AS store_type,
      st.size AS store_size,

      f.temperature AS temperature,
      f.fuel_price AS fuel_price,
      f.cpi AS cpi,
      f.unemployment AS unemployment,
      f.markdown1 AS markdown1,
      f.markdown2 AS markdown2,
      f.markdown3 AS markdown3,
      f.markdown4 AS markdown4,
      f.markdown5 AS markdown5
FROM [dbo].[Sales] s
LEFT JOIN stores st
ON s.store = st.store
LEFT JOIN features f
ON s.store = f.store AND s.date = f.date;

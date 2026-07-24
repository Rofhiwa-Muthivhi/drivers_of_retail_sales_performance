-- NA MARKDOWN VALUES CLEANING.

-- Finding the total amount of 'NA' per markdown column on features table
SELECT
    SUM(CASE WHEN markdown1 = 'NA' THEN 1 ELSE 0 END) AS markdown1_na,
    SUM(CASE WHEN markdown2 = 'NA' THEN 1 ELSE 0 END) AS markdown2_na,
    SUM(CASE WHEN markdown3 = 'NA' THEN 1 ELSE 0 END) AS markdown3_na,
    SUM(CASE WHEN markdown4 = 'NA' THEN 1 ELSE 0 END) AS markdown4_na,
    SUM(CASE WHEN markdown5 = 'NA' THEN 1 ELSE 0 END) AS markdown5_na
FROM features;


-- ===========================================================
-- Replace 'NA' values in markdown columns with 0.
-- We assume 'NA' represents no promotional markdown activity.
-- ===========================================================
UPDATE features
SET
    markdown1 = CASE WHEN markdown1 = 'NA' THEN '0' ELSE markdown1 END,
    markdown2 = CASE WHEN markdown2 = 'NA' THEN '0' ELSE markdown2 END,
    markdown3 = CASE WHEN markdown3 = 'NA' THEN '0' ELSE markdown3 END,
    markdown4 = CASE WHEN markdown4 = 'NA' THEN '0' ELSE markdown4 END,
    markdown5 = CASE WHEN markdown5 = 'NA' THEN '0' ELSE markdown5 END;



-- Verifying if the update query executed successfully.
SELECT
    SUM(CASE WHEN markdown1 = 'NA' THEN 1 ELSE 0 END) AS markdown1_na,
    SUM(CASE WHEN markdown2 = 'NA' THEN 1 ELSE 0 END) AS markdown2_na,
    SUM(CASE WHEN markdown3 = 'NA' THEN 1 ELSE 0 END) AS markdown3_na,
    SUM(CASE WHEN markdown4 = 'NA' THEN 1 ELSE 0 END) AS markdown4_na,
    SUM(CASE WHEN markdown5 = 'NA' THEN 1 ELSE 0 END) AS markdown5_na
FROM features;


-- ========================================================================
-- NA markdowns are now replaced to '0' but is this '0' numerical or text
-- The '0' is still text meaning varchar.
-- ========================================================================
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'features'
AND column_name IN ('markdown1','markdown2','markdown3','markdown4','markdown5');


-- =========================================================
-- Convert markdown columns from varchar to float.
-- This will enable aggregations and numerical analysis.
-- =========================================================

ALTER TABLE features
ALTER COLUMN markdown1 FLOAT;

ALTER TABLE features
ALTER COLUMN markdown2 FLOAT;

ALTER TABLE features
ALTER COLUMN markdown3 FLOAT;

ALTER TABLE features
ALTER COLUMN markdown4 FLOAT;

ALTER TABLE features
ALTER COLUMN markdown5 FLOAT;


-- Verifying if the alter query executed successfully.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'features'
AND column_name IN ('markdown1','markdown2','markdown3','markdown4','markdown5');
-- ISHOLIDAY DATATYPE CLEANING.

-- Checking which datatype isholiday was imported as.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'features'AND column_name = 'isholiday';


-- ==========================================================
-- Converting datatype to BIT.
-- TRUE = 1
-- FALSE = 0
-- Validating if conversion will not have errors.
-- ==========================================================
SELECT TOP 10
       isholiday,
       CASE
           WHEN isholiday = 'TRUE' THEN 1
           WHEN isholiday = 'FALSE' THEN 0
       END AS isholiday_numeric
FROM features;


-- =========================================================
-- Convert TRUE/FALSE values to BIT datatype.
-- This will support holiday analysis.
-- =========================================================
UPDATE features
SET isholiday =
    CASE
        WHEN isholiday = 'TRUE' THEN '1'
        WHEN isholiday = 'FALSE' THEN '0'
    END;


-- Permanently changing the datatype.
ALTER TABLE features
ALTER COLUMN isholiday BIT;


-- Verifying if the alter query executed successfully
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'features'AND column_name = 'isholiday';
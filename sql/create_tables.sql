-- How to ensure the correct database is chosen
USE retail_analysis;

-- Creating table strucutre for all 3 datasets

-- ==================================================
--   Stores
-- ==================================================
CREATE TABLE Stores (
Store INT,
Type VARCHAR(10),
Size INT
);

-- ==================================================
-- Features
-- ==================================================
CREATE TABLE Features (
    Store INT,
    Date DATE,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,2),
    MarkDown1 DECIMAL(10,2),
    MarkDown2 DECIMAL(10,2),
    MarkDown3 DECIMAL(10,2),
    MarkDown4 DECIMAL(10,2),
    MarkDown5 DECIMAL(10,2),
    CPI DECIMAL(10,2),
    Unemployment DECIMAL(5,2),
    IsHoliday BIT
);

-- ==================================================
-- Sales
-- ==================================================
CREATE TABLE Sales (
    Store INT,
    Dept INT,
    Date DATE,
    Weekly_Sales DECIMAL(12,2),
    Is_Holiday BIT
);
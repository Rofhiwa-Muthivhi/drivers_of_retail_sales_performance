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
    Temperature DECIMAL(10,2),
    Fuel_Price DECIMAL(10,2),
    MarkDown1 VARCHAR(20),
    MarkDown2 VARCHAR(20),
    MarkDown3 VARCHAR(20),
    MarkDown4 VARCHAR(20),
    MarkDown5 VARCHAR(20),
    CPI DECIMAL(15,2),
    Unemployment DECIMAL(10,3),
    IsHoliday VARCHAR(10)
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


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
    Store VARCHAR(50),
    Date VARCHAR(50),
    Temperature VARCHAR(50),
    Fuel_Price VARCHAR(50),
    MarkDown1 VARCHAR(50),
    MarkDown2 VARCHAR(50),
    MarkDown3 VARCHAR(50),
    MarkDown4 VARCHAR(50),
    MarkDown5 VARCHAR(50),
    CPI VARCHAR(50),
    Unemployment VARCHAR(50),
    IsHoliday VARCHAR(10)
);

-- ==================================================
-- Sales
-- ==================================================
CREATE TABLE Sales (
    Store INT,
    Dept INT,
    Date VARCHAR(50),
    Weekly_Sales VARCHAR(50),
    IsHoliday VARCHAR(50)
);



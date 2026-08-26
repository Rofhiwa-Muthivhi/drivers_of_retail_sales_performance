## Stores Data Cleaning

The Stores table was checked and cleaned before moving on to the analysis. The main issue was that all the columns were initially imported as NVARCHAR, and quotation marks were included in the store and size values.

I removed the quotation marks and validated the values before converting the columns to the correct data types:

store - INT
type - VARCHAR(1)
size - INT

I also checked for missing values and duplicate store IDs, and no issues were found. The table was successfully cleaned, with all 45 store records retained.


## Features Data Cleaning

The Features table was reviewed and cleaned before starting the analysis. The main issues found were that the columns were initially imported as NVARCHAR, some values contained quotation marks, and there were NA values in the markdown, CPI, and Unemployment columns.

The quotation marks were removed from the store and isholiday column values, and the data was checked before changing the columns to their appropriate data types:

store - INT
date - DATE
temperature - FLOAT
fuel_price - DECIMAL(10,3)
markdown1 - DECIMAL(18,2)
markdown2 - DECIMAL(18,2)
markdown3 - DECIMAL(18,2)
markdown4 - DECIMAL(18,2)
markdown5 - DECIMAL(18,2)
cpi - DECIMAL(10,3)
unemployment - DECIMAL(10,3)
isholiday - BIT

The NA values in the markdown columns were changed to 0 because they represent periods where there was no markdown value recorded. The NA values in CPI and Unemployment were changed to NULL because these values were genuinely missing and should not be treated as zero.

A total of 585 records had both CPI and Unemployment missing. These records were checked and retained because the missing values were part of the original dataset and there was no reason to remove the records themselves.

The Features table was successfully cleaned, with all 8,190 records retained.
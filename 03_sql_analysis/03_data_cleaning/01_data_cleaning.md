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


## Sales Data Cleaning

The Sales table was checked and cleaned before moving on to the analysis. The main issues identified were that all columns were initially imported as NVARCHAR, quotation marks were included in the store and isholiday values, and the date values were stored in DD/MM/YYYY format.

I first reviewed the raw data and checked for duplicate records and missing values. No duplicate records were found based on the combination of store, dept, and date, and there were no missing values across the five columns.

The data types were then checked and all columns were initially stored as NVARCHAR. I validated the store, dept, date, and weekly_sales values before converting them to the appropriate data types.

Quotation marks were removed from the store and isholiday columns. The isholiday values were then changed from TRUE and FALSE to 1 and 0 so that the column could be converted to BIT.

The date values were validated using the DD/MM/YYYY format and standardized before being converted to the DATE data type. The weekly_sales values were also checked for decimal precision and converted to DECIMAL(18,2) because the column represents monetary sales values.

The final data types were standardized as follows:

* store - INT
* dept - INT
* date - DATE
* weekly_sales - DECIMAL(18,2)
* isholiday - BIT

Additional data quality checks were performed after cleaning. The final table contained 421,570 records, with 45 unique stores and 81 unique departments. No missing values or duplicate records were found, and all store and department values were valid.

I also identified 1,285 negative weekly_sales records and 73 records with zero sales. These values were retained because there was not enough evidence to classify them as errors. They were therefore treated as data quality observations rather than removed from the dataset.



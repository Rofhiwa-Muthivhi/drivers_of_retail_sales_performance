## Stores Data Cleaning

The Stores table was checked and cleaned before moving on to the analysis. The main issue was that all the columns were initially imported as NVARCHAR, and quotation marks were included in the store and size values.

I removed the quotation marks and validated the values before converting the columns to the correct data types:

store - INT
type - VARCHAR(1)
size - INT

I also checked for missing values and duplicate store IDs, and no issues were found. The table was successfully cleaned, with all 45 store records retained.
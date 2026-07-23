# Data Import Validation

### Features Table Import Adjustment

During raw data ingestion, datatype conversion errors occurred when importing `features.csv`.

### What was found

* `IsHoliday` contained TRUE/FALSE values rather than binary values.
* `MarkDown1–5` contained `NA` values.
* Numeric conversion issues occurred during import due to formatting.

### Decision taken

The `Features` table was temporarily designed using `VARCHAR` datatypes to allow successful raw data ingestion.

Data cleaning and datatype conversion were postponed to the profiling and data cleaning phases.

### Data Import Status

The following datasets were successfully imported into SQL Server:

* `stores.csv`
* `features.csv`
* `sales.csv`

The `Sales` table required column mapping adjustments during import to align with the table structure and naming conventions.

### Validation

Data import validation was performed by comparing row counts after loading the datasets into SQL Server.

Expected row counts:

* Stores: 45 rows
* Features: 8,190 rows
* Sales: 421,570 rows

The validation confirmed that all datasets were successfully loaded into the database and were ready for further analysis.

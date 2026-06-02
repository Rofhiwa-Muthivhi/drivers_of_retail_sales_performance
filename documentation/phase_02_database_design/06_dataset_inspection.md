## Features Table Import Adjustment

During raw data ingestion, datatype conversion errors occurred when importing `features.csv`.

Findings:
- `IsHoliday` contained TRUE/FALSE values rather than binary values.
- `MarkDown1–5` contained `NA` values.
- Numeric conversion issues occurred during import due to formatting/precision conflicts.

Decision:
The `features` table was temporarily redesigned using VARCHAR datatypes to allow successful raw ingestion. Data cleaning and datatype conversion will be performed during the profiling and cleaning phase.

## Data Import Status

The following datasets were successfully imported into SQL Server:

- `stores.csv`
- `features.csv`
- `sales.csv`( The `sales` table required column mapping adjustments to align with naming conventions.)
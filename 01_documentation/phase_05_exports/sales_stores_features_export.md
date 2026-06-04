# Final Table Exports

## Objective

The purpose of this step was to export the final cleaned and analysis-ready tables from SQL Server Management Studio (SSMS) into CSV format. These exported files will be used in the next phase of the project for Excel Pivot Tables, charts, and reporting.

## Steps Taken

The following steps were followed to export the final tables:

1. Opened SQL Server Management Studio (SSMS).
2. Connected to the `retail_analysis` database.
3. Expanded the database and reviewed the available tables.
4. Wrote and executed separate SQL queries to retrieve all records from the final analysis-ready tables:

   * `sales`
   * `stores`
   * `features`
5. Verified that the query results were returned successfully.
6. Right-clicked within the results grid and selected **Save Results As**.
7. Saved each table as a `.csv` file for use in the Excel analysis phase.

## Output Files

The following CSV files were generated:

* `sales_cleaned.csv`
* `stores_cleaned.csv`
* `features_cleaned.csv`

## Next Step

The exported CSV files will be imported into Microsoft Excel to create Pivot Tables, charts, and supporting visual analysis for the retail sales performance project.

# Date Datatype Cleaning

## Objective

The date columns were stored as VARCHAR (text) instead of DATE.

This made it difficult to analyse sales trends over time and could cause dates to be sorted or grouped incorrectly.

The date values were converted to DATE format to support accurate time-based analysis.

## Cleaning Actions

- Validated date values using TRY_CONVERT().
- Applied SQL Server style 103 to correctly interpret dates stored in DD/MM/YYYY format.
- Converted the date values to DATE format.
- Permanently changed the column datatype from VARCHAR to DATE.
- Verified the schema update using INFORMATION_SCHEMA.COLUMNS.

## Outcome

The `sales` and `features` tables now contain properly formatted DATE columns, enabling reliable trend analysis, weekly aggregation, monthly reporting, and future date-based calculations.
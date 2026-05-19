# Data Cleaning Documentation

## Overview

This phase focused on preparing the dataset for accurate analysis by resolving data quality issues identified during profiling and early analysis.

The cleaning process followed a structured approach:

1. Validate the issue
2. Test conversions safely
3. Apply permanent cleaning
4. Revalidate results

---

# 1. Date Datatype Cleaning

## Issue Identified

The `date` column in both the `sales` and `features` tables was stored as `VARCHAR` instead of `DATE`.

This prevented proper time-series analysis, including:

- Monthly trend analysis
- Yearly trend analysis
- Date-based aggregations

## Validation Performed

`TRY_CONVERT()` was used to validate whether the values could safely convert to a date datatype.

SQL Server style `103` was used because the dataset dates followed the `DD/MM/YYYY` format.

Example:

08/07/2011 → 2011-07-08

## Cleaning Action

The `date` columns were permanently converted from `VARCHAR` to `DATE`.

## Outcome

The dataset became ready for time-series analysis and date functions.

---

# 2. Markdown Values Cleaning

## Issue Identified

The markdown columns (`markdown1` to `markdown5`) contained text values labeled `"NA"`.

Initial profiling showed a high number of `"NA"` entries across the markdown columns.

## Business Assumption

`"NA"` values were interpreted as:

> No promotional markdown activity

rather than missing or corrupted data.

## Validation Performed

A count analysis was conducted to determine the volume of `"NA"` values in each markdown column.

## Cleaning Action

- `"NA"` values were replaced with `0`
- Markdown columns were converted from `VARCHAR` to `FLOAT`

Affected columns:

- markdown1
- markdown2
- markdown3
- markdown4
- markdown5

## Outcome

The markdown columns became suitable for:

- numerical analysis
- aggregations
- promotional effectiveness analysis

---

# 3. Weekly Sales Datatype Cleaning

## Issue Identified

During monthly sales trend analysis, aggregation using `SUM(weekly_sales)` failed.

The error indicated that the `weekly_sales` column was stored as `VARCHAR`.

## Validation Performed

`TRY_CAST()` was used to verify whether values could safely convert to numeric format.

No unexpected conversion errors or NULL values were identified.

## Cleaning Action

The `weekly_sales` column was permanently converted from `VARCHAR` to `FLOAT`.

## Outcome

This cleaning step enabled:

- sales aggregation
- sales trend analysis
- numerical calculations
- business performance reporting

---

## Final Cleaning Summary

Completed cleaning tasks:

- Converted `date` columns from `VARCHAR` to `DATE`
- Replaced `"NA"` markdown values with `0`
- Converted markdown columns to `FLOAT`
- Converted `weekly_sales` to `FLOAT`

The dataset is now analysis-ready.
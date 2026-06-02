# DATA CLEANING

## Overview

This phase focused on cleaning the dataset and fixing data quality issues before analysis.

The cleaning process followed four steps:

1. Identify the issue
2. Validate the issue
3. Apply the cleaning
4. Verify the results


# 1. DATE DATATYPE CLEANING

## Issue

The date columns in the sales and features tables were stored as VARCHAR instead of DATE.

This made date-based analysis difficult.

## Cleaning

* Validated the date format using TRY_CONVERT().
* Used SQL Server style 103 because the dates were stored as DD/MM/YYYY.
* Converted the date columns from VARCHAR to DATE.

## Outcome

The dataset is now ready for time-series and date-based analysis.


# 2. MARKDOWN CLEANING

## Issue

The markdown columns contained 'NA' values stored as text.

## Assumption

* 'NA' represents no promotional markdown activity.

## Cleaning

* Counted the number of 'NA' values.
* Replaced 'NA' values with 0.
* Converted markdown columns from VARCHAR to FLOAT.

## Outcome

The markdown columns can now be used for calculations and analysis.


# 3. WEEKLY SALES DATATYPE CLEANING

## Issue

The weekly_sales column was stored as VARCHAR instead of a numeric datatype.

This prevented sales calculations and aggregations.

## Cleaning

* Checked that weekly_sales values could be converted safely.
* Converted weekly_sales from VARCHAR to FLOAT.

## Outcome

The weekly_sales column can now be used for aggregations, calculations, and trend analysis.


# FINAL RESULT

Completed cleaning tasks:

* Converted date columns from VARCHAR to DATE.
* Replaced 'NA' markdown values with 0.
* Converted markdown columns to FLOAT.
* Converted weekly_sales to FLOAT.

The dataset is now ready for analysis.

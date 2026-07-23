# Table Creation

After creating the `retail_analysis` database, table structures for the following three datasets were created for this project:

* `Stores`
* `Features`
* `Sales`

### Stores

The `Stores` table was created to store information about each retail store, including:

* Store ID
* Store Type
* Store Size

### Features

The `Features` table was created to store external factors influencing sales performance. The following columns exist:

* Temperature
* Fuel Price
* CPI
* Unemployment
* MarkDown1–5
* Holiday Status

### Sales

The `Sales` table was created to store weekly sales transactions across stores and departments, including:

* Store ID
* Department ID
* Date
* Weekly Sales
* Holiday Status

## Approach Taken During Table Creation

During the table creation process, columns in the `Features` and `Sales` tables were temporarily assigned `VARCHAR` datatypes.

This approach was used to support successful raw data import and avoid datatype inconsistencies such as:

* TRUE/FALSE values in the `IsHoliday` field
* Missing values represented as `NA`
* Numeric formatting variations

Datatype standardization was postponed to the data cleaning phase after the raw data had been successfully imported.

## Purpose

The table structures were created to provide a environment for importing, storing, and preparing retail sales data for profiling, cleaning, and analysis.

# WEEKLY SALES DATATYPE CLEANING

## Objective

The weekly_sales column was stored as VARCHAR instead of a numeric datatype.

This prevented proper calculations and sales analysis.

## Cleaning Actions

* Checked the datatype of the weekly_sales column.
* Tested whether the values could be converted to FLOAT.
* Converted weekly_sales from VARCHAR to FLOAT.
* Verified that the datatype conversion was successful.

## Outcome

The weekly_sales column now contains numerical values and can be used for calculations, aggregations, and sales trend analysis.

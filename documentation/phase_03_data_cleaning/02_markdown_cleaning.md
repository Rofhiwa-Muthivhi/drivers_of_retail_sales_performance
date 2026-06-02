
# MARKDOWN CLEANING

## Objective

The markdown columns contained 'NA' values stored as text.

Since markdown columns represent promotional discount amounts, 'NA' was assumed to mean no markdown activity.

## Cleaning Actions

* Counted the number of 'NA' values in each markdown column.
* Replaced all 'NA' values with 0.
* Verified that all 'NA' values were successfully removed.
* Converted markdown columns from VARCHAR to FLOAT datatype.
* Verified that the datatype conversion was successful.

## Assumption

'NA' represents no promotional markdown activity.

## Outcome

The markdown columns now contain numerical values only and can be used for calculations and analysis.


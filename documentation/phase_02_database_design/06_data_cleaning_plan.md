# Data Cleaning Plan

Before starting the data cleaning process, the profiling stage was used to identify data quality issues and determine what actions needed to be taken.

## Date Column

### Issue Found

The `date` column was imported as a `VARCHAR` datatype.

### Decision Taken

The column will be converted to a `DATE` datatype.

### Reason

This will allow accurate date analysis and the use of SQL date functions.


## Markdown Columns

### Issue Found

The markdown columns contained `'NA'` values.

### Decision Taken

The `'NA'` values will be replaced with `0`.

### Reason

The missing values are assumed to represent periods where no markdown promotions were running.


## Duplicate Records

### Issue Found

No duplicate records were identified during profiling.

### Decision Taken

No cleaning action is required.

### Reason

The data already follows the expected business structure.


## Outliers

### Issue Found

Extreme sales values were identified, including negative sales values.

### Decision Taken

The values will be retained.

### Reason

The values may represent valid business events such as refunds, returns, promotions, or holiday sales activity.


## Table Relationships

### Issue Found

Relationships between tables were identified and tested.

### Decision Taken

The relationships will be used during analysis.

### Reason

Accurate joins are required to combine sales, store, and feature data correctly.


## Summary

The main cleaning activities will focus on datatype corrections and handling markdown values. Duplicate records were not identified, and outliers will be retained because they may represent valid business activity.

# Task 4: Data Profiling

### Objective
The purpose of this stage was to investigate the quality, structure, and reliability of the dataset before performing any cleaning or analysis. Profiling was conducted to identify missing values, duplicates, incorrect data types, outliers, and potential data quality issues.


## 1. Dataset Size Assessment

The following record counts were identified across the three tables:

 - Stores  45 rows 
 - Features  8,190 rows 
 - Sales  421,570 rows

### Observation
The `sales` table contains more records because it tracks sales by store, department, and week, whereas the `features` table only tracks information by store and week.


## 2. Missing Values Investigation

An investigation was conducted on the markdown columns within the `features` table.

### Findings

 Column 'NA' Count 

 Markdown1(column)  4,158 rows 
 Markdown2(column)  5,269 rows 
 Markdown3(column)  4,577 rows 
 Markdown4(column)  4,726 rows
 Markdown5(column)  4,140 rows

### Observation
Many values in the markdown columns were missing and appeared as `'NA'`.

### Interpretation
The `'NA'` values may represent periods when no markdown promotions were active rather than data errors.

### Recommendation

A final cleaning decision will be made during the data cleaning stage.


## 3. Duplicate Record Investigation

Duplicate checks were performed on all tables to identify any repeated records.

### Results

#### Stores Table
- Checked duplicate `store` values.
- **No duplicates found**.

#### Features Table
- Checked duplicate combinations of `store + date`.
- **No duplicates found**.

#### Sales Table
- Checked duplicate combinations of `store + department + date`.
- **No duplicates found**.

### Observation
No duplicate records were found, indicating good data consistency.


## 4. Date Format Consistency

Date values were checked to ensure consistency.

### Findings

- All dates followed the same format.

### Data Type Issue

The `date` column in the `sales` table was imported as `VARCHAR`.

The column will be converted to a `DATE` datatype during the data cleaning stage.


## 5. Outlier Investigation

The `weekly_sales` column was investigated to identify unusual values.

### Findings

- Minimum Sales: -4,988.94
- Maximum Sales: 693,099.30
- Average Sales: 15,981

### Observation

Negative sales values were identified in the dataset.

### Interpretation

The negative sales values may represent product returns, refunds, or accounting adjustments rather than data entry errors.

### Recommendation

The negative sales values will be kept for analysis because they may represent normal business transactions.


## 6. NULL Value Investigation

Key columns in the `sales` table were checked for NULL values.

### Findings

No NULL values were found in:

- `weekly_sales`
- `date`
- `store`

### Observation

No missing values were identified in these key fields.
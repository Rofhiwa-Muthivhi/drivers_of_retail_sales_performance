# Task 4: Data Profiling

## Objective
The purpose of this stage was to investigate the quality, structure, and reliability of the dataset before performing any cleaning or analysis. Profiling was conducted to identify missing values, duplicates, incorrect data types, outliers, and potential data quality issues.

---

## 1. Dataset Size Assessment

The following record counts were identified across the three tables:

| Table | Record Count |
|--------|--------------|
| Stores | 45 |
| Features | 8,190 |
| Sales | 421,570 |

### Observation
The `sales` table contains significantly more records because sales are recorded at the **store, department, and weekly level**, while the `features` table is recorded at the **store and weekly level**.

---

## 2. Missing Values Investigation

An investigation was conducted on the markdown columns within the `features` table.

### Findings

| Column | 'NA' Count |
|---------|------------|
| Markdown1 | 4,158 |
| Markdown2 | 5,269 |
| Markdown3 | 4,577 |
| Markdown4 | 4,726 |
| Markdown5 | 4,140 |

### Observation
The markdown columns contained substantial missing values represented as `'NA'` text values instead of SQL `NULL` values.

### Initial Interpretation
The `'NA'` values are likely business-related rather than data quality errors and may represent periods where **no promotional markdowns were active**.

### Recommendation
Further investigation and cleaning decisions will be addressed during the data cleaning stage.

---

## 3. Duplicate Record Investigation

Duplicate checks were performed across all tables using expected business keys.

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
The dataset structure aligns with expected business logic, indicating strong data consistency.

---

## 4. Date Format Consistency

Date values were visually inspected to assess consistency.

### Findings
- Date formatting appeared consistent across records.
- Dates followed a uniform structure.

### Data Type Issue
The `date` column in the `sales` table was imported as: `VARCHAR`.
The column should be converted to a proper `DATE` datatype during cleaning to support accurate time-based analysis.
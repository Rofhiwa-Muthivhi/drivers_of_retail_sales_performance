# Database Understanding and Relationship Mapping

## Objective

This step was taken to understand the structure of the database and identify relationships between tables.

## Tables Investigated

### Stores

Contains store-level information:

* Store ID
* Store Type
* Store Size

### Sales

Contains weekly sales performance data:

* Store
* Department
* Date
* Weekly Sales
* IsHoliday Indicator

### Features

Contains external factors that may influence sales performance:

* Temperature
* Fuel Price
* CPI
* Unemployment
* MarkDowns
* Holiday Indicators

## Relationships identified between tables

### Stores & Sales

**Join Key:**

`Store`

**Reason:**

The `Stores` table contains information such as `store type` and `store size`. This information can be linked to sales records using the `store` identifier.

### Features & Sales

**Join Key:**

`Store + Date`

**Reason:**

External factors change over time and must be matched to the correct store and week. This means, both the `store` and `date` fields are required when joining the tables.

## Key Learning

Understanding relationships between tables is important because joins allow multiple datasets to be combined for business analysis.

### Example Business Questions

* Do larger stores generate higher sales?
* Do holidays increase sales?
* Does unemployment influence sales performance?
* Do markdowns increase weekly sales?

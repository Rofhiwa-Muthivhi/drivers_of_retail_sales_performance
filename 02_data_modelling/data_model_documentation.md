# Data Modelling

## Overview

The purpose of this data modelling phase is to understand the structure, grain, keys, attributes, measures, and relationships
within the retail sales datasets before building the analytical model.

## 01_Stores
| Modelling Element | Answer | Reason/ Explanation |
|---|---|---|
| **Grain** | One row represents one individual store | Each row contains information about a specific store |
| **Primary Key** | `Store` | Each store has its own unique identifier |
| **Descriptive Attributes** | `Type`, `Size` | `Type` describes the store category; `Size` describes the physical size of the store |
| **Measures** | None | `Size` is a dimensional attribute because it describes the store rather than recording a business event or transaction |
| **Table Type** | Dimension table | The table describes store characteristics |
| **Proposed Table Name** | `Dim_store` | Follows the dimensional modelling naming convention |
----

## 02_Features

| Modelling Element | Answer | Reason / Explanation |
|---|---|---|
| **Grain** | One row represents the features and conditions recorded for one store on one date | Each record describes the conditions associated with a specific store/date combination |
| **Primary Key** | `store + date` (composite key) | The combination of store and date identifies the feature record for a specific store on a specific date |
| **Descriptive Attributes** | `temperature`, `fuel_price`, `markdown1–markdown5`, `cpi`, `unemployment`, `isholiday` | These fields describe the environmental, economic, promotional, and holiday conditions associated with the store/date observation |
| **Measures / Numeric Features** | `temperature`, `fuel_price`, `markdown1–markdown5`, `cpi`, `unemployment` | These are contextual numeric features rather than the primary sales outcome being measured |
| **Table Type** | Fact table — periodic snapshot | The table records changing conditions for each store over time at the store/date grain |
| **Proposed Table Name** | `fact_features` | Represents the store/date feature observations in the analytical model |
----

## 03_Sales
| Modelling Element | Answer | Reason/ Explanation |
|---|---|---|
| **Grain** | One row represents the weekly sales for one department at one store on one date | Each record represents sales for a specific store, department, and date |
| **Primary Key** | `store + dept + date` (composite key) | These three columns together identify a unique sales record |
| **Descriptive Attributes** | `is_holiday` | Indicates whether the sales week occurred during a holiday period |
| **Measures** | `weekly_sales` | Records the amount of sales generated at the defined grain and can be aggregated for analysis |
| **Table Type** | Fact table | The table records a business activity and contains a measurable business value |
| **Proposed Table Name** | `fact_sales` | Follows the dimensional modelling naming convention |
----

## 04_Data Model
The data model documents the structure and purpose of the three source tables used in the Drivers of Retail Sales Performance project: Stores, Features and Sales.

The Stores table provides descriptive information about each store. Features contains weekly store-level indicators and environmental/economic factors. Sales contains weekly sales performance by department, store and date.

The model identifies the primary and foreign keys and provides the foundation for defining relationships between the tables and creating the ERD.

----

## 05_Data Relationships

The relationships show how the three tables connect to give a complete view of the data.

- `Stores` > `Features`: One-to-Many using Store. One store can have many weekly feature records.
- `Stores `> `Sales`: One-to-Many using Store. One store can have many sales records across departments and weeks.
- `Features` > `Sales`: One-to-Many using Store + Date. One weekly feature record can match many sales records because a store has multiple departments.
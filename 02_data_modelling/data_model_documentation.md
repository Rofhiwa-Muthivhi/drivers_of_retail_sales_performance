# Data Modelling

## Overview

The purpose of this data modelling phase is to understand the structure, grain, keys, attributes, measures, and relationships
within the retail sales datasets before building the analytical model.

## Stores
| Modelling Element | Answer | Reason/ Explanation |
|---|---|---|
| **Grain** | One row represents one individual store | Each row contains information about a specific store |
| **Primary Key** | `Store` | Each store has its own unique identifier |
| **Descriptive Attributes** | `Type`, `Size` | `Type` describes the store category; `Size` describes the physical size of the store |
| **Measures** | None | `Size` is a dimensional attribute because it describes the store rather than recording a business event or transaction |
| **Table Type** | Dimension table | The table describes store characteristics |
| **Proposed Table Name** | `Dim_store` | Follows the dimensional modelling naming convention |

## Sales
| Modelling Element | Answer | Reason/ Explanation |
|---|---|---|

### Objective
Understand the structure of the database and identify relationships between tables.

### Tables Investigated

#### Stores
Contains store-level information:
- Store ID
- Store Type
- Store Size

#### Sales
Contains weekly sales performance:
- Store
- Department
- Date
- Weekly Sales
- Holiday indicator

#### Features
Contains external factors influencing sales:
- Temperature
- Fuel Price
- CPI
- Unemployment
- Markdowns
- Holiday indicators

### Relationships Identified

#### Stores ↔ Sales
Join key:
`store`

Reason:
The stores table contains static store information (type and size) that does not change over time.

#### Features ↔ Sales
Join key:
`store + date`

Reason:
External variables change weekly and therefore require both the store and date to match correctly.

### Key Learning
Understanding relationships between tables is important because joins allow multiple datasets to be combined for business analysis.

Example business questions:
- Do larger stores generate higher sales?
- Do holidays increase sales?
- Does temperature affect weekly sales?
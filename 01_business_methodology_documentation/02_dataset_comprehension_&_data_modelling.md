# Dataset Understanding & Data Modelling

### Data Understanding

The analysis is based on three relational datasets that capture the retailer's sales transactions, store characteristics, and external business factors. Together, these datasets provide the information required to investigate the drivers of retail sales performance.

| Dataset | Records | Purpose |
|----------|--------:|---------|
| Sales | 421,570 | Each row represents transactions across stores and departments. |
| Features | 8,190 | Contains promotional, seasonal, and economic factors. |
| Stores | 45 | Contains descriptive information about each retail store. |


### Data Modelling

To support analysis, the datasets were organised into a simple dimensional model consisting of one Fact Table and two Dimension Tables.

| Table | Classification | Description |
|---------|---------------|-------------|
| **Sales** | Fact Table | Records weekly sales transactions and business metrics. |
| **Stores** | Dimension Table | Describes store characteristics such as type and size. |
| **Features** | Dimension Table | Provides contains information including holidays, promotions, economic factors, and temperature(weather) conditions. |

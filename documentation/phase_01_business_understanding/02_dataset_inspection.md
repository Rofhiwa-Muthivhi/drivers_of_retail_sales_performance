# Dataset Understanding

The three datasets work together to help explain retail sales performance across stores and departments..

## 1. Sales Dataset

### Explains:
**What happened** in terms of weekly sales performance.

This dataset helps us understand how sales performed across different stores and departments over time.

### Key Columns
- Store
- Department (`Dept`)
- Date
- Weekly Sales
- Holiday Indicator (`IsHoliday`)

Sales are recorded weekly across multiple stores and departments, making it possible to analyze sales trends, compare store and department performance, and investigate seasonal changes in sales.

### Business Questions It Can Answer
- Which stores generate the highest sales?
- Which departments perform best?
- How do sales change over time?
- Do holidays influence weekly sales?

### Observations
- Sales are tracked weekly.
- Multiple departments exist across stores.
- Departments are represented numerically (e.g., Department 72).
- Department names are anonymized.

### Limitations
- Department descriptions are not available.
- Product categories are not explicitly provided.


## 2. Features Dataset

### Explains:
**What may have influenced sales performance**

Think of this dataset as:

> **Potential drivers of sales performance**

Without this table, we only know **what happened**.

With this table, we can investigate **why sales performance may have happened**.

### Key Columns
- Temperature
- Fuel Price
- CPI (Consumer Price Index)
- Unemployment
- MarkDown1–5
- Holiday Indicator (`IsHoliday`)

### Understanding
This dataset includes both **internal** and **external** factors that may influence retail sales performance.

#### Internal Factors
- Promotional markdowns
- Holiday periods

#### External Factors
- Inflation (CPI)
- Unemployment
- Fuel prices
- Temperature

### Business Questions It Can Answer
- Do promotions improve sales?
- Do holidays increase sales?
- Does inflation influence weekly sales performance?
- Does unemployment influence weekly sales performance?
- Do fuel prices influence sales activity?

### Key Business Understanding
Fuel prices may influence customer spending behavior.

When fuel prices increase, customers may spend more money on transport and reduce non-essential spending, which may affect retail sales performance.

However, this project will **test whether a relationship exists**, rather than assuming fuel prices directly reduce sales.

### Observations
- MarkDown fields contain missing values.
- Economic indicators are included.
- Holiday periods are available for analysis.

### Limitations
- Exact regional mapping of economic indicators is unclear.
- Economic indicators are attached to store/date observations without a detailed geographic explanation.


## 3. Stores Dataset

### Explains:
**What type of store generated the results**

### Key Columns
- Store
- Type
- Size

### Understanding
This dataset helps explain **what type of store generated the results**.

Store type (`A`, `B`, `C`) likely represents different store classifications. However, the dataset does not define what these categories mean.

Store size appears to represent physical store size and may influence sales potential, as larger stores may have greater inventory capacity and customer traffic.

### Business Questions It Can Answer
- Do larger stores perform better?
- Does store type influence sales performance?

### Observations
- Stores are classified as Type A, B, and C.
- Store sizes vary significantly.
- Larger stores may have greater sales potential.

### Potential Hypothesis
> Larger stores may generate higher weekly sales.

### Limitations
- Store type definitions are not provided.
- Exact store locations are unavailable.


## Overall Dataset Understanding

The three datasets work together to help explain retail sales performance across stores and departments.

### Sales Dataset
Explains:

> **What happened in terms of weekly sales performance**

### Features Dataset
Explains:

> **What may have influenced sales performance**

### Stores Dataset
Explains:

> **What type of store generated the results**

Overall, this project aims to understand how:

- Store characteristics  
- Economic conditions  
- Seasonal effects  
- Promotional activities  

may influence retail sales performance across stores and departments.
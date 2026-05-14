# Dataset Understanding

The project consists of three datasets that together help explain retail sales performance across stores and departments.

---

## 1. Sales Dataset

### Purpose
The sales dataset represents the main business performance data and records weekly retail sales across stores and departments.

### Key Columns
- Store
- Department (`Dept`)
- Date
- Weekly Sales
- Holiday Indicator (`IsHoliday`)

### Understanding
This dataset explains **what happened** in terms of sales performance.

Sales are recorded weekly across multiple stores and departments, making it possible to analyze trends, compare store performance, and investigate seasonal changes.

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

---

## 2. Features Dataset

### Purpose
The features dataset contains factors that may influence retail sales performance.

Think of this dataset as:

> **Potential sales drivers**

Without this table, we only know **what happened**.

With this table, we can investigate **why performance may have happened**.

### Key Columns
- Temperature
- Fuel Price
- CPI (Consumer Price Index)
- Unemployment
- MarkDown1–5
- Holiday Indicator (`IsHoliday`)

### Understanding
This dataset includes both **internal** and **external** factors that may affect retail performance.

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
- Does inflation affect customer spending?
- Does unemployment impact retail performance?
- Do fuel prices influence sales activity?

### Key Business Understanding
Fuel prices may influence customer spending behavior.

When fuel prices increase, customers may spend more money on transport and reduce non-essential spending, which could affect retail sales.

However, this project will **test whether a relationship exists**, rather than assuming fuel prices directly reduce sales.

### Observations
- MarkDown fields contain missing values.
- Economic indicators are included.
- Holiday periods are available for analysis.

### Limitations
- Exact regional mapping of economic indicators is unclear.
- Economic indicators are attached to store/date observations without detailed geographic explanation.

---

## 3. Stores Dataset

### Purpose
The stores dataset contains store-level characteristics.

### Key Columns
- Store
- Type
- Size

### Understanding
This dataset helps explain **what type of store generated the results**.

Store type (`A`, `B`, `C`) likely represents different store classifications. However, the dataset does not define what these categories mean.

Store size appears to represent physical store size and may influence sales potential.

### Business Questions It Can Answer
- Do larger stores perform better?
- Does store type influence sales performance?

### Observations
- Stores are classified as Type A, B, and C.
- Store sizes vary significantly.
- Larger stores may have greater sales potential.

### Potential Hypothesis
> Larger stores generate higher weekly sales.

### Limitations
- Store type definitions are not provided.
- Exact store locations are unavailable.

---

## Overall Dataset Understanding

The three datasets work together to explain retail sales performance.

### Sales Dataset
Explains:

> **What happened?**

### Features Dataset
Explains:

> **What may have influenced performance?**

### Stores Dataset
Explains:

> **What type of store generated the results?**

Overall, this project aims to understand how:

- Store characteristics  
- Economic conditions  
- Seasonal effects  
- Promotional activities  

may influence retail sales performance across stores and departments.
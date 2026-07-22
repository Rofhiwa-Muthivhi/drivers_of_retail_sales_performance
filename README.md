
<p align="center">
  <img src="07_assets/banner.png" alt="Drivers of Retail Sales Performance Banner">
</p>

---

##  **Project Overview** 📖

This project is based on a retail sales dataset that presents a common business challenge faced by small to large retail organizations.

Sales performance varies across stores, departments, but the reasons behind those differences are not immediately clear.

As a data analyst, my role is to investigate the factors that may be driving these changes in sales performance. Using SQL and a structured business analysis approach, I explore how store characteristics, promotional markdowns, seasonal events, and economic conditions may influence weekly retail sales.

Rather than jumping straight into writing SQL queries, this project begins by understanding the business problem, defining the right analytical questions, and developing hypotheses before performing the analysis. The goal is to produce data-driven insights that can support better business decision-making.

---

##  **Business Methodology** 📊
I have followed a structured business analysis approach inspired by McKinsey-style problem solving:

### 1) `Business Understanding` 🧠
This project explores the factors that drive weekly retail sales across 45 stores and multiple departments. I analyzed how store characteristics, promotions, seasonal demand, and economic conditions influence sales performance. Although the dataset is international, I related the insights to South African retailers such as Shoprite, Pick n Pay, Checkers, and Woolworths, where events like Black Friday, Easter, Christmas, and month-end shopping can significantly impact customer spending.


### 2) `Dataset Understanding`  🗂️
The project uses three datasets that collectively explain retail sales performance.

| Dataset | Purpose |
|-----------|-------------------|
| Sales.csv | Explains what happened in terms of weekly sales performance |
|Features.csv |	Explains what may have influenced performance through economic and promotional factor |
|Stores.csv |	Explains store-level characteristics such as type and size |

##### **Key Variables**
* Store Size
* Store Type
* Holidays vs Non-Holidays
* Promotional Markdowns
* Unemployment
* CPI (Consumer Price Index)
* Fuel Price
* Department(Product Category)

##### **Dataset Limitations**
The dataset has a few limitations. Product categories, store locations, and department names are not provided, while store types are only labeled as A, B, and C without further explanation. Because of this, the analysis focuses on identifying sales trends and business patterns based on the available data rather than making assumptions about specific products or stores.


### 3) `Business Problem`  🎯

The retailer wants to understand the key drivers of retail sales performance across stores and departments so that management can improve inventory planning, promotional effectiveness, operational decision-making, and overall sales performance.


### 4) `MECE Framework` 🌳
The business problem: "What drives retail sales performance?" was broken into logical categories to create a structured analytical roadmap.

<p align="center">
  <a href="07_assets/mece_framework.png">
    <img src="07_assets/mece_framework.png" alt="MECE Framework" width="900">
  </a>
</p>


### 5) `Business Questions` ❓
After understanding the business problem and structuring it using the MECE framework, the next step was to identify the key business questions the analysis aims to answer.

| Category | Business Question |
|-----------|-------------------|
| Store Characteristics | Which stores generate the highest weekly sales revenue? |
| Store Characteristics | Do larger stores generate higher weekly sales? |
| Store Characteristics | Does store type (`A`, `B`, `C`) influence sales performance? |
| Seasonal Effects | Do holiday weeks generate higher sales than non-holiday weeks? |
| Seasonal Effects | Are there clear sales patterns across time? |
| Promotions | Do promotional markdowns improve weekly sales? |
| Promotions | Which markdown categories appear to influence sales the most? |
| Economic Conditions | Does unemployment influence retail sales performance? |
| Economic Conditions | Do fuel prices influence retail sales performance? |
| Economic Conditions | Does inflation(CPI) influence retail sales performance? |
| Department Performance | Which departments contributed most to total sales? |


### 6) `Hypotheses` 💡
After defining the business problem and key questions, I developed hypotheses to guide the analysis. Each hypothesis was tested against the data to determine whether it was supported or rejected, helping uncover meaningful business insights.

##### **Example: Hypotheses 1: Larger stores may generate higher weekly sales.**
It is expected that larger stores may generate stronger sales performance because they are likely to have more inventory capacity and serve more customers.
 
➡️ More Hypotheses found in the `01_documentation` folder under subfolder `phase_01_business_understanding`.


### 7) `SQL Analysis` 💻

##### **Data Cleaning** 🧹

<p align="center">
<img src="07_assets/sql_data_cleaning.png" width="900">
</p>


##### **Exploratory Data Analysis** 📈 

<p align="center">
<img src="07_assets/sql_eda.png" width="900">
</p>


##### **Business Queries** 📊

<p align="center">
<img src="07_assets/sql_business_queries.png" width="900">
</p>

➡️ Full SQL scripts are available in the
`02_sql` folder.


### 8) `Repository Structure`  📁
```
drivers_of_retail_sales_performance/
│
├── 01_documentation/
├── 02_sql/
├── 03_datasets/
├── 04_reporting_data/
├── 05_visuals/
├── 06_presentation/
├── 07_assets
└── README.md
```


### 9) `Tools Used` 🛠️

<p align="center">

<img src="https://img.shields.io/badge/SQL-0078D4?style=for-the-badge&logo=microsoftsqlserver&logoColor=white">
<img src="https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white">
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white">
<img src="https://img.shields.io/badge/Draw.io-F08705?style=for-the-badge&logo=diagramsdotnet&logoColor=white">

</p>


### 10) `Business Insights` 📊

!!! here i will write the most important finding after project presentation

---

## **Skills Demonstrated** 🧩

- Business Problem Solving
- Data Cleaning & Transformation
- SQL Analysis
- Exploratory Data Analysis
- Hypothesis Testing
- Business Insight Generation
- Data Storytelling

---

##  Author 👤

**Rofhiwa Muthivhi**

Aspiring Analytics Engineer | Data Analyst

---

## **License & Source** 📄

This project uses a CC0 Public Domain dataset from Kaggle for educational and portfolio purposes.
Dataset Link	https://www.kaggle.com/datasets/manjeetsingh/retaildataset





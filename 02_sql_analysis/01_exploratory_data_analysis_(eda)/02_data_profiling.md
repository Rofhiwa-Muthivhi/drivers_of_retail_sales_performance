### Data Profiling

The data profiling stage was carried out to better understand the structure, distribution, and quality of each dataset before data cleaning. This process helped identify how the data behaves, validate key values, and uncover potential data quality issues that could affect the analysis.

#### Profiling Summary
- The Sales table was profiled by examining unique stores, departments, the available date range,   weekly sales statistics, and the distribution of holiday and non-holiday records. 
- The Stores table was profiled by reviewing the total number of stores, store type categories, store type distribution, and store size statistics. 
- The Features table was profiled by examining the date range, promotional markdown values, holiday distribution, and external business factors such as fuel price, temperature, CPI, and unemployment.

#### Key Findings
The profiling stage confirmed that the datasets were complete enough for analysis and provided a clear understanding of the data available. Weekly sales, store information, store sizes, promotional markdowns, and holiday records were successfully profiled. During this process, Temperature, Fuel_Price, CPI, and Unemployment were identified as VARCHAR data types, preventing summary statistics from being calculated. In addition, the IsHoliday column was represented differently across the datasets, using True/False in the Sales table and 0/1 in the Features table. These observations were recorded for further assessment during the Data Quality Assessment stage.

#### Outcome
The data profiling stage provided a clear understanding of the datasets and highlighted the key data quality issues that required further evaluation before cleaning. The findings from this stage formed the basis for the Data Quality Assessment, where the identified issues were reviewed and prepared for correction before business analysis began.
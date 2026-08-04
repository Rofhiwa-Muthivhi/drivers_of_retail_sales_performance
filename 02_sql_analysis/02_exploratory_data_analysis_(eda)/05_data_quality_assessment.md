### Data Quality Management

The purpose of this section is to assess the quality of the data and determine whether it can be trusted for analysis. At this stage, the focus is on identifying values that do not make business sense or could affect the accuracy of the analysis. Using poor quality data can lead to misleading insights and incorrect business decisions.


#### The documentation covers the following assesments performed:

| Assessment   | Result | Observation |
|:--------------:|:--------:|:-------------|
|1. `Missing Values`| Reviewed | Missing values were assessed in the previous section. The dataset contains **'NA'** values, which have not yet been classified as missing values because they may represent placeholders rather than actual missing data. Their treatment will be determined during the data cleaning stage. |
|2. `Invalid Store IDs`| Reviewed | No invalid store IDs were found. Every store referenced in the Sales table has a corresponding record in the Stores table, confirming referential integrity between the two datasets.       |                   
### Data Quality Management

The purpose of this section is to assess the quality of the data and determine whether it can be trusted for analysis. At this stage, the focus is on identifying values that do not make business sense or could affect the accuracy of the analysis. Using poor quality data can lead to misleading insights and incorrect business decisions.


#### The documentation covers the following assesments performed:

| Assessment   | Result | Observation |
|:--------------:|:--------:|:-------------|
|1. `Missing Values`| Reviewed | Missing values were assessed in the previous section. The dataset contains **'NA'** values, which have not yet been classified as missing values because they may represent placeholders rather than actual missing data. Their treatment will be determined during the data cleaning stage. |
|2. `Invalid Store IDs`| Reviewed | No invalid store IDs were found. Every store referenced in the Sales and Features table has a corresponding record in the Stores table, confirming referential integrity between the two datasets.|
|3. `Negative Weekly Sales`| Reviewed | Negative weekly sales values were identified in the Sales table. Although these records may appear unusual, they could represent normal business activities such as returns or refunds. Further investigation is required before making any changes to the data.|                    
|4. `Store Size Validation`| Reviewed | All stores have valid size values greater than zero. No missing or invalid store size values were identified.|
|5. `Temperature Range Validation`| Reviewed | Temperature values ranged from -7.29°F to 101.95°F, which falls within the expected validation range. No unrealistic or non-numeric temperature values were identified.|
|6. `Fuel Price Validation`| Reviewed | Fuel prices ranged from 2.47 to 4.47, which falls within the expected validation range. No invalid or non-numeric fuel price values were identified.|
|7. `Consumer Price Index(CPI) Validation`| Reviewed | The validation identified 'NA' values in the CPI column. Since the column was imported as NVARCHAR, these values cannot be converted to numeric data types using TRY_CAST(). Their treatment will be completed during the data cleaning stage.|
|8. `Unemployment Validation` | Reviewed | The unemployment values range from 3.684% to 14.313%, which falls within the expected range of 0% to 100%. No unrealistic or invalid values were identified, indicating that the unemployment data is valid and suitable for analysis.|
|9. `Holiday Flag Validation` | Reviewed | The IsHoliday column contains only the expected values of TRUE and FALSE. These values can be successfully converted to binary values (1 for TRUE and 0 for FALSE) during the data cleaning phase. No invalid holiday flag values were identified.|
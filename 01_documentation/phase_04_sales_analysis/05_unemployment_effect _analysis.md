# Unemployment Impact Analysis

## Objective

The purpose of this analysis was to understand how different unemployment levels affected retail sales performance.


## Sales Performance by Unemployment Category

### Analysis

Sales data was joined with economic data from the features table using store and date. Unemployment levels were grouped into three categories:

* Low Unemployment (< 6)
* Moderate Unemployment (6–8)
* High Unemployment (> 8)

Average sales were then compared across the three groups.

### Findings

* Low unemployment periods generated the highest average sales at approximately 17.3K.
* Moderate unemployment periods generated average sales of approximately 16.1K.
* High unemployment periods generated the lowest average sales at approximately 15.6K.
* Average sales decreased as unemployment levels increased.

### Business Insight

The results show that sales performance was strongest when unemployment levels were lower. As unemployment increased, average sales declined, suggesting that economic conditions may influence customer spending patterns.


## Data Quality Review

### Analysis

A review of the unemployment field identified an invalid value (`NA`) which caused the column to be imported as text instead of a numeric data type.

### Findings

* The unemployment column contained a non-numeric value.
* `TRY_CAST()` was used to safely convert valid values into a numeric format.
* This prevented conversion errors during the analysis.

### Business Insight

Identifying and resolving data quality issues helped ensure that the analysis was based on accurate and usable data.


## Overall Conclusion

The analysis showed differences in sales performance across unemployment categories.

### Key Findings

* Low unemployment periods generated the highest average sales.
* High unemployment periods generated the lowest average sales.
* Average sales declined as unemployment levels increased.
* A data quality issue in the unemployment field was identified and successfully addressed.

Overall, the findings suggest that lower unemployment levels are associated with stronger retail sales performance, while higher unemployment levels may contribute to reduced consumer spending.

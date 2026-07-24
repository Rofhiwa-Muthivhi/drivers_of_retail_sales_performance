# CPI Impact Analysis

## Objective

The purpose of this analysis was to evaluate how retail sales performance varies across different CPI levels and determine whether inflation may influence customer spending behavior.


## Sales Performance by CPI Category

### Analysis

Sales data was joined with economic data from the features table using store and date. CPI values were grouped into three categories:

* Low CPI (< 160)
* Moderate CPI (160–200)
* High CPI (> 200)

Average sales were then compared across the three groups.

### Findings

* Low CPI periods generated the highest average sales.
* Average sales declined as CPI levels increased.
* High CPI periods recorded the lowest average sales.
* Transaction activity was present across all CPI categories.

### Business Insight

The results suggest that sales performance was strongest during periods of lower CPI levels. As CPI increased, average sales decreased, indicating that higher prices may influence customer spending patterns.


## Data Quality Review

### Analysis

A review of the CPI field identified an invalid value (`NA`) which caused the column to be imported as text instead of a numeric data type.

### Findings

* The CPI column contained a non-numeric value.
* `TRY_CAST()` was used to safely convert valid values into a numeric format.
* This prevented conversion errors during the analysis.

### Business Insight

Identifying and resolving data quality issues helped ensure that the analysis was based on accurate and reliable data.


## Overall Conclusion

The analysis showed differences in sales performance across CPI categories.

### Key Findings

* Low CPI periods generated the highest average sales.
* High CPI periods generated the lowest average sales.
* Average sales declined as CPI levels increased.
* A data quality issue in the CPI field was identified and successfully addressed.

Overall, the findings suggest that inflation may influence retail sales performance. As CPI levels increased, average sales decreased, indicating that customers may become more cautious with spending when prices rise.

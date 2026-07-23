# Markdown Promotion Impact Analysis

## Objective

The purpose of this analysis was to evaluate whether markdown promotions influenced retail sales performance and determine whether sales were higher during promotional periods.


## Sales Performance by Promotion Status

### Analysis

Sales data was joined with promotional data from the features table using store and date. A promotion flag was created using the markdown fields (`markdown1` to `markdown5`).

Sales records were grouped into two categories:

* Markdown Applied
* No Markdown

Average sales were then compared between the two groups.

### Findings

* Periods with markdown promotions generated higher average sales.
* Periods without markdown promotions recorded lower average sales.
* Sales activity was present in both categories.
* The difference in average sales was positive but relatively small.

### Business Insight

The results suggest that markdown promotions may help improve sales performance. Customers appear to spend slightly more during promotional periods, indicating that discounts and special offers can encourage purchasing activity.


## Promotion Data Review

### Analysis

The markdown fields were reviewed to understand how promotional activity was recorded within the dataset.

### Findings

* Markdown values were stored as promotional amounts.
* Some records contained `NULL` values where no promotion was applied.
* `ISNULL()` was used to replace missing values with zero during the analysis.
* This ensured that promotional and non-promotional periods could be identified correctly.

### Business Insight

Handling missing markdown values helped ensure that promotions were classified accurately, improving the reliability of the analysis.


## Overall Conclusion

The analysis showed differences in sales performance between promotional and non-promotional periods.

### Key Findings

* Markdown periods generated higher average sales than non-markdown periods.
* The improvement in sales performance was relatively small.
* Promotional activity appears to have a positive impact on customer spending.
* Promotional data required minimal preparation before analysis.

Overall, the findings suggest that markdown promotions can support sales growth, although promotions alone may not be the primary factor influencing customer purchasing behavior.

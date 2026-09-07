## Business Questions Analysis



## Store Characteristics
The business questions were used to guide the analysis of the retail sales data. Each question focuses on a specific store characteristic and how it relates to weekly sales performance. 

### 1) How does weekly sales performance vary across individual stores?

I calculated the average weekly sales and total sales for each store. This allows me to compare the sales performance of the individual stores and identify which stores consistently generate higher sales.

### 2) Does store size influence weekly sales performance?

I joined the Stores table with the Sales table using the store identifier. I then compared each store's size with its average weekly sales to investigate whether store size is related to sales performance.

### 3) How does weekly sales performance differ across store types (A, B, and C)?

I joined the Stores table with the Sales table and grouped the results by store type. I calculated the average weekly sales for each type to compare the performance of Type A, B, and C stores.

### 4) Which stores consistently outperform or underperform other stores of the same type?

I compared each store's weekly sales with the average weekly sales of other stores within the same store type. I then calculated how often each store performed above its peer average.

Stores were classified as:
70% or more: Consistently Outperforming
31%–69%: Mixed Performance
30% or less: Consistently Underperforming

`Key Findings:`
The results show that stores within the same type can have very different performance levels. Several Type A and Type B stores consistently performed above their peers, while others consistently performed below them.
For example, Type A Stores 4, 20, 13, 1 and 6 were above their peer average in 100% of the observed weeks. In contrast, several Type A stores, including 34, 32, 40, 8, 26 and 33, were above their peer average in 0% of weeks.
For Type B, Stores 12, 23, 22 and 10 were above their peer average in 100% of weeks, while Stores 21, 45 and 7 consistently underperformed.


### 5) Do holiday weeks generate higher weekly sales than non-holiday weeks?

I combined the Sales and Features tables using store and date. I first calculated the total weekly sales for each store and then used the IsHoliday field to separate holiday weeks from non-holiday weeks. I then calculated the average weekly sales for both groups and compared the results.

`Key Finding:`
Holiday weeks generated average weekly sales of approximately 1,122,887.89, compared with 1,041,256.38 for non-holiday weeks. This means holiday weeks had approximately 7.84% higher average weekly sales.
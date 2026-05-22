## CPI Impact on Sales Performance

### Why I did this analysis
For this analysis, I wanted to understand whether inflation had an effect on retail sales. Since CPI measures changes in prices over time, I wanted to see if higher inflation affected how customers spend.

### What I checked first
Before doing the analysis, I checked the CPI column to make sure the data was clean.

I found an `'NA'` text value in the CPI column. Because of this, the column was imported as text (`varchar`) instead of numeric.

To solve this, I used `TRY_CAST()` to convert the CPI values into numbers so that I could apply comparisons and group the data properly.

### How I approached the analysis
I joined the `sales` table with the `features` table using `store` and `date` so I could compare weekly sales with CPI values.

I then grouped CPI into three categories:

- Low CPI
- Moderate CPI
- High CPI

I used a `CASE` statement to create the categories and calculated:
- Average sales
- Number of transactions

### What I found
The results showed that average sales were highest during low CPI periods.

When CPI increased, average sales became lower, which suggests that inflation may affect customer spending behaviour.

This could mean that when prices increase, customers may spend less or become more careful with spending.

### Conclusion
Based on this analysis, CPI appears to have some influence on retail sales performance. However, this only shows a possible relationship and does not fully prove that inflation directly caused changes in sales.
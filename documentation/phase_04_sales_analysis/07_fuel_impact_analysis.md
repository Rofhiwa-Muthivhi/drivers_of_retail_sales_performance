## Fuel Price Impact on Sales Performance

### Why I did this analysis
For this analysis, I wanted to understand whether fuel prices had an impact on retail sales.

The idea was that when fuel prices increase, customers may spend more money on transport costs and possibly reduce spending in retail stores.

### What I checked first
I checked the `fuel_price` column to make sure the data was clean.

Unlike CPI and unemployment, there were no missing text values such as `'NA'`, meaning the column was already in a usable format for analysis.

### How I approached the analysis
I joined the `sales` table with the `features` table using `store` and `date` to compare weekly sales against fuel price levels.

Fuel prices were grouped into:
- Low Fuel Price
- Moderate Fuel Price
- High Fuel Price

I used a `CASE` statement to create the categories and calculated:
- Average sales
- Transaction count

### What I found
The results showed that average sales were slightly higher during moderate fuel price periods.

High fuel price periods recorded slightly lower sales, but the differences between categories were relatively small.

### Conclusion
Based on the analysis, fuel prices may have had some influence on retail sales, but the relationship does not appear to be very strong.

This suggests that customers may not have changed their spending significantly based on fuel price changes alone.
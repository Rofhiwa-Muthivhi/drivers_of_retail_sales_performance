## Markdown Promotion Impact on Sales Performance

### Why I did this analysis
For this analysis, I wanted to understand whether markdown promotions improved retail sales performance.

The idea was to check if customers spent more when discounts or promotions were applied.

### What I checked first
I checked the markdown columns (`markdown1` to `markdown5`) to understand the data and see whether there were any missing or unusual values.

The columns contained promotion values, and some rows had `NULL` values where no markdown was applied.

To handle this, I used `ISNULL()` to replace missing values with `0` so that the analysis could correctly identify whether a markdown was applied.

### How I approached the analysis
I joined the `sales` table with the `features` table using `store` and `date`.

I then grouped sales into two categories:

- Markdown Applied
- No Markdown

If any markdown value was greater than `0`, it was classified as **Markdown Applied**.

I calculated:
- Average weekly sales
- Transaction count

### What I found
The results showed that average sales were slightly higher during periods where markdown promotions were applied.

This suggests that promotions may have encouraged customers to spend more.

### Conclusion
Based on the analysis, markdown promotions appear to have had a positive effect on retail sales performance.

However, the difference in sales was relatively small, meaning promotions may have helped sales but were not the only factor affecting customer spending.
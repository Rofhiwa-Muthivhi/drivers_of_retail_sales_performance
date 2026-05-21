## Unemployment Impact Analysis

### Objective
Evaluate whether unemployment levels influence retail sales performance.

### Method
- Joined `sales` and `features` tables using `store` and `date`
- Used `TRY_CAST()` to handle invalid unemployment values (`NA`)
- Grouped unemployment into:
  - Low (< 6)
  - Moderate (6–8)
  - High (> 8)

### Key Findings
- Low unemployment periods generated the highest average sales (~17.3K)
- Moderate unemployment periods generated average sales of ~16.1K
- High unemployment periods generated the lowest average sales (~15.6K)

### Business Insight
Retail sales showed a mild negative relationship with unemployment, suggesting consumer spending weakens as labor market conditions worsen.
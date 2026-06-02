## 🧹 Data Cleaning Plan

Before analysis, a data profiling process was conducted to identify data quality issues and determine appropriate cleaning actions.

### Cleaning Decisions

| Issue Identified | Action Taken | Reason |
|------------------|--------------|--------|
| Date column imported as VARCHAR | Converted to DATE datatype | To enable time-based analysis and SQL date functions |
| NA markdown texts | Replaced 'NA' with 0 | Missing markdowns were assumed to indicate no promotional activity |
| Duplicate records | No action required | No duplicate records were identified |
| Outliers | Retained | Extreme values may represent legitimate business events such as holidays or promotions |
| Table joins | Validated relationships | Ensured accurate joins between sales, stores, and features tables |

### Data Quality Summary
- No duplicate records identified  
- Date datatype corrected for analysis  
- Markdown 'NA' text addressed  
- Outliers retained for business realism  
- Table relationships validated prior to analysis
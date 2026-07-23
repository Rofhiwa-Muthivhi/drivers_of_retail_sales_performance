## Issues Encountered

### Issue 01: SQL and Excel Sales Totals Did Not Match

Description:
During the first attempt to start the visualization phase, the Pivot Table results in Excel did not match the SQL analysis results for store performance.

Business Question:
Which store generates the highest weekly sales?

Expected Results
Store 20 should be the highest performing store based on SQL analysis.

Output:
Excel Pivot Table ranks stores differently and shows significantly lower sales totals.

Investigation:
- Verify the exporting process.
- Verify join conditions.
- Verify row counts.
- Verify excel data types

## Action Taken:

I used the 2 excel functions on the `Weekly_sales` Column to check how excel is recognizing the values.
- `COUNT(D:D)` to only count numerical cells and the output was = 29,594.
- `COUNTA(D:D)` to count everything that is not empty and the output was 421,571
- This means 421,571(Total cells in weekly_sales column) - 29,594(Total cells in weekly_sales column counted as numerical) = 391,977(cells in weekly_sales that are not being recognized as numerical)



After the above mentioned findings i re-imported the dataset and used Power Query, most numeric columns (temperature, fuel_price, cpi, and unemployment) were imported as text due to a mismatch between the dataset's decimal separator (.) and the system's regional settings (,). This caused data type conversion errors. The issue was resolved by manually assigning the correct data types and identifying the standard decimal separators. All 16 columns were validated and converted appropriately before loading the final reporting dataset into Excel.

Validation:

* No conversion errors remained.
* Temperature converted successfully to Decimal Number.
* Fuel Price converted successfully to Decimal Number.
* CPI converted successfully to Decimal Number.
* Unemployment converted successfully to Decimal Number.
* Final dataset loaded successfully into Excel for Pivot Table analysis.

Lessons Learned:
Check data types and decimal formats when importing CSV files into Power Query, as incorrect formats can cause conversion errors.


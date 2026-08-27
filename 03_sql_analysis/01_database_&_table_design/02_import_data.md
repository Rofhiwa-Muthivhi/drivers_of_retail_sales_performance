### Importing Raw Datasets

- After creating the retail_analysis database, I imported the raw datasets into SQL Server using the Import Flat File Wizard. Since the original Excel workbook could not be imported directly, I first converted each worksheet into a separate CSV file while keeping the original data unchanged. Each dataset was then imported as its own table (Sales, Stores, and Features).

- During the import process, I intentionally kept the data in its raw form instead of assigning final data types. Most columns were imported as NVARCHAR(50), preserving the original dataset exactly as received.
Reviewing the Imported Table Structures

After importing the Sales, Stores, and Features datasets into SQL Server, I generated the table creation scripts to review how SQL Server interpreted each imported dataset. This allowed me to inspect the automatically assigned column names, data types, and table structure before making any modifications.

To generate each script, I refreshed the database, right-clicked the imported table, selected Script Table As  > CREATE To > New Query Editor Window. SQL Server then produced the CREATE TABLE statement representing the imported table.

I use these scripts for documentation and reference purposes. It provides a snapshot of how the tables could be created manually. While manually creating tables is practical for small datasets, it becomes inefficient and time-consuming when working with large datasets like this ones. In this project, I relied on SQL Server's import process to generate the tables structures, which I can later review, refine, and optimize during the data cleaning phases.
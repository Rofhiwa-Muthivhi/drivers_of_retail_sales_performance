# 4. ISHOLIDAY INDICATOR CLEANING

## Issue

The isholiday column was stored as VARCHAR and contained text values:

- TRUE
- FALSE

Since this is a yes/no field, storing it as text was not ideal for analysis.

## Cleaning

- Checked that TRUE and FALSE values could be converted safely.
- Converted TRUE to 1.
- Converted FALSE to 0.
- Changed the datatype from VARCHAR to BIT.

## Outcome

The isholiday column can now be used for:

- holiday vs non-holiday sales analysis
- filtering and grouping
- comparing sales performance during holiday periods
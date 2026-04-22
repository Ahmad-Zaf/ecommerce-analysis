# E-Commerce Sales Analysis

Analysis of 100,000+ real orders from the Olist Brazilian e-commerce platform.

## Tools Used
SQL Server Management Studio (SSMS), Python, Pandas, Matplotlib, Seaborn

## Workflow
CSV → Excel (explore) → SSMS SQL Server (clean + query) → Python EDA & RFM → PowerBI & Tableau Public 

## Key Findings
- Revenue peaks in November–December
- Delivery delays over 5 days significantly reduce review scores
- 60%+ of customers never returned after their first order
- São Paulo and Rio de Janeiro account for 50%+ of revenue

## How to Run
1. pip install -r requirements.txt
2. Import Olist CSVs into SQL Server as EcommerceDB (see guide)
3. Update SERVER name in notebooks and app.py if needed
4. Run notebooks in order: 01_eda → 02_rfm
5. cd dashboard && python app.py

## SQL Queries
All 8 SQL queries are saved in the /sql folder

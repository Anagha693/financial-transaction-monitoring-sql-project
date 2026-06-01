# Financial Transaction Monitoring & Fraud Detection using SQL

## Project Overview

This project focuses on analyzing banking transaction data using SQL to identify suspicious financial activity, repeated transaction patterns, linked account movements, and high-value fund transfers.

The project simulates real-world financial forensic analysis and anti-money laundering (AML) investigation techniques using SQL queries, joins, Common Table Expressions (CTEs), and advanced window functions.

The analysis was performed on a consolidated banking transactions dataset containing deposits, withdrawals, fund transfers, transaction narrations, and account balances across multiple accounts.

---

## Business Problem

Financial institutions process millions of transactions daily, making it difficult to manually identify suspicious financial activity.

The objective of this project is to:
- analyze transaction behavior,
- identify abnormal fund movement,
- detect repeated structured transactions,
- uncover linked account activity,
- and simulate fraud monitoring using SQL-based analytics.

---

## Project Objectives

- Analyze transaction patterns across multiple bank accounts
- Detect suspicious high-value transactions
- Identify repeated and structured fund transfers
- Track linked debit-credit movement between accounts
- Monitor monthly transaction flow trends
- Apply advanced SQL concepts for forensic-style analysis

---

## Dataset Information

The dataset contains banking transaction records with the following attributes:

| Column Name | Description |
|---|---|
| account_no | Unique bank account number |
| transaction_date | Date of transaction |
| transaction_details | Transaction narration/details |
| withdrawal_amt | Amount withdrawn |
| deposit_amt | Amount deposited |
| balance_amt | Account balance after transaction |
| transaction_category | Categorized transaction type |
| transaction_year | Year extracted from transaction date |
| transaction_month | Month extracted from transaction date |

Dataset Source: Kaggle Banking Transactions Dataset

---

# SQL Concepts & Techniques Used

## Basic SQL
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- Aggregate Functions

## Intermediate SQL
- JOINS
- Self Joins
- Subqueries
- Common Table Expressions (CTEs)

## Advanced SQL
- Window Functions
- RANK()
- ROW_NUMBER()
- DENSE_RANK()
- LAG()
- Running Totals

---

# Project Structure

```text
financial-transaction-monitoring-sql-project/
│
├── data/
│   └── cleaned_bank_transactions.csv
│
├── notebooks/
│   └── financial_transaction_analysis.ipynb
│
├── sql_queries/
│   ├── 01_basic_analysis.sql
│   └── 02_advanced_analysis.sql
│
├── screenshots/
│
├── insights/
│   └── key_findings.md
│
└── README.md
```

---

# Analysis Performed

## 1. Transaction Volume Analysis
Identified accounts with the highest transaction activity and transaction concentration.

---

## 2. Deposit vs Withdrawal Analysis
Compared total inflow and outflow across accounts to detect rapid fund circulation patterns.

---

## 3. Transaction Category Analysis
Analyzed distribution of transaction types including:
- NEFT
- RTGS
- IMPS
- Cash
- Fund Transfers
- ATM/NFS

---

## 4. Monthly Transaction Trend Analysis
Tracked monthly transaction movement trends to identify unusual activity spikes and behavioral changes over time.

---

## 5. High-Value Transaction Detection
Detected unusually large transactions exceeding defined thresholds.

---

## 6. Repeated Transaction Analysis
Identified repetitive same-day transactions with identical amounts, indicating possible batching or structured transfer behavior.

---

## 7. Linked Fund Movement Detection
Used self joins to identify matching debit-credit transactions across different accounts occurring on the same dates and amounts.

---

## 8. Ranking Analysis Using Window Functions
Applied ranking functions to identify top withdrawals and prioritize high-value transaction monitoring.

---

## 9. Running Transaction Flow Analysis
Calculated cumulative fund movement over time using running totals and window functions.

---

## 10. Sudden Transaction Spike Detection
Used LAG() functions to compare current and previous transaction behavior to detect anomalies and unusual spikes.

---

# Key Insights & Findings

## Transaction Concentration
A small number of accounts dominated total transaction activity, indicating concentrated financial movement behavior.

---

## High Fund Circulation
Major accounts processed extremely large deposit and withdrawal volumes with nearly matching inflow and outflow values, suggesting continuous movement of funds rather than balance accumulation.

---

## Repeated High-Value Transfers
Multiple repeated transactions involving fixed round figures such as:
- 5 Million
- 10 Million
- 15 Million

were detected across multiple accounts and dates.

---

## Linked Account Activity
Matching debit-credit transactions between accounts revealed potential routing chains and linked fund movement patterns.

---

## Monthly Activity Spikes
Significant spikes in transaction activity were observed during 2015–2016, followed by gradual decline in later years.

---

## Structured Transaction Behavior
Repeated same-day fixed-value transactions indicated possible:
- batching behavior
- automated processing
- structured transaction movement

---

# Tools & Technologies Used

- MySQL
- MySQL Workbench
- Kaggle Dataset
- SQL Window Functions
- CTEs & Advanced Querying

---

# Future Improvements

- Build Power BI dashboard for visualization
- Add machine learning anomaly detection
- Create automated fraud alert system
- Implement transaction network graph analysis

---

# Conclusion

This project demonstrates how SQL can be applied beyond basic querying to perform:
- financial transaction analysis,
- fraud detection,
- suspicious activity monitoring,
- and forensic-style banking investigation.

Advanced SQL concepts such as:
- CTEs,
- Window Functions,
- Ranking Functions,
- Self Joins,
- Running Totals,
- and LAG Analysis

were successfully used to analyze real-world banking transaction data and uncover suspicious financial patterns.

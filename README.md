# Dividend Yield & Payout Trend Analysis

## 📌 Project Overview

**Dividend Yield & Payout Trend Analysis** is an end-to-end Data Analytics project focused on analyzing historical dividend, stock-price, valuation, and market-related data across multiple companies.

### Project Workflow

**Raw Dataset → Python/Pandas → Data Cleaning & EDA → Clean Dataset → MySQL → SQL Analysis → Python-MySQL Connection → Power BI Dashboard**

---

## 🎯 Business Objective

The main objective is to analyze:

- Dividend trends over time
- Total dividend paid by companies
- Dividend distribution across sectors
- Top companies by total dividend
- Average dividend yield
- Average Earnings Per Share (EPS)
- Average Market Capitalization
- Average P/E Ratio
- Average Beta
- Historical yearly dividend patterns

The analysis converts raw financial data into structured SQL analysis and an interactive Power BI dashboard.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data cleaning, preprocessing and EDA |
| Pandas | Data manipulation and cleaning |
| NumPy | Numerical operations |
| Jupyter Notebook | Data analysis |
| MySQL | Database storage and SQL analysis |
| SQL | Filtering, aggregation and analytical queries |
| Power BI | Interactive dashboard and visualization |
| Git & GitHub | Version control and documentation |

---

## 📂 Project Files

```text
Dividend-Yield-Payout-Trend-Analysis/
│
├── Dividend_Yield_Analysis.ipynb
├── Dividend_Yield_Analysis.sql
├── python_sql_connection.py
├── dividend_analysis_clean.zip
├── PAGE 1.png
├── PAGE 2.png
└── README.md
```

### File Description

- **Dividend_Yield_Analysis.ipynb** — Python data cleaning, preprocessing and exploratory analysis.
- **Dividend_Yield_Analysis.sql** — SQL queries used for database analysis.
- **python_sql_connection.py** — Python-to-MySQL database connection and data retrieval.
- **dividend_analysis_clean.zip** — Cleaned dataset used for analysis.
- **PAGE 1.png / PAGE 2.png** — Power BI dashboard screenshots.

---

## 🔄 Project Workflow

### 1. Data Collection

The dataset contains historical financial and market information such as:

- Date
- Ticker
- Company Name
- Sector
- Open
- High
- Low
- Close
- Dividend
- Dividend Yield
- EPS
- Beta
- Market Capitalization
- P/E Ratio
- Price-to-Book
- 52-Week High
- 52-Week Low
- Volume
- Moving averages and other financial indicators

### 2. Data Cleaning Using Python

Python and Pandas were used to:

- Inspect the dataset
- Check rows, columns and data types
- Identify missing values
- Identify duplicate records
- Convert the Date field into the correct format
- Create a Year column
- Validate numerical fields
- Review data quality
- Save the cleaned dataset separately

### 3. Exploratory Data Analysis

EDA was performed to understand:

- Company distribution
- Sector distribution
- Dividend patterns
- Dividend yield
- EPS
- P/E ratio
- Beta
- Market capitalization
- Yearly dividend trends

### 4. MySQL Database

The cleaned dataset was loaded into MySQL.

SQL analysis included:

- Company-level analysis
- Sector-level analysis
- Yearly aggregation
- Dividend calculations
- Unique company counts
- Company ranking
- Financial metric comparisons
- `GROUP BY`
- `HAVING`
- CTEs
- Window functions

### 5. Python-MySQL Connection

Python was connected to MySQL to retrieve database records into Pandas for analysis.

> **Security:** Never upload real database passwords, API keys or credentials to GitHub. Replace local credentials with placeholders or environment variables before committing.

---

## 📊 Power BI Dashboard

The Power BI dashboard contains KPI cards, trend analysis, company comparisons, sector analysis and interactive filtering.

### KPI Cards

- Total Companies
- Total Dividend Paid
- Average Dividend Yield
- Average Earnings Per Share
- Average Market Capitalization
- Average P/E Ratio
- Average Beta

### Visualizations

- Yearly Dividend Trend
- Top 10 Companies by Total Dividend
- Total Dividend by Sector
- Dividend Distribution by Sector

### Interactive Slicers

The dashboard can be filtered using fields such as:

- Year
- Sector
- Company
- Ticker

---

## 📸 Dashboard Preview

### Power BI Dashboard – Page 1

![Power BI Dashboard Page 1](PAGE%201.png)

### Power BI Dashboard – Page 2

![Power BI Dashboard Page 2](PAGE%202.png)

---

## 📈 Financial Concepts

### Dividend

A dividend is a distribution of part of a company's earnings to its shareholders.

### Dividend Yield

Dividend yield expresses the annual dividend relative to the stock price.

```text
Dividend Yield =
Annual Dividend per Share / Share Price × 100
```

### EPS

**Earnings Per Share (EPS)** represents earnings attributable to each outstanding share.

### P/E Ratio

The Price-to-Earnings ratio compares market price per share with earnings per share.

```text
P/E Ratio =
Market Price per Share / EPS
```

### Beta

Beta measures the historical sensitivity of a stock's returns to movements in the broader market.

### MA50 and MA200

- **MA50** = 50-period moving average
- **MA200** = 200-period moving average

Moving averages help smooth price fluctuations and analyze different time horizons.

---

## 🔍 Analytical Questions

The project addresses questions such as:

1. How has total dividend changed over the years?
2. Which companies paid the highest total dividends?
3. Which sectors contribute the most to total dividends?
4. What is the average dividend yield?
5. What is the average EPS?
6. What is the average market capitalization?
7. What is the average P/E ratio?
8. What is the average beta?
9. How is dividend distributed across sectors?
10. How do results change when users filter by year, sector or company?

---

## 🧠 Key Learnings

This project provided practical experience in:

- Data cleaning with Python and Pandas
- Exploratory Data Analysis
- Handling missing and duplicate data
- Financial dataset analysis
- SQL querying and aggregation
- MySQL database integration
- Python-MySQL connectivity
- Power BI dashboard development
- KPI creation
- Data visualization
- Interactive slicers and filtering
- End-to-end analytics workflow

---

## 🚀 Future Improvements

- Automated data ingestion
- Automated database refresh
- Scheduled Power BI refresh
- Year-over-year dividend growth analysis
- Company drill-through pages
- Additional financial KPIs
- Advanced time-series analysis
- Automated data-quality validation

---

## 👩‍💻 Author

**Shraddha Gobare**

Data Analytics | Python | SQL | MySQL | Power BI | Data Visualization

---

## ⭐ End-to-End Workflow

```text
Raw Financial Dataset
        ↓
Python + Pandas
        ↓
Data Cleaning & EDA
        ↓
Clean Dataset
        ↓
MySQL Database
        ↓
SQL Analysis
        ↓
Python-MySQL Connectivity
        ↓
Power BI
        ↓
Interactive Financial Dashboard
```

---

## 📌 Disclaimer

This project is intended for **data analytics and educational purposes**. The financial analysis presented in the dashboard should not be interpreted as investment advice or a recommendation to buy or sell any security.

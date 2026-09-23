CREATE DATABASE dividend_analysiss;
USE dividend_analysiss;

SELECT COUNT(*) FROM nifty;

-- 287310


-- =====================================================
-- 1. Total number of companies
-- =====================================================

SELECT COUNT(DISTINCT Company_Name) AS Total_Companies
FROM nifty;


-- =====================================================
-- 2. Companies by sector
-- =====================================================

SELECT
    Sector,
    COUNT(DISTINCT Company_Name) AS Number_of_Companies
FROM nifty
GROUP BY Sector
ORDER BY Number_of_Companies DESC;


-- =====================================================
-- 3. Total dividend recorded
-- =====================================================

SELECT
    ROUND(SUM(Dividend), 2) AS Total_Dividend
FROM nifty;


-- =====================================================
-- 4. Number of dividend-paying records
-- =====================================================

SELECT
    COUNT(*) AS Dividend_Paying_Records
FROM nifty
WHERE Dividend > 0;


-- =====================================================
-- 5. Total dividend by year
-- =====================================================

SELECT
    YEAR(Date) AS Year,
    ROUND(SUM(Dividend), 2) AS Total_Dividend
FROM nifty
GROUP BY YEAR(Date)
ORDER BY Year;


-- Company-wise dividend analysis

-- =====================================================
-- 6. Total dividend by company
-- =====================================================

SELECT
    Company_Name,
    Ticker,
    ROUND(SUM(Dividend), 2) AS Total_Dividend
FROM nifty
GROUP BY Company_Name, Ticker
ORDER BY Total_Dividend DESC;

-- =====================================================
-- 7. Average dividend yield by company
-- =====================================================

SELECT
    Company_Name,
    Ticker,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield
FROM nifty
WHERE Dividend_Yield IS NOT NULL
GROUP BY Company_Name, Ticker
ORDER BY Avg_Dividend_Yield DESC;


-- Sector analysis
-- =====================================================
-- 8. Dividend by sector
-- =====================================================

SELECT
    Sector,
    ROUND(SUM(Dividend), 2) AS Total_Dividend,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield
FROM nifty
GROUP BY Sector
ORDER BY Total_Dividend DESC;


-- Top 10 companies
-- =====================================================
-- 9. Top 10 companies by total dividend
-- =====================================================

SELECT
    Company_Name,
    ROUND(SUM(Dividend), 2) AS Total_Dividend
FROM nifty
GROUP BY Company_Name
ORDER BY Total_Dividend DESC
LIMIT 10;


-- CTE: Yearly Dividend Analysis
-- =====================================================
-- 10. CTE - Yearly Dividend Analysis
 -- The WITH yearly_dividend AS (...) creates a temporary result called yearly_dividend. 
-- then retrieves that result. 
-- =====================================================

WITH yearly_dividend AS (
    SELECT
        YEAR(Date) AS Year,
        ROUND(SUM(Dividend), 2) AS Total_Dividend
    FROM nifty
    GROUP BY YEAR(Date)
)
SELECT *
FROM yearly_dividend
ORDER BY Year;


-- Window Function: Year-over-Year Growth
-- =====================================================
-- 11. Year-over-Year Dividend Growth

-- LAG(Total_Dividend)
-- gets the previous year's dividend.
-- So SQL can calculate:
-- Current Year - Previous Year
-- ----------------------------- × 100
--       Previous Year
-- This is the SQL equivalent of the .pct_change() you used in Pandas.

-- =====================================================

WITH yearly_dividend AS (
    SELECT
        YEAR(Date) AS Year,
        SUM(Dividend) AS Total_Dividend
    FROM nifty
    GROUP BY YEAR(Date)
)
SELECT
    Year,
    ROUND(Total_Dividend, 2) AS Total_Dividend,
    ROUND(
        (
            Total_Dividend -
            LAG(Total_Dividend) OVER (ORDER BY Year)
        )
        /
        NULLIF(LAG(Total_Dividend) OVER (ORDER BY Year), 0)
        * 100,
        2
    ) AS Dividend_Growth_Percent
FROM yearly_dividend
ORDER BY Year;



-- Rank Companies by Dividend
-- =====================================================
-- 12. Rank Companies by Total Dividend
-- The actual companies/ranks will come from your dataset.
-- =====================================================

WITH company_dividend AS (
    SELECT
        Company_Name,
        Ticker,
        SUM(Dividend) AS Total_Dividend
    FROM nifty
    GROUP BY Company_Name, Ticker
)
SELECT
    Company_Name,
    Ticker,
    ROUND(Total_Dividend, 2) AS Total_Dividend,
    DENSE_RANK() OVER (
        ORDER BY Total_Dividend DESC
    ) AS Dividend_Rank
FROM company_dividend
ORDER BY Dividend_Rank;



-- Sector-wise Ranking
-- =====================================================
-- 13. Rank Companies Within Each Sector
-- Here PARTITION BY Sector means:
-- SQL creates a separate ranking inside each sector.
-- =====================================================

WITH company_dividend AS (
    SELECT
        Company_Name,
        Ticker,
        Sector,
        SUM(Dividend) AS Total_Dividend
    FROM nifty
    GROUP BY Company_Name, Ticker, Sector
)
SELECT
    Company_Name,
    Ticker,
    Sector,
    ROUND(Total_Dividend, 2) AS Total_Dividend,
    DENSE_RANK() OVER (
        PARTITION BY Sector
        ORDER BY Total_Dividend DESC
    ) AS Sector_Rank
FROM company_dividend
ORDER BY Sector, Sector_Rank;



-- Dividend Yield by Year
-- =====================================================
-- 14. Average Dividend Yield by Year
-- =====================================================

SELECT
    YEAR(Date) AS Year,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield
FROM nifty
WHERE Dividend_Yield IS NOT NULL
GROUP BY YEAR(Date)
ORDER BY Year;



-- Latest Year Company Analysis
-- =====================================================
-- 15. Company Dividend Analysis for Latest Year
-- =====================================================

SELECT
    Company_Name,
    Ticker,
    Sector,
    ROUND(SUM(Dividend), 2) AS Total_Dividend,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield,
    ROUND(AVG(EPS), 2) AS Avg_EPS,
    ROUND(AVG(Close), 2) AS Avg_Close
FROM nifty
WHERE YEAR(Date) = (
    SELECT MAX(YEAR(Date))
    FROM nifty
)
GROUP BY Company_Name, Ticker, Sector
ORDER BY Total_Dividend DESC;



-- Dividend Events by Year
-- This tells us how many dividend records occurred each year.
-- =====================================================
-- 16. Dividend Events by Year
-- =====================================================

SELECT
    YEAR(Date) AS Year,
    COUNT(*) AS Dividend_Events
FROM nifty
WHERE Dividend > 0
GROUP BY YEAR(Date)
ORDER BY Year;

-- Companies That Paid Dividends
-- =====================================================
-- 17. Dividend-Paying Companies
-- =====================================================

SELECT
    Company_Name,
    Ticker,
    Sector,
    ROUND(SUM(Dividend), 2) AS Total_Dividend,
    COUNT(CASE WHEN Dividend > 0 THEN 1 END) AS Dividend_Events
FROM nifty
GROUP BY Company_Name, Ticker, Sector
HAVING SUM(Dividend) > 0
ORDER BY Total_Dividend DESC;

-- Average EPS and Dividend by Sector
-- =====================================================
-- 18. Sector Financial Performance
-- =====================================================

SELECT
    Sector,
    ROUND(AVG(EPS), 2) AS Avg_EPS,
    ROUND(SUM(Dividend), 2) AS Total_Dividend,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield
FROM nifty
GROUP BY Sector
ORDER BY Total_Dividend DESC;


-- Top Dividend Yield Companies
-- =====================================================
-- 19. Top 10 Companies by Average Dividend Yield
-- =====================================================

SELECT
    Company_Name,
    Ticker,
    Sector,
    ROUND(AVG(Dividend_Yield), 2) AS Avg_Dividend_Yield
FROM nifty
WHERE Dividend_Yield IS NOT NULL
GROUP BY Company_Name, Ticker, Sector
ORDER BY Avg_Dividend_Yield DESC
LIMIT 10;

-- =====================================================
-- END OF DIVIDEND ANALYSIS SQL PROJECT
-- =====================================================
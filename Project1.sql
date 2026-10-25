CREATE DATABASE sales_project;
USE sales_project;
SHOW TABLES;
DESCRIBE cleaned_sales;
SELECT
    SUM(`Units Sold` IS NULL) AS missing_units,
    SUM(Date IS NULL) AS missing_dates,
    SUM(Sales IS NULL) AS missing_sales,
    SUM(Profit IS NULL) AS missing_profit
FROM cleaned_sales;
SELECT *
FROM cleaned_sales
WHERE Sales < 0
   OR `Units Sold` < 0;
SELECT*
FROM cleaned_sales
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM cleaned_sales;
SELECT
    MIN(Date) AS first_order_date,
    MAX(Date) AS last_order_date
FROM cleaned_sales;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT Product) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Sales), 2) AS average_line_sales
FROM cleaned_sales;
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM cleaned_sales
GROUP BY Product
ORDER BY total_sales DESC;
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM cleaned_sales
GROUP BY Product
ORDER BY total_sales DESC
LIMIT 5;
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM cleaned_sales
GROUP BY
    YEAR(Date),
    MONTH(Date)
ORDER BY
    sales_year,
    sales_month;
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_spending,
    COUNT(DISTINCT `Units Sold`) AS total_orders
FROM cleaned_sales
GROUP BY Product
ORDER BY total_spending DESC
LIMIT 10;
SELECT
    Product,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM cleaned_sales
GROUP BY Product
ORDER BY profit_margin_pct DESC;
SELECT
    Product,
    SUM(Sales) AS total_sales,
    CASE
        WHEN SUM(Sales) >= 800000 THEN 'High Sales'
        WHEN SUM(Sales) >= 50000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_level
FROM cleaned_sales
GROUP BY Product
ORDER BY total_sales DESC;
SELECT
    Country,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT `Units Sold`) AS total_orders
FROM cleaned_sales
GROUP BY Country
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    YEAR(Date) AS sales_year,
    ROUND(SUM(Sales), 2) AS yearly_sales,
    ROUND(SUM(Profit), 2) AS yearly_profit
FROM cleaned_sales
GROUP BY YEAR(Date)
ORDER BY sales_year;

Retail Sales Analysis using SQL
Project Overview
This project focuses on analyzing retail sales data using MySQL.
The goal is to extract meaningful insights such as sales trends, monthly performance, and customer behavior using SQL queries.
________________________________________
 Tools & Technologies
•	MySQL
•	VS Code
•	Database Client / MySQL Extension
•	Excel (CSV format)
________________________________________
Database & Table Creation
Create Database
CREATE DATABASE sales_db;
USE sales_db;

Create Table
CREATE TABLE sales_project (
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantiy INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);

📥 Data Import (CSV to MySQL)
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/csv/sales.csv'
INTO TABLE sales_project
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
________________________________________

Key Insights

Identified top-performing months per year

Analyzed category-wise sales contribution

Observed customer demographics and trends

Calculated average and total sales metrics
________________________________________
Conclusion

This project demonstrates how SQL can be effectively used to:

Structure raw data

Perform aggregations and ranking

Generate business insights from retail sales data
________________________________________
Future Improvements

Add profit calculations

Create views and stored procedures

Integrate with visualization tools (Power BI / Tableau)


Automate data loading process

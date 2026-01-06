# 🛒 Retail Sales Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing retail sales data using **MySQL**.  
The goal is to extract meaningful insights such as sales trends, monthly performance, and customer behavior using **SQL queries**.

---

## 🧰 Tools & Technologies
- MySQL
- VS Code
- Database Client / MySQL Extension
- Excel (CSV format)

---

## 🏗 Database & Table Creation

### Create Database
```sql
CREATE DATABASE sales_db;
USE sales_db;

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
# Key Insights

- **Identified top-performing months per year**
- **Analyzed category-wise sales contribution**
- **Observed customer demographics and trends**
- **Calculated average and total sales metrics**

# Conclusion

This project demonstrates how SQL can be effectively used to:

- **Structure raw data**
- **Perform aggregations and ranking**
- **Generate business insights from retail sales data**


CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    create_time DATETIME COMMENT 'Create Time',
    name VARCHAR(255)
) COMMENT '';

CREATE DATABASE sql_project_p2;
-- Uploading Database
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

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/mruna/Documents/SQL Project/SQL-Retail Project.csv'
INTO TABLE sales_project
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from sales_project;

--Data Cleaning   ** Null Check **

select * from sales_project
where 
    transactions_id is null 
    OR 
    customer_id is null 
    or 
    sale_date is null
    or 
    age is null 
    OR
    category is null 
    or
    quantiy is null
    or 
    price_per_unit is null
    OR
    cogs is null
    or
    total_sale is null
    or
  

    price_per_unit is null
    OR
    total_sale is null;


select * from sales_project
where transactions_id=679;

-- Data Exploration

-- # of Sales and # of Customers

select COUNT(*) as total_sales from sales_project

select COUNT(DISTINCT(customer_id)) as customers from sales_project

select DISTINCT(category) from sales_project 

-- Data Analysis 

--1. Retrieve all sales done monthly and category wise total quantity sold and price

select 
    MONTH(sale_date) as Months, 
    category, 
    sum(quantiy) as Total_quantity,
    sum(price_per_unit) as Total_price 
from 
    sales_project
group by 
    Months,category

--2. Average age of customer who purschased items from the each category

select round(avg(age),0),category from sales_project 
group by category

-- 3. Total_sales is greater than 1000

select *  from sales_project
where total_sale>1000

-- 4. Total transaction made by each gender in each category

select 
   category,gender, count(*)
    from 
        sales_project
        GROUP BY category,gender

-- 5. Calculate the average sale for each month. Find out the best selling month in each year COMMENT
select 
    YEAR(sale_date) as Years,
    MONTH(sale_date) as Months,
   round( avg(total_sale),2)
from sales_project
    group by Years,Months
    order by Years,months

--6. Find the Best Selling Month
select * from (
select 
    YEAR(sale_date) as Years,
    MONTH(sale_date) as Months,
  
   ROW_NUMBER() OVER(PARTITION BY YEAR(sale_date) ORDER BY  avg(total_sale) DESC) as rownum,
     avg(total_sale) as Average_sale
from sales_project
 group by Years,Months
 )as table1 where rownum=1;

--6. SQL query to top 5 customers based on highest total sales


select * from (
select 
    customer_id,
    sum(total_sale) as Total_sale,
    rank() OVER() as toprank
 from 
sales_project
group by customer_id
order by Total_sale desc
)as table1 
where toprank <6

-- Demonstrating simpler approac

SELECT
 customer_id,
 sum(total_sale) as totalsale
 FROM
 sales_project
 group by 1
 order by 2 desc
 limit 5

 --7. Find the number of unique customers who purchased items from each category

 select 
    COUNT(DISTINCT(customer_id)) as countofunicustomer,
    category
from 
    sales_project
        group by category

-- 10. Create each shift and # of orders ( Morning <=12, Afternoon between 12 & 17,Evening > 17)


select * from sales_project;


-- 

with hourly_sale
AS
(
SELECT *,
    CASE 
        WHEN HOUR(sale_time)<=12 THEN 'Morning'
        when HOUR(sale_time)>12 and HOUR(sale_time)<17  THEN ' Afternoon'
        else 'Evening'
    END as Shift

 from sales_project
)
select 
count(*) as total_orders,
shift from hourly_sale
group by shift
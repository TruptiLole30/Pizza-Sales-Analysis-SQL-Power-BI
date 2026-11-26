create database Pizza_DB;
use Pizza_DB;

select * from pizza_sales;
-- 1. Total Revenue:
select sum(Total_price) as Total_Revenue from pizza_sales;

-- 2. Average Order Value
select (sum(total_price)/count(distinct order_id)) as Avg_order_Value from pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- 4.Total Order Placed
select count(distinct order_id) Total_Orders from pizza_sales;

-- 5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

-- Charts Visuals
-- B. Daily Trend for Total Orders

select dayname(order_date) as Order_Day,
count(distinct order_id) as Total_Ordes
from pizza_sales
group by dayname(order_date); 

-- C. Monthly Trend for Orders
select monthname(order_date) as Order_Month,
count(distinct order_id) as Total_Orders
from pizza_sales
group by monthname(order_date) 
order by Total_orders Desc;

-- D. % of Sales by Pizza Category
select pizza_category,sum(total_price) as Total_Revenue , round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2)as percentage
from pizza_sales 
group by pizza_category;

-- E. % of Sales by Pizza Size
select pizza_size,round(sum(Total_price),2) as Total_Revenue,round(sum(Total_price)* 100 / (select sum(Total_price) from pizza_sales ),2) as Percentage
from pizza_sales 
group by pizza_size
order by pizza_size desc;

-- F. Total Pizzas Sold by Pizza Category
select pizza_category,sum(quantity) as Total_Quantity_Sold 
from pizza_sales
where month(order_date)=2
group by pizza_category
order by Total_Quantity_Sold Desc;

-- G. Top 5 Pizzas by Revenue
select pizza_name,sum(Total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;
-- H. Bottom 5 Pizzas by Revenue
select pizza_name,sum(Total_Price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue asc
limit 5;

-- I. Top 5 Pizzas by Quantity
select pizza_name,sum(quantity) as Total_Quantity from pizza_sales 
group by pizza_name
order by Total_Quantity desc
limit 5;

-- J. Bottom 5 Pizzas by Quantity
select pizza_name,sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity asc
limit 5;

-- K. Top 5 Pizzas by Total Orders
select pizza_name,count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order desc
limit 5;

-- L. Bottom 5 Pizzas by Total Orders
select pizza_name,count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order asc
limit 5;

describe pizza_sales;

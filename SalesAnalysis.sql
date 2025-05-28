create database company;
-- Q1: Find all orders  shipped via economy mode with total amount greater than 25k
use company;

select * from sales;

select * from sales where Ship_Mode = 'Economy' and Total_Amount > 25000;
-- Q2
select * from sales  where   Order_Date > '23-9-2020' and Country ='Ireland'   and Category = 'Technology' ;

-- Q3) LIST the top 10 most profitable sales transactions in desecnding order.
select Unit_Profit from sales order by Unit_Profit desc limit 10,20; -- skip 10 records , showing next 20 records

-- Q4) Find all the customers whose name starts with J and ends with n
select Order_Id,Customer_Name from sales where Customer_Name like 'J%n' ;
-- Q5) Retieve all product names that contain acco anywhere in the name.
select Product_Name , Order_ID from sales where Product_Name like '%acco%' ;

-- Q6) Get top 5 cities with the highest total sales amount.
select  City , sum(Total_Amount) as Total_Sales from sales group by City order by Total_Sales desc limit 5;
-- Q7) Dispaly second set of 10 records for customer name and total amount in descending order.
select Customer_Name , Total_Amount from sales order by Total_Amount desc limit 10,10;

-- Q8) find the total revenue , average unit cost and total number of orders .
select sum(Total_Amount) as Total_Revenue , avg(Unit_Cost) as Average_Unit_Cost , count(Order_ID) as Total_Number_Of_Orders from sales ;

-- Q9) count unique number of regions.
select count(distinct( Region)) from sales;

-- Q10) find  
select Customer_Name,count(Order_ID) as Order_Count from sales group by Customer_Name order by Order_Count desc;

-- Q11) Rank 5 products based on total sales using RANK() row number , dense rank , rank , ntile.
select Product_name , sum(Total_Amount) as Total_Sales , RANK() over (order by sum(Total_Amount) desc) as sales_Rank from sales group by Product_Name limit 5;







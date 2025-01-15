-- Step 1: Create schema and tables

CREATE SCHEMA e_commerce;

USE e_commerce;

-- Create the Customers table
CREATE TABLE Customers (
    `id` int AUTO_INCREMENT,
    `first_name` varchar(35) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    `e_mail` varchar(50) NOT NULL,
    `address` varchar(45),
    `city` varchar(30),
    `country` varchar(30),
    PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Create the Products table
CREATE TABLE Products (
    `id` int AUTO_INCREMENT,
    `mobile_device_brand` varchar(100) NOT NULL,
    `mobile_device_model` varchar(100) NOT NULL,
    `mobile_device_os` varchar(100) NOT NULL,
    `price_€` decimal(10, 2) NOT NULL,
    PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Create the Orders table
CREATE TABLE Orders (
    `id` int AUTO_INCREMENT,
    `customer_id` int NOT NULL,
    `order_date` datetime default current_timestamp,
    PRIMARY KEY (`id`),
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Create the Sales table
CREATE TABLE Sales (
    `id` int AUTO_INCREMENT,
    `order_id` int NOT NULL,
    `product_id` int NOT NULL,
    `quantity` int NOT NULL,
    `revenue_€` decimal(10, 2) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

-- Step 2: Update and modify columns where necessary

ALTER TABLE Customers
    MODIFY COLUMN city VARCHAR(50),
    MODIFY COLUMN country VARCHAR(50);

ALTER TABLE Orders
	MODIFY `order_date` VARCHAR(10) DEFAULT '00/00/00'; 
    
-- Step 3: Populate tables with data from SQL files 'Customers', 'Products', 'Orders', 'Sales' (in repository provided as separate files).

-- Step 4: Update Sales table with calculated revenue column

UPDATE Sales s
    JOIN Products p ON s.product_id = p.id
    SET s.revenue_€ = p.price_€ * s.quantity;

-- Step 5: Insights

-- Total Revenue
-- Query to calculate the total revenue from all sales

SELECT SUM(revenue_€) AS total_revenue_€
FROM Sales;

-- Monthly revenue information
-- Query to retrieve the total revenue by month and year

SELECT 
    YEAR(STR_TO_DATE(o.order_date, '%d/%m/%Y')) AS year,
    MONTH(STR_TO_DATE(o.order_date, '%d/%m/%Y')) AS month,
    SUM(s.revenue_€) AS total_revenue
FROM Sales s
JOIN Orders o ON s.order_id = o.id
GROUP BY 
    YEAR(STR_TO_DATE(o.order_date, '%d/%m/%Y')),
    MONTH(STR_TO_DATE(o.order_date, '%d/%m/%Y'))
ORDER BY 
    year ASC, 
    month ASC;
    
-- Revenue of each product
-- Query to calculate the revenue for each product, including the quantity sold

SELECT 
    p.mobile_device_brand,
    p.mobile_device_model,
    p.mobile_device_os,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.revenue_€) AS total_revenue_€
FROM sales s
JOIN products p ON s.product_id = p.id
GROUP BY 
    p.mobile_device_brand, 
    p.mobile_device_model, 
    p.mobile_device_os
ORDER BY total_revenue_€ DESC;
    
-- Average revenue per order
-- Query to calculate the average revenue per order

SELECT 
    ROUND(AVG(total_revenue), 2) AS average_revenue_per_order
FROM (
    SELECT 
        order_id, 
        SUM(revenue_€) AS total_revenue
    FROM Sales
    GROUP BY order_id
) AS OrderRevenue;

-- Demographic information
-- Query to retrieve the order count by country and city of customers

SELECT 
    c.country,
    c.city,
    COUNT(o.id) AS order_count
FROM Orders o
JOIN Customers c ON o.customer_id = c.id
GROUP BY 
    c.country, 
    c.city
ORDER BY order_count DESC;

-- Customers that spend the most
-- Query to find the customers who spent the most on purchases

SELECT 
    c.first_name,
    c.last_name,
    c.e_mail,
    c.address,
    c.city,
    c.country,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.revenue_€) AS total_revenue_€
FROM Sales s
JOIN Orders o ON s.order_id = o.id
JOIN Customers c ON o.customer_id = c.id
GROUP BY 
    c.first_name,
    c.last_name,
    c.e_mail,
    c.address,
    c.city,
    c.country
ORDER BY total_revenue_€ DESC;





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
    
-- Step 3: Populate Customers table with data from SQL files 'Customers', 'Products', 'Orders', 'Sales'

-- Step 4: Update Sales table with calculated revenue column

UPDATE Sales s
    JOIN Products p ON s.product_id = p.id
    SET s.revenue_€ = p.price_€ * s.quantity;






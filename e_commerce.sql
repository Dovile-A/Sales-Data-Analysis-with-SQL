CREATE SCHEMA e_commerce;

USE e_commerce;

CREATE TABLE Customers (
    `id` int AUTO_INCREMENT,
    `name` varchar(35) NOT NULL,
    `address` varchar(45),
    `city` varchar(15),
    `country` varchar(15),
    PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE Products (
	`id` int AUTO_INCREMENT,
	`name` varchar(40) NOT NULL,
	`category` varchar(40),
	`price` decimal(4, 2) NOT NULL,
	PRIMARY KEY (`id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE Orders (
	`id` int AUTO_INCREMENT,
	`customer_id` int NOT NULL,
	`order_date` datetime default current_timestamp,
	PRIMARY KEY (`id`),
    FOREIGN KEY (customer_id) REFERENCES Customers(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

CREATE TABLE Sales (
	`id` int AUTO_INCREMENT,
    `order_id` int NOT NULL,
    `product_id` int NOT NULL,
    `quantity` int NOT NULL,
    `revenue` decimal(10, 2) NOT NULL,
	PRIMARY KEY (`id`),
    FOREIGN KEY (order_id) REFERENCES Orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

DROP TABLE Sales;

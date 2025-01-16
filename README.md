# Sales Data Analysis with SQL

This repository showcases my skills in database design, data analysis, and SQL queries using an e-commerce dataset generated with Mockaroo. 
The goal of this project was to explore and analyze sales data to derive valuable business insights.

## Project Overview

### Key Objectives
1. Create a well-structured relational database with appropriate schemas and tables.
2. Populate the database with sample data.
3. Perform data cleaning and transformation for consistency.
4. Derive business insights through SQL queries and views.

## Database Structure

The database consists of the following tables:
- **Customers**: Stores customer information, including their name, email, and location.
- **Products**: Stores details about mobile devices sold, including brand, model, OS, and price.
- **Orders**: Stores order information linked to customers.
- **Sales**: Stores details about products sold, quantities, and revenue generated linked to orders and products.

The database was designed using **MySQL** with `utf8mb4` character set for maximum compatibility.

## Steps Performed

1. **Database Creation and Schema Design**
- Designed a normalized relational database with `Customers`, `Products`, `Orders`, and `Sales` tables.
- Established relationships between tables using primary and foreign keys.

2. **Data Cleaning and Transformation**
- Modified columns for consistency and readability.
- Transformed and formatted date values to ensure accurate analysis.

3. **Populating Data**
- Inserted mock data into the database using SQL scripts.

4. **Data Analysis**
- Developed SQL views to address specific business questions, including:
    - **Total revenue** - calculated the total revenue generated from all sales using the `total_revenue_eur` view.
    - **Monthly Revenue Trends** - analyzed revenue trends by month and year using the `monthly_revenue` view.
    - **Product Revenue** - determined the top-performing products in terms of revenue and quantity sold using the `product_revenue` view.
    - **Demographic Information** - analyzed order count by customer location (city and country) using the `demographic_info` view.
    - **Top-Spending Customers** - identified customers with the highest total spending using the `customers_ranked` view.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/sales-data-analysis-with-SQL.git
   ```

2. Set up the database in MySQL by running the scripts in the following order:
- Create Schema and Tables: `e_commerce.sql` sets up the database schema and creates the necessary tables.
- Populate Tables with Data: Run these scripts to insert mock data into each table:  
  `customers.sql` — Populates the Customers table.  
  `products.sql` — Populates the Products table.  
  `orders.sql` — Populates the Orders table.  
  `sales.sql` — Populates the Sales table.  
(These files are provided as separate scripts in the repository.)
- Once the data is populated, you can run the queries in e_commerce.sql (the main file) to replicate the analysis and generate insights such as total revenue, monthly revenue trends, and product-wise sales performance.

## Tools Used
**MySQL**: For database creation, management, and querying.  
**mockaroo.com**: To generate sample data for the project.  
**SQL Views**: To simplify complex queries and extract insights.  

## Key Skills Demonstrated
- Database design and normalization.  
- SQL query writing, including joins, aggregations, and subqueries.  
- Data cleaning and transformation.  
- Analytical thinking and insight generation.  

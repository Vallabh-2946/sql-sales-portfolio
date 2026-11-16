-- ==========================================================
-- WEEK 1 SQL PRACTICE & PORTFOLIO: SALES DATABASE ANALYSIS
-- ==========================================================

-- 1. Database & Table Creation
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- ==========================================================
-- 2. Insert Sample Data
-- ==========================================================

INSERT INTO customers VALUES 
(1, 'Alice Smith', 'North'), 
(2, 'Bob Jones', 'South'), 
(3, 'Charlie Brown', 'North');

INSERT INTO orders VALUES 
(101, 1, '2026-01-10', 600.00), 
(102, 2, '2026-01-12', 450.00), 
(103, 1, '2026-01-15', 750.00);

INSERT INTO order_items VALUES 
(1, 101, 'Laptop', 'Electronics', 600.00), 
(2, 102, 'Desk Chair', 'Furniture', 450.00), 
(3, 103, 'Monitor', 'Electronics', 750.00);

-- ==========================================================
-- 3. Analytical Practice Queries
-- ==========================================================

-- Query A: Total Revenue and Orders by Product Category (Aggregation & GROUP BY)
SELECT 
    product_category,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM 
    order_items
GROUP BY 
    product_category;

-- Query B: Customer Order Details (LEFT JOIN)
SELECT 
    c.customer_id,
    c.customer_name,
    c.region,
    o.order_id,
    o.total_amount
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id;

-- Query C: Product Price Ranking by Category (Window Functions)
SELECT 
    product_name,
    product_category,
    total_amount,
    ROW_NUMBER() OVER (PARTITION BY product_category ORDER BY total_amount DESC) AS price_rank
FROM 
    order_items;

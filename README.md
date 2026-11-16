# SQL Sales Analysis & Portfolio

## 🚀 Overview
This repository contains foundational SQL practice queries and database schema designs created for data analytics skill-building. The project uses a relational e-commerce sales database (`sales_db`) to practice essential SQL operations, ranging from database creation to advanced analytical queries like joins and window functions.

---

## 🗄️ Database Schema
The database consists of three relational tables:
* **`customers`**: Stores customer demographic information (`customer_id`, `customer_name`, `region`).
* **`orders`**: Tracks order-level transactions (`order_id`, `customer_id`, `order_date`, `total_amount`).
* **`order_items`**: Details individual line items per order (`item_id`, `order_id`, `product_name`, `product_category`, `total_amount`).

---

## 💻 Implemented SQL Techniques
* **Database & Table Setup:** DDL statements creating tables with Primary and Foreign Key constraints.
* **Data Insertion:** Sample DML records populating customers, orders, and items.
* **Aggregations:** Using `GROUP BY`, `COUNT()`, and `SUM()` to evaluate category-level revenue and order counts.
* **Relational Joins:** Connecting customer and order data using `LEFT JOIN`.
* **Window Functions:** Ranking product items within categories using `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`.

---

## 📊 Key Insights
* **Top Revenue Category:** Electronics generated the highest total revenue ($1,350.00) across orders.
* **Regional Activity:** Orders reflect customer purchasing behavior across North and South regional markets.

# SQL-Final-Project
# Supermarket SQL Project 🛒

Welcome to the Supermarket SQL Project! This project involves designing a relational database for a supermarket, importing data, and performing various SQL queries to analyze and derive insights from the dataset.

## Database Design 📊

The database consists of the following tables:

| Table            | Description                                                  |
|------------------|--------------------------------------------------------------|
| **aisles**       | Stores information about different supermarket aisles.       |
| **departments**  | Contains data about supermarket departments.                 |
| **product**      | Includes details about various products, linking to aisles and departments. |
| **orders**       | Stores information about customer orders.                    |
| **order_product** | Represents the relationship between orders and products.     |

## Data Import 🚀

CSV files are used to import data into the respective tables, such as aisles, departments, orders, products, and order products.

## SQL Queries 📈

### 1. Top 10 Products Sales For Each Day of the Week

Retrieves the top 10 products sold for each day of the week, considering orders from Monday to Friday.

### 2. 5 Most Popular Products in Each Aisle from Monday to Friday

Identifies the five most popular products in each aisle from Monday to Friday, based on the total number of sales.

### 3. Top 10 Products with the Most Frequent Reorder Rate

Lists the top 10 products with the highest reorder rates, calculated as the sum of reordered divided by the total count.

### 4. Shopper’s Aisle List for Each Order

Associates each order with the list of aisles the shopper visited, considering the products in the order and their respective aisles.

### 5. Most Popular Shopping Path

Determines the most popular shopping path by grouping orders based on the distinct aisles visited, requiring at least two different aisles per order.

### 6. Top Pairwise Associations in Products

Identifies the top 100 pairwise associations between products based on the number of times they appear together in orders.

## Links 🔗

- [Video Demonstration](https://www.youtube.com/watch?v=[Your Video Link])
- [Database Diagram](https://www.drawsql.app/[Your Database Diagram Link])
- [Data Source](https://www.yourdatasourcelink.com)

Feel free to explore the project and run the SQL queries to gain valuable insights into supermarket data!

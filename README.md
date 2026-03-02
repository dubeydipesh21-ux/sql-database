# SQL Database Project

## Description

This repository contains a comprehensive collection of SQL queries organized by complexity level and use case. It serves as a practical learning resource for SQL developers, data analysts, and students learning advanced database querying techniques.

## Project Overview

The SQL Database Project is designed to demonstrate real-world database operations including:
- Advanced filtering and data formatting techniques
- Aggregate functions and statistical calculations
- Multi-table queries using different JOIN types
- Complex subqueries for advanced data retrieval
- Set operations for combining query results

## Files

### `queries.sql`
Main SQL file containing all query examples organized into 5 complexity levels:

#### **Level 2: Filtering and Formatting**
Basic filtering operations with column aliases, date extraction, and data concatenation.
- 6 practical queries covering SELECT with WHERE, AS aliases, CONCAT, DATE functions

#### **Level 3: Aggregations**
Aggregate functions and GROUP BY operations for data summarization.
- 10 queries demonstrating COUNT, SUM, AVG, GROUP BY, and HAVING clauses

#### **Level 4: Multi-Table Queries (JOINS)**
Joining multiple tables to combine related data.
- 7 queries covering INNER JOIN, LEFT JOIN, RIGHT JOIN, and multi-table joins
- Examples: customer orders, product details, payment information

#### **Level 5: Subqueries (Inner Queries)**
Nested SELECT statements for complex data filtering.
- 7 queries showing scalar subqueries, IN/NOT IN operators, correlated subqueries
- Applications: finding above-average prices, unmatched records

#### **Level 6: Set Operations**
Combining results from multiple queries.
- 2 queries demonstrating UNION and advanced filtering logic

## Database Schema

The queries reference the following tables:

- **customers** - Customer information (customer_id, name, email, phone)
- **orders** - Order records (order_id, customer_id, order_date, total_amount, status)
- **products** - Product inventory (product_id, name, category, price, stock_quantity)
- **order_items** - Line items in orders (order_item_id, order_id, product_id, quantity, item_price)
- **payments** - Payment transactions (payment_id, order_id, method, amount_paid)
- **product_reviews** - Customer product reviews (review_id, product_id, customer_id, rating)

## How to Use

1. **Review by Difficulty Level**: Start with Level 2 queries if you're new to SQL, and progress through higher levels
2. **Copy and Adapt**: Use these queries as templates for your own database projects
3. **Study Patterns**: Each query demonstrates specific SQL patterns and best practices
4. **Execute in Your Database**: Adapt the table and column names to match your actual database schema

## Key Concepts Covered

- **SELECT & WHERE**: Filtering data with conditions
- **JOIN Operations**: INNER, LEFT, RIGHT joins for combining tables
- **Aggregate Functions**: COUNT, SUM, AVG, MAX, MIN with GROUP BY
- **Subqueries**: Nested queries for complex filtering
- **String Functions**: CONCAT for combining values
- **Date Functions**: DATE extraction and formatting
- **Set Operations**: UNION for combining result sets
- **Table Aliases**: AS keyword for temporary column/table naming

## Prerequisites

- Basic understanding of SQL syntax
- Access to a SQL database (MySQL, PostgreSQL, SQL Server, SQLite, etc.)
- Familiarity with database table structure and relationships

## Learning Path

1. Start with simple SELECT statements
2. Progress to WHERE clauses and filtering
3. Learn JOIN operations
4. Master aggregate functions and GROUP BY
5. Advance to subqueries and complex filtering
6. Explore set operations and advanced patterns

## Real-World Applications

- **Sales Analysis**: Calculate revenue by product category, customer, or time period
- **Customer Insights**: Identify loyal customers, purchase patterns, and lifecycle analysis
- **Inventory Management**: Track stock levels and identify out-of-stock products
- **Reporting**: Generate detailed reports combining data from multiple tables
- **Data Quality**: Find inconsistencies and missing data

## Tips for SQL Development

1. **Test Incrementally**: Build complex queries step by step
2. **Use Aliases**: Make queries readable with meaningful table and column aliases
3. **Comment Your Code**: Add comments explaining the purpose of complex sections
4. **Optimize**: Use indexes and EXPLAIN PLAN to optimize query performance
5. **Format Consistently**: Follow consistent indentation and naming conventions

## License

This project is open source and available for educational and commercial use.

## Author

Created as a learning resource for SQL enthusiasts and professionals.

---

**Happy Learning!** Feel free to fork, modify, and use these queries for your projects.

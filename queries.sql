#######################################-----------------Level 2: Filtering and Formatting--------------------------------###############################################


#1 Retrieve orders where customer information is missing (possibly due to data migration or deletion)
SELECT order_id, order_date, total_amount FROM orders WHERE customer_id IS NULL;

#2. Display customer names and emails using column aliases for frontend readability
select name as Customer_name, email as customer_email from customers;

#3. Calculate total value per item ordered by multiplying quantity and item price
select order_item_id , order_id, product_id , (quantity*item_price) as Total_value from order_items;

# 4. Combine customer name and phone number in a single column
SELECT customer_id,CONCAT(name, ' ', phone) AS contact_details FROM customers;

#5. Extract only the date part from order timestamps for date-wise reporting
SELECT order_id, DATE(order_date) as order_date FROM orders;

#6. List products that do not have any stock left
select product_id, category, name,price from products where stock_quantity=0 or stock_quantity is null;
########################################################-------------------Level 3: Aggregations--------------------------------####################################################################


# 1. Count the total number of orders placed
SELECT COUNT(order_id) AS total_orders FROM orders;

#2. Calculate the total revenue collected from all orders
select sum(Total_amount) as Total_revenue_collected from orders;

#3. Calculate the average order value
select round(avg(Total_amount),2) as avaerage_order_value from orders;

#4. Count the number of customers who have placed at least one order
select count(distinct Customer_id) as count_of_customer from orders;

#5. Find the number of orders placed by each customer
select customer_id, count(order_id) from orders group by customer_id;

#6. Find total sales amount made by each customer
select customer_id, sum(total_amount) as Total from  orders group by  customer_id;

#7. List the number of products sold per category
select products.category, sum(order_items.quantity) 
from products join order_items
on products.product_id= order_items.product_id
group by products.category;


#8. Find the average item price per category
select category, round(avg(price),2)as avg_price_per_category from products group by category;

#9. Show number of orders placed per day
SELECT Order_Date, count(customer_id) AS Total_Orders
FROM Orders
GROUP BY Order_Date
ORDER BY Order_Date DESC;


#10. List total payments received per payment method

select method, sum(amount_paid) as Payment_rec from payments group by method;

################################################-----------------Level 4: Multi-Table Queries (JOINS)-------------------------##################################################


#1. Retrieve order details along with the customer name (INNER JOIN)

select orders.customer_id,customers.name, orders.total_amount
from customers inner join orders 
on customers.customer_id=orders.customer_id ;

select*
from customers inner join orders 
on customers.customer_id=orders.customer_id ;
#2. Get list of products that have been sold (INNER JOIN with order_items)

select products.name, products.category,order_items.item_price
from products inner join order_items 
on products.product_id= order_items.product_id
order by products.category;

#3. List all orders with their payment method (INNER JOIN)

select orders.order_id,payments.method
from orders inner join payments
on orders.order_id= payments.order_id
order by orders.order_id;



#4. Get list of customers and their orders (LEFT JOIN)
select c.name, o.order_id from customers c left join orders o on c.customer_id = o.customer_id;
#5. List all products along with order item quantity (LEFT JOIN)
select p.name,o.quantity from products p left join order_items o on p.product_id= o.product_id order by p.name ;

#6. List all payments including those with no matching orders (RIGHT JOIN)
select p.payment_id,o.order_id ,p.amount_paid from orders o right join payments p on p.order_id= o.order_id;



#7. Combine data from three tables: customer, order, and payment
SELECT c.name, o.order_id, o.order_date,p.amount_paid, o.status
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id;

##################################################-----------------Level 5: Subqueries (Inner Queries)-----------------------##############################################################################-
select * from customers;
select * from orders;
select * from products; 
select * from payments;
select * from order_items ;
select * from product_reviews;

#1. List all products priced above the average product price
select name, price from products where price> (select avg(price) from products);

#2. Find customers who have placed at least one order
select customer_id from customers where customer_id in( select distinct customer_id from customers ) order by customer_id asc;

#3. Show orders whose total amount is above the average for that customer
select order_id from orders where total_amount>(select round(avg(Total_amount),2) from orders);

#4. Display customers who haven't placed any orders
select * from customers where customer_id not in( select customer_id from orders);

#5. Show products that were never ordered
select * from products where product_id not in ( select product_id from order_items);

#6. Show highest value order per customer
SELECT customer_id, MAX(Total_amount) AS highest_order_value
FROM orders
GROUP BY customer_id order by highest_order_value desc;




#7. Highest Order Per Customer (Including Names)

SELECT c.name, o.order_id, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount = (
    SELECT MAX(o.total_amount) 
    FROM orders 
    WHERE customer_id = c.customer_id
);

########################################__________Level 6: Set Operations___________________________##############################################

#1. List all customers who have either placed an order or written a product review
select customer_id from orders
Union
select customer_id from product_reviews;

#2. List all customers who have placed an order as well as reviewed a product

select distinct customer_id from orders where customer_id in (select customer_id from product_reviews);

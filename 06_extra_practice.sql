use `awesome chocolates`;
desc sales;
select sum(amount) from sales;
# List all tables in this database
show tables;
select * from geo; #to see the missing table

# How many rows does the sales table have?
select count(*) from sales;

# Show the first 10 rows of the sales table
select * from sales limit 10;  #See the data

# How many sales rows are there in total?
select count(*) as total_rows from sales; #Count rows

# Total amount of all sales, and the average sale amount
select sum(amount) as total_amount, avg(amount) as average_amount from sales; #Total and average

# Sales where the amount is more than 10000
select saledate, amount, customers from sales where amount > 10000; #Filter

# The 5 biggest sales, highest first
select saledate, amount, customers, boxes from sales order by amount desc limit 5; #Sort and limit

# Total boxes sold for each product id
select pid, sum(boxes) as total_boxes from sales group by pid order by total_boxes desc; #Group by

# Total sales amount for each country, highest first
select g.Geo, sum(s.amount) as total_amount from sales s join geo g on s.geoid = g.GeoID group by g.Geo order by total_amount desc; #Join with the geo table


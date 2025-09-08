create database Product;

use Product;

create table customer
(
	Product_ID int primary key auto_increment PRIMARY KEY,
	Product_Categoty varchar(30),
	Product_Name varchar(30),
	Product_Price int,
	Product_Region varchar(20),
	Product_Color varchar(30),
	Customer_Name varchar(50),
	Customer_Location Varchar(50),
	Order_Date date,
	Payment_Method varchar(40)
) AUTO_INCREMENT = 1000;

ALTER TABLE customer
ADD COLUMN Product_Subcategoty varchar(50);


insert into customer (Product_Categoty, Product_Subcategoty, Product_Name, Product_Price, Product_Region, Product_Color, Customer_Name, Customer_Location, Order_Date, Payment_Method)
values ('Mountain Bikes', 'TrailBlazer 1000','Lightweight and versatile', 1200,'North America','Red','John Doe', 'USA', '2023-04-01','Credit Card'),
('Mountain Bikes', 'TrailBlazer 2000',	'High-performance',	1500.00,	'Europe',	'Blue',	'Jane Smith',	 'UK',	'2023-04-02',	'PayPal'),
('Road Bikes',	'SpeedMaster 1000',	'Agile and aerodynamic road',	1800.00,	'Asia',	'Yellow',	'Jack Williams',	'Japan',	'2023-04-03',	'Credit Card'),
('Road Bikes',	'SpeedMaster 2000',	'Premium racing road',	2100.00,	'North America',	'Black',	'Mary Johnson',	 'USA',	'2023-04-04',	'Credit Card'),
('Touring Bikes',	'Explorer 1000',	'Comfortable and durable bike',	1300.00,	'Europe',	'Green',	'Robert Brown',	 'Germany',	'2023-04-05',	'PayPal'),
('Touring Bikes',	'Explorer 2000',	'Advanced touring bike',	1600.00,	'Europe',	'Red',	'Emily Taylor',	 'Spain',	'2023-04-06',	'Credit Card'),
('Mountain Bikes',	'GravityMaster 1000',	'Rugged durable downhill bike',	2200.00,	'Asia', 'Orange',	'David Miller',	 'China',	'2023-04-07',	'PayPal'),
('Mountain Bikes',	'GravityMaster 2000',	'Rugged durable downhill bike',	2500.00,	'North America',	'White',	'Sarah Wilson',	 'USA',	'2023-04-08',	'Credit Card'),
('Mountain Bikes',	'Pathfinder 1000',	'Agile trail bike levels',	1100.00, 'Europe',	'Blue',	'James Moore',	 'France',	'2023-04-21',	'Credit Card'),
('Mountain Bikes',	'Pathfinder 2000',	'High-performance trail bike',	1400.00,	'Europe',	'Red',	'Lily Smith',	'Germany',	'2023-04-22',	'PayPal'),
('Road Bikes',	'Voyager 1000',	'Comfortable touring road bike',	1700.00,	'Asia',	'Green',	'William Brown',	 'Japan',	'2023-04-24',	'Credit Card'),
('Road Bikes',	'Voyager 2000',	'Advanced touring road bike',	2000.00,	'North America',	'Black',	'Emma Jones',	 'USA',	'2023-04-24',	'Credit Card'),
('Touring Bikes',	'Adventurer 1000',	'Durable bike for adventures',	1500.00,	'Europe',	'Yellow',	'Jack Davis',	'UK',	'2023-04-25',	'PayPal'),
('Touring Bikes',	'Adventurer 2000',	'Premium adventure bike',	1800.00,	'Asia',	'White',	'Sophia Williams',	 'China',	'2023-04-26',	'Credit Card'),
('Mountain Bikes','EnduroMaster 1000',	'Endurance-focused bike',	2300.00,	'North America',	'Blue',	'Michael Johnson', 'USA',	'2023-04-27',	'PayPal'),
('Mountain Bikes',	'EnduroMaster 2000',	'High-performance mountain bike',	2600.00,	'Europe',	'Red',	'Olivia Wilson',	'Italy',	'2023-04-28',	'Credit Card'),
('Mountain Bikes',	'FatTrail 1000',	'All-terrain fat bike',	1300.00,	'Asia',	'Black',	'Ethan Taylor',	 'South Korea',	'2023-04-11',	'Credit Card'),
('Mountain Bikes',	'FatTrail 2000',	'High-performance fat bike',	1600.00,	'Europe',	'Green',	'Ava Thomas',	 'France',	'2023-04-12',	'PayPal'),
('Road Bikes',	'CrossRider 1000',	'Versatile cyclocross bike',	1900.00,	'Asia',	'White',	'Isabella Jackson',	'USA',	'2023-04-14',	'Credit Card'),
('Road Bikes',	'CrossRider 2000',	'Advanced cyclocross bike',	2200.00,	'Europe',	'Red',	'Amelia Anderson',	 'Greece',	'2023-04-13',	'Credit Card'),
('Touring Bikes',	'DuoExplorer 1000',	'Comfortable touring bike',	2000.00,	'Asia',	'Green',	'Liam Carter',	 'India',	'2023-04-15',	'PayPal'),
('Touring Bikes',	'DuoExplorer 2000',	'High-performance touring bike',	2300.00,	'North America',	'Black',	'Sophia Davis',	 'USA',	'2023-04-16',	'Credit Card'),
('Mountain Bikes',	'E-Mountain 1000',	'Electric mountain bike',	3000.00,	'Europe',	'Yellow',	'Benjamin Williams',	 'Ireland',	'2023-04-17',	'PayPal'),
('Mountain Bikes', 'E-Mountain 2000',	'High-performance electric bike',	3500.00,	'Asia',	'White',	'Mia Wilson',	'Taiwan',	'2023-04-18',	'Credit Card');

select * from customer;

----------------------------------------------------- Basic Queries --------------------------------------------------------
-- Listing product price above 2000 --

select Product_ID, Product_Name, Customer_Name, Product_Price
from customer
where Product_Price > 2000;


-- Find all orders placed using a specific payment method --

select Product_Name, Customer_Name, Payment_Method
from customer
where Payment_Method = 'Credit Card';


-- Retriving customer from a specific location --

select Customer_Name, Customer_Location
from customer
where Customer_Location = 'USA';


-- Retriving customer name starts from a particular letter-----------

select * from customer
where Customer_Name like 'a%';

################################################ Aggregations & Summaries ######################################

-- Count the total number of orders--

select count(*) as Total_Order
from customer;

-- Calculate the average, minimum, and maximum price of products ---

select
avg(Product_Price) as Average_price,
min(Product_Price) as Minimum_price,
max(Product_Price) as Maximum_price
from customer;

-- Total revenue from all orders--

select sum(Product_Price) as Total_Revenue
from customer;

select Customer_Name, sum(Product_Price) As Revenue
from customer
group by Customer_Name;

-- Count the number of orders per customer---------------------

select Customer_Name, count(*) as Total_orders
from customer
group by Customer_Name;

-- Find the total sales per product category------------

SELECT Product_Categoty, sum(Product_Price) as Total_sales_of_each_product
from customer
group by Product_Categoty;

########################################## Filtering and sorting ##############################

 -- Find all products priced between 1500 and 2500 ---------------------------------
select Product_ID, Product_Name, Product_Price
from customer
where Product_Price between 1200 and 1500;

-- Retrieve orders from Europe only -------------------------------------

select * from customer
where Product_Region = 'Europe';

-- Get customers who used either PayPal or Credit Card ------------------

select Customer_Name, Payment_Method from customer
where Payment_Method in ('PayPal', 'Credit Card');

################### Sorting #######################################
-- List all products sorted by price (highest first) -----------

select Product_Name, Product_Price
from customer
order by Product_Price desc;

-- List customers alphabetically by name
select Customer_Name
from customer
order by Customer_Name asc;

############################ Distinct Values############################
-- Find all distinct product categories--------

select distinct Product_Categoty from customer;

############################Date Functions########################

-- Find all orders placed in April 2023 ----------------

select Product_region, Month(Order_Date) as Month_of_order
from customer
where month(Order_Date) = 4 and year(Order_Date) = 2023;

-- Count orders per day--------
select Order_Date, count(*) as Order_per_day
from customer
group by Order_Date
order by Order_per_Day desc;

############################## String FUnction ###################

select Customer_Name
from Customer
where Customer_Name like '%N';

-- Find the length of each product name--------

select Product_Name, length(Product_Name) as Length_of_Product
from customer;

############################### Removing Duplicate ##################

select distinct Product_Region from customer;

-- Filtering Groups (HAVING) Customers who spent more than 4000 -----------------
select Customer_Name, sum(Product_Price) as Total_Price_per_customer
from customer
group by Customer_Name
having sum(Product_Price) >= 2000;

-- Get top 5 most expensive products (Limit) --------
select Product_Name, Product_Price
from customer
order by Product_Price desc
limit 5;



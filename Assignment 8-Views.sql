--CREATING A DATABASE NAMED PRODUCT
create database Product;
use Product;

--CREATING A TABLE NAMED CUSTOMER
create table Customer(
Customer_Id int Auto_increment Primary Key,
First_name varchar(30) NOT NULL,
Last_name varchar(20),
Email varchar(25) UNIQUE,
Phone_no varchar(30),
Address varchar(50),
City varchar(10),
State varchar(10),
Zip_Code int NOT NULL,
Country varchar(10));
--INSERTING VALUES INTO TABLE CUSTOMER
insert into Customer(First_name,Last_name,Email,Phone_no,Address,City,State,Zip_Code,Country) 
values 
('Sam','Jose','samjose@abc.com','987654321',
'1st Main 2nd Block','Ernakulam','Kerala',682017,'India'),
('Ethan','Antony','ethanantony@abc.com','987654322',
'S.Kumar Layout','Bangalore','Karnataka',560033,'India'),
('Noah','Antony','noahantony@abc.com','987654323',
'Maruthi Sevanagar','Bangalore','Karnataka',560033,'India'), 
('Chris','Augustine','chrisaugustine@abc.com','987654325',
'APT 3 GTA Block','Charlotte','Carolina',28282,'USA'),
('Royce','Antonio','royceantonio@abc.com','987654345',
'APT 1 CTA Block','Charlotte','California',28281,'USA');

select * from Customer;

1.Create a view named customer_info for the Customer table that displays Customer’s Full name and 
 email address. Then perform the SELECT operation for the customer_info view. 
create view customer_info as select concat(First_name," ",Last_name) as Full_name,email from Customer;
select * from customer_info;

2. Create a view named US_Customers that displays customers located in the US.
create view US_Customers as select * from Customer where Country='USA';
select * from US_Customers;

3. Create another view named Customer_details with columns full name(Combine first_name and last_name),
 email, phone_no, and state. 
create view Customer_details as select concat(First_name," ",Last_name) 
as Full_name,email,Phone_no,State from Customer;

select * from Customer_details;
 
 4. Update phone numbers of customers who live in California for Customer_details view. 
update Customer_details set Phone_no ='9897969594' where State='California';

select * from Customer_details;

5. Count the number of customers in each state and show only states with more than 5 customers. 
select count(Full_name) as no_of_customer,state from Customer_details
group by State having no_of_customer>5;                              -----USING VIEW Customer_details

select count(Customer_Id) as no_of_customer,state from Customer
group by State having no_of_customer>5;                             -----USING TABLE Customer


 6. Write a query that will return the number of customers in each state, based on the "state" 
 column in the "customer_details" view. 
select count(Full_name) as no_of_customer,state from Customer_details
group by State;

7. Write a query that returns all the columns from the "customer_details" view, sorted by the
 "state" column in ascending order.
select * from Customer_details order by state asc;
 

 
 
 
 
--CREATING DATABASE POPULATIONS
create database Populations;
use Populations;

---CREATING TABLE COUNTRY
create table Country (
    Id INT PRIMARY KEY,                 
    Country_name VARCHAR(50),
    Population INT,
    Area INT);

---CREATING TABLE PERSON
create table Person (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id));

--INSERTING VALUES INTO TABLE COUNTRY
## population entered in million and area in million sq.km

INSERT INTO Country (Id,Country_name, Population,Area) VALUES
(1,'USA', 336.0, 9.83),
(2,'UK', 67.0, 0.24),
(3,'Australia', 266.0, 7.69),
(4,'India', 1417.0, 3.29),
(5,'Palau', 0.018, 0.00046),
(6,'Tuvalu', 1.1, 0.00003),
(7,'Canada', 40.0, 9.98),
(8,'China', 1430, 9.60),
(9,'Bangladesh', 170, 0.14),
(10,'Pakistan', 220.0, 0.81);

--INSERTING VALUES INTO TABLE PERSON
## population entered in million 
insert into Person(Fname,Lname,Population,Rating,Country_id,Country_name)values
('John','Joseph',336,4.5,1,'USA'),
('Mathew','Joseph',336,4,1,'USA'),
('Varghese','Peter',336,3.5,1,'USA'),
('Paul','Thomas',67,4.5,2,'UK'),
('John','Paul',67,3,2,'UK'),
('Peter','Jo',266,5,3,'Australia'),
('John','Jose',1430,4,8,'China'),
('Antony','Thomas',1417,4,4,'India'),
('John','Bastin',336,4.5,7,'Canada'),
('Mathew','Paul',40,4.5,7,'Canada'),
('John',null,336,4.5,1,'USA'),
('Paul',null,67,5,2,'UK');

select * from Country;
select * from Person;

1. Find the number of persons in each country.
select Country_name,count(Fname) as Total_Count from Person group by Country_name;

 2. Find the number of persons in each country sorted from high to low. 
 select Country_name,count(Fname) as Total_Count from Person group by Country_name 
 order by Total_Count desc;
 
 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
 select Country_name,round(avg(Rating),2) as Average_rating from Person group by Country_name
 having Average_rating >3.0;

 
 4. Find the countries with the same rating as the USA. (Use Subqueries)
 select distinct(Country_name) as Countries_with_rating_same_as_USA from Person where Rating in (select distinct(Rating)from Person 
 where Country_name='USA')and Country_name !='USA';
 
  5.Select all countries whose population is greater than the average population of all nations.
  select Country_name as Countries_with_population_morethan_avgpop,Population from Person where Population>(select avg(Population)from Person);
  
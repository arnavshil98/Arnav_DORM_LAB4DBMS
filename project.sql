-- Q1
/*
1)You are required to create tables for supplier,customer,category,product,supplier_pricing,
order,rating 
to store the data for the E-commerce with the schema definition given below.
*/
create schema gl271222;

create table gl271222.supplier (SUPP_ID INT PRIMARY KEY,
SUPP_NAME VARCHAR(50) NOT NULL, SUPP_CITY VARCHAR(50) NOT NULL, SUPP_PHONE VARCHAR(50) NOT NULL);

CREATE TABLE gl271222.CUSTOMER (CUS_ID INT PRIMARY KEY, CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL, CUS_CITY VARCHAR(30), CUS_GENDER ENUM ('M','F','T'));

CREATE TABLE gl271222.CATEGORY(CAT_ID INT PRIMARY KEY, CAT_NAME VARCHAR(20) NOT NULL);

CREATE TABLE gl271222.PRODUCT(PRO_ID INT PRIMARY KEY, PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy', PRO_DESC VARCHAR(60),
CAT_ID INT ,
 constraint fk_product_id foreign key(CAT_ID)
references gl271222.CATEGORY(CAT_ID));

CREATE TABLE gl271222.SUPPLIER_PRICING( PRICING_ID INT PRIMARY KEY, PROD_ID INT , SUPP_ID INT,
constraint fk_prod_id foreign key(PROD_ID)
references gl271222.PRODUCT(PRO_ID),
constraint fk_supp_id foreign key(SUPP_ID)
references gl271222.supplier(SUPP_ID),
SUPP_PRICE INT DEFAULT 0
);

CREATE TABLE gl271222.`ORDER`( ORD_ID INT PRIMARY KEY, ORD_AMOUNT INT NOT NULL, ORD_DATE DATE NOT NULL,
CUS_ID INT , PRICING_ID INT ,
constraint fk_CUST_id foreign key(CUS_ID)
references gl271222.CUSTOMER(CUS_ID),
constraint PRICING_ID foreign key(PRICING_ID)
references gl271222.SUPPLIER_PRICING(PRICING_ID));

CREATE TABLE gl271222.RATING(RAT_ID INT PRIMARY KEY, ORD_ID INT, RAT_RATSTARS INT NOT NULL, 
constraint fk_ORD_ID_RAT foreign key(ORD_ID)
references gl271222.`ORDER`(ORD_ID));

-- Q2
/*
2)Insert the following data in the table created above
*/
use gl271222;

insert into supplier values (1,"Rajesh Retails","Delhi",1234567890);
insert into supplier values (2,"Appario Ltd","Mumbai",46541231564);
insert into supplier values (3," Knome Products","Banglore",4567398647);
insert into supplier values (4,"Bansal Retails","Konchi",78713007861);
insert into supplier values (5," Mittal Ltd","Lucknow",71689454732);

insert into customer values (1,"AAKASH",9999999999,"DELHI",'M');
insert into customer values (2,"AMAN",7524454248,"NOIDA",'M');
insert into customer values (3,"NEHA ",9999999999,"MUMBAI",'F');
insert into customer values (4,"MEGHA",9994562399,"KOLKATA",'F');
insert into customer values (5,"PULKIT",7894669999,"LUCKNOW",'M');

insert into category values (1,"Books");
insert into category values (2,"Gamers");
insert into category values (3,"Groceries");
insert into category values (4,"Electronics");
insert into category values (5,"Clothes");

insert into product values (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values (2," T SHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product values (3,"ROG LAPTOP","Windows 10 with 15 inch screen and i7 processor,1TB SSD",4);
insert into product values (4,"OATS","Highly Nutritious from Nestle",3);
insert into product values (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product values (6,"MILK","1L Toned MIlk",3);
insert into product values (7,"BOAT EARPHONES","1.5Meter long Dolby Atmos",4);
insert into product values (8,"JEANS","Stretchable Denim Jeans with various sizes and color	",5);
insert into product values (9,"Project IGI","compatible with windows 7 and above",2);
insert into product values (10,"Hoodie","Black GUCCI for 13 yrs and above	",5);
insert into product values (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product values (12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

insert into `order` values (101,1500,'2021-10-06',2,1);
insert into `order` values (102,1000,'2021-10-12',3,5);
insert into `order` values (103,30000,'2021-09-16',5,2);
insert into `order` values (104,1500,'2021-10-05',1,1);
insert into `order` values (105,3000,'2021-08-16',4,3);
insert into `order` values (106,1450,'2021-08-18',1,2);
insert into `order` values (107,789,'2021-09-01',3,3);
insert into `order` values (108,780,'2021-09-07',5,5);
insert into `order` values (109,3000,'2021-00-10',5,3);
insert into `order` values (110,2500,'2021-09-10',2,4);
insert into `order` values (111,1000,'2021-09-15',4,5);
insert into `order` values (112,789,'2021-09-16',4,1);
insert into `order` values (113,31000,'2021-09-16',1,2);
insert into `order` values (114,1000,'2021-09-16',3,5);
insert into `order` values (115,3000,'2021-09-16',5,3);
insert into `order` values (116,99,'2021-09-17',2,4);

insert into rating values (1,101,4);
insert into rating values (2,102,3);
insert into rating values (3,103,1);
insert into rating values (4,104,2);
insert into rating values (5,105,4);
insert into rating values (6,106,3);
insert into rating values (7,107,4);
insert into rating values (8,108,4);
insert into rating values (9,109,3);
insert into rating values (10,110,5);
insert into rating values (11,111,3);
insert into rating values (12,112,4);
insert into rating values (13,113,2);
insert into rating values (14,114,1);
insert into rating values (15,115,1);
insert into rating values (16,116,0);
*/

-- Q3
/*
3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/
SELECT CUS_GENDER,count(CUS_GENDER) FROM (
select c.CUS_ID,C.CUS_GENDER,sum(ORD_AMOUNT) as total_exp_per_cust from `order` o,customer c
where c.CUS_ID = o.CUS_ID
 group by CUS_ID
 having total_exp_per_cust>=3000) hdr
 group by CUS_GENDER;
-- Q4
/*
4)Display all the orders along with product name ordered by a customer having Customer_Id=2
*/
SELECT o.ORD_ID,p.PRO_ID,p.PRO_NAME, p.PRO_DESC from `order`o, supplier_pricing sp, product p
where 
    o.PRICING_ID = sp.PRICING_ID
  and sp.PROD_ID = p.PRO_ID and o.CUS_ID = 2;

-- Q5
/*
5)Display the Supplier details who can supply more than one product.
*/
SELECT  s.SUPP_ID,s.SUPP_NAME,s.SUPP_CITY,s.SUPP_PHONE, count(sp.PROD_ID) distinct_product_count FROM gl271222.supplier_pricing sp
, gl271222.supplier s
where s.SUPP_ID = sp.SUPP_ID
 group by sp.SUPP_ID 
having count(sp.PROD_ID)>1;

-- Q6
/*
6)Find the least expensive product from each category and print the table with category id, 
name, product name and price of the product
*/
SELECT p.PRO_NAME, p.PRO_DESC, p.CAT_ID,(SELECT c.CAT_NAME FROM 
gl271222.category c WHERE p.CAT_ID = c.CAT_ID
), sp1.SUPP_PRICE FROM gl271222.supplier_pricing sp1,gl271222.product p
WHERE p.PRO_ID = sp1.PROD_ID and sp1.SUPP_PRICE IN (
SELECT MIN(sp.SUPP_PRICE) FROM gl271222.supplier_pricing sp,gl271222.product p
WHERE p.PRO_ID = sp.PROD_ID 
GROUP BY p.CAT_ID );


-- Q7
/*
6)
7)Display the Id and Name of the Product ordered after “2021-10-05”.
*/

SELECT p.PRO_ID, p.PRO_NAME FROM gl271222.`order` o, gl271222.supplier_pricing sp1,gl271222.product p

WHERE o.PRICING_ID = sp1.PRICING_ID
AND sp1.PROD_ID = p.PRO_ID
AND o.ORD_DATE>'2021-10-05';

-- Q8
/*
8)Display customer name and gender whose names start or end with character 'A'.
*/

SELECT c.CUS_NAME, c.CUS_GENDER FROM gl271222.customer c WHERE UPPER(c.CUS_NAME) LIKE UPPER('A%')
OR  UPPER(c.CUS_NAME) LIKE UPPER('%A');

-- Q9
/*
9)Create a stored procedure to display supplier id, name, rating and Type_of_Service.
 For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”,
 If rating >2 print “Average Service” else print “Poor Service”.
 
*/

CREATE DEFINER = 'root'@'localhost'
PROCEDURE gl271222.SUPPLIER_RATING_PRC()
this_proc:
BEGIN
SELECT s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS Average ,
CASE WHEN AVG(r.RAT_RATSTARS) = 5 THEN  'Excellent Service'
WHEN AVG(r.RAT_RATSTARS) >4 THEN 'Good Service'
WHEN AVG(r.RAT_RATSTARS)>2 THEN 'Average Service'
ELSE 'Poor Service' END AS Type_of_Service
FROM  gl271222.rating r, gl271222.`order` o, gl271222.supplier_pricing sp,
 gl271222.supplier s
WHERE o.ORD_ID = r.ORD_ID
AND sp.PRICING_ID = o.PRICING_ID
AND s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID;
END;












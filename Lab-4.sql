/*An E-commerce website manages its data in the form of various tables.*/

/*1)	You are required to create tables for supplier,customer,category,product,supplier_pricing,order,
		rating to store the data for the E-commerce with the schema definition given below.*/
        
/* Creating Database*/
CREATE DATABASE IF NOT EXISTS `order-details`;
USE `order-details`;

/* Creating Tables*/
CREATE TABLE IF NOT EXISTS SUPPLIER (
    SUPP_ID INT NOT NULL,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(10) NOT NULL,
    PRIMARY KEY (SUPP_ID)
);
CREATE TABLE IF NOT EXISTS CUSTOMER (
    CUS_ID INT NOT NULL,
    CUS_NAME VARCHAR(50) NOT NULL,
    CUS_PHONE VARCHAR(50) NOT NULL,
    CUS_CITY VARCHAR(50) NOT NULL,
    CUS_GENDER CHAR NOT NULL,
    PRIMARY KEY (CUS_ID)
);
CREATE TABLE IF NOT EXISTS CATEGORY (
    CAT_ID INT NOT NULL,
    CAT_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS PRODUCT (
    PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'DUMMY',
    PRO_DESC VARCHAR(60),
    CAT_ID INT NOT NULL,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES CATEGORY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING (
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES SUPPLIER (SUPP_ID)
);
CREATE TABLE IF NOT EXISTS `ORDER` (
    ORD_ID INT NOT NULL,
    ORD_AMOUNT INT NOT NULL,
    ORDER_DATE DATE,
    CUS_ID INT NOT NULL,
    PRICING_ID INT NOT NULL,
    PRIMARY KEY (ORD_ID),
    FOREIGN KEY (CUS_ID)
        REFERENCES CUSTOMER (CUS_ID),
    FOREIGN KEY (PRICING_ID)
        REFERENCES SUPPLIER_PRICING (PRICING_ID)
);
CREATE TABLE IF NOT EXISTS RATING (
    RAT_ID INT NOT NULL,
    ORD_ID INT NOT NULL,
    RAT_RATSTARS INT NOT NULL,
    PRIMARY KEY (RAT_ID),
    FOREIGN KEY (ORD_ID)
        REFERENCES `ORDER` (ORD_ID)
);

/*2)	Insert the following data in the table created above*/

/*Inserting data into Tables*/

/* Inserting values in SUPPLIER Table*/
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
/* Inserting values in CUSTOMER Table*/
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
/* Inserting values in CATEGORY Table*/
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
/* Inserting values in PRODUCT Table*/
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
/* Inserting values in SUPPLIER_PRICING Table*/
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
/* Inserting values in ORDER Table*/
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
/* Inserting values in RATING Table*/
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

/*Queries on database*/
USE `ORDER-DETAILS`;

/* 3)  Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */

SELECT COUNT(T2.CUS_GENDER) AS 'No. of Customers', T2.CUS_GENDER AS 'Gender'
FROM (SELECT T1.CUS_ID, T1.CUS_GENDER FROM (SELECT `ORDER`.*, CUSTOMER.CUS_GENDER FROM `ORDER`INNER JOIN CUSTOMER 
WHERE `ORDER`.CUS_ID = CUSTOMER.CUS_ID HAVING `ORDER`.ORD_AMOUNT >= 3000) AS T1 GROUP BY T1.CUS_ID) AS T2
GROUP BY T2.CUS_GENDER;

/* 4)  Display all the orders along with product name ordered by a customer having Customer_Id=2 */

SELECT T3.CUS_ID AS 'Customer ID', T3.PRO_NAME AS 'Product Name', T3.ORD_ID AS 'Order ID', T3.ORD_AMOUNT AS 'Order Amount',
T3.ORDER_DATE, T3.PRICING_ID AS 'Pricing ID'FROM(SELECT `ORDER`.*, T2.PRO_NAME, T2.PRO_ID FROM `ORDER` INNER JOIN(
SELECT T1.PRO_ID, T1.PRICING_ID, PRODUCT.PRO_NAME FROM SUPPLIER_PRICING AS T1 INNER JOIN PRODUCT
WHERE T1.PRO_ID = PRODUCT.PRO_ID) AS T2 ON `ORDER`.PRICING_ID = T2.PRICING_ID HAVING `ORDER`.CUS_ID = 2
) AS T3;

/* Alternate method for Q.4*/

SELECT PRODUCT.PRO_NAME, `ORDER`.* FROM `ORDER`, SUPPLIER_PRICING, PRODUCT 
WHERE `ORDER`.CUS_ID = 2 AND `ORDER`.PRICING_ID = SUPPLIER_PRICING.PRICING_ID 
AND SUPPLIER_PRICING.PRO_ID = PRODUCT.PRO_ID;

/* 5)	Display the Supplier details who can supply more than one product. */

SELECT SUPPLIER.* FROM SUPPLIER WHERE SUPPLIER.SUPP_ID IN(SELECT SUPP_ID FROM SUPPLIER_PRICING HAVING COUNT(SUPP_ID)>1);

/* 6)   Find the least expensive product from each category and print the table with 
        category id, name, product name and price of the product*/
        
SELECT T3.CAT_ID AS 'Category ID', T3.CAT_NAME AS 'Category Name', T3.PRO_ID AS 'Product ID',
T3.PRO_NAME AS 'Product Name', MIN(T3.SUPP_PRICE) AS 'Minimum Price'FROM (
SELECT CATEGORY.*, T2.PRO_NAME, T2.SUPP_PRICE, T2.PRO_ID FROM CATEGORY INNER JOIN(
SELECT T1.*, SUPPLIER_PRICING.PRICING_ID, SUPPLIER_PRICING.SUPP_ID, SUPPLIER_PRICING.SUPP_PRICE FROM PRODUCT AS T1 
INNER JOIN SUPPLIER_PRICING WHERE T1.PRO_ID = SUPPLIER_PRICING.PRO_ID)AS T2 ON CATEGORY.CAT_ID = T2.CAT_ID
)AS T3 GROUP BY T3.CAT_ID;

/* Alternate method for Q.6*/

SELECT CATEGORY.CAT_ID, CATEGORY.CAT_NAME, PRODUCT.PRO_ID, PRODUCT.PRO_NAME, MIN(SUPPLIER_PRICING.SUPP_PRICE) 
FROM CATEGORY, PRODUCT, SUPPLIER_PRICING WHERE CATEGORY.CAT_ID = PRODUCT.CAT_ID AND 
PRODUCT.PRO_ID = SUPPLIER_PRICING.PRO_ID GROUP BY CAT_ID;

/* 7)   Display the Id and Name of the Product ordered after “2021-10-05”.*/

SELECT T3.PRO_ID AS 'Product ID', T3.PRO_NAME AS 'Product Name', T3.ORDER_DATE AS 'Order Date' FROM(
SELECT `ORDER`.*, T2.PRO_ID, T2.PRO_NAME FROM `ORDER` INNER JOIN( SELECT T1.*, PRODUCT.PRO_NAME FROM 
SUPPLIER_PRICING AS T1 INNER JOIN PRODUCT ON T1.PRO_ID = PRODUCT.PRO_ID) AS T2 
ON `ORDER`.PRICING_ID = T2.PRICING_ID) AS T3 HAVING T3.ORDER_DATE > '2021-10-05';

/* Alternate method for Q.7*/

SELECT PRODUCT.PRO_ID, PRODUCT.PRO_NAME, `ORDER`.ORDER_DATE FROM `ORDER` 
INNER JOIN SUPPLIER_PRICING ON `ORDER`.PRICING_ID = SUPPLIER_PRICING.PRICING_ID
INNER JOIN PRODUCT ON SUPPLIER_PRICING.PRO_ID = PRODUCT.PRO_ID WHERE `ORDER`.ORDER_DATE > '2021-10-05';

/* 8)   Display customer name and gender whose names start or end with character 'A'.*/

SELECT CUSTOMER.CUS_NAME AS 'Customer Name', CUSTOMER.CUS_GENDER AS 'Gender' FROM CUSTOMER WHERE CUSTOMER.CUS_NAME LIKE 'A%' OR CUSTOMER.CUS_NAME LIKE '%A';

/*9)   Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
	   For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
	   If rating >2 print “Average Service” else print “Poor Service”. */
	
DELIMITER //
CREATE PROCEDURE getRating()
BEGIN
SELECT T4.SUPP_ID AS 'Supplier ID', T4.SUPP_NAME AS 'Supplier Name', 
(SUM(T4.RAT_RATSTARS)/COUNT(T4.RAT_RATSTARS)) AS 'Average Rating',
CASE 
WHEN T4.RAT_RATSTARS = 5 THEN 'Excellent Service'
WHEN T4.RAT_RATSTARS > 4 THEN 'Good Service'
WHEN T4.RAT_RATSTARS > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS 'Type of Service'
FROM (
SELECT T3.*, SUPPLIER_PRICING.RAT_RATSTARS FROM SUPPLIER AS T3 INNER JOIN(
SELECT T2.*, `ORDER`.ORD_ID, `ORDER`.RAT_RATSTARS FROM SUPPLIER_PRICING AS T2 INNER JOIN(
SELECT T1.*, RATING.RAT_RATSTARS FROM `ORDER` AS T1 INNER JOIN 
RATING ON RATING.ORD_ID = T1.ORD_ID
) `ORDER` ON `ORDER`.PRICING_ID = T2.PRICING_ID 
) SUPPLIER_PRICING ON SUPPLIER_PRICING.SUPP_ID = T3.SUPP_ID
) AS T4 GROUP BY T4.SUPP_ID ORDER BY SUPP_ID;
END //
DELIMITER ;

CALL getRating();
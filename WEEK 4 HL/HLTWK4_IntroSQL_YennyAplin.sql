-- Home Learning Task (HLT WEEK 4: First Task: Introduction to SQL)

-- 1) Create a relational database of your own choice It is must be a meaningful/thought out database

DROP DATABASE IF EXISTS restaurant;
CREATE DATABASE restaurant;	

-- 2) Your table must have a primary key and the correct datatypes. Include a minimum of 5 fields in at least one of the tables

use restaurant;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
	customerId int NOT NULL,
  	FirstName VARCHAR(200) NOT NULL,
  	LastName VARCHAR(200) NOT NULL,
    Email VARCHAR(200) NOT NULL,
    Address VARCHAR(200) NOT NULL,
  	City VARCHAR(200) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
  	PRIMARY KEY (customerId)
);

-- 3) View and show table structures and data to make sure they are setup correctly

Select * from customers;

-- 4) Enter records into table and view them. Make sure your tables has 10 records

INSERT INTO customers VALUES (1,'Maggi','Domney','mdomney0@wisdompets.com','53177 Fieldstone Pass','San Bernardino','760-702-5469'),(2,'Javier','Dawks','jdawks1@red30design.com','25629 Brown Trail','Hartford','860-906-1459'),
(3,'Aleen','Fasey','afasey2@kinetecoinc.com','41967 Mockingbird Court','Boca Raton','561-410-2222'),
(4,'Taylor','Jenkins','tjenkins@rouxacademy.org','968 Bartillon Park','Fort Lauderdale','954-294-7424'),
(5,'Imogen','Kabsch','ikabsch@landonhotel.com','222 Hudson Point','Anderson','864-326-7456'),
(6,'Dunc','Winny','dwinny5@kinetecoinc.com','6 Derek Avenue','Columbus','706-389-4923'),
(7,'Cammi','Kynett','ckynett6@orangevalleycaa.org','237 Homewood Hill','Washington','202-798-6252'),
(8,'Steffie','Kleis','skleis7@wisdompets.com','360 Little Fleur Park','Evansville','812-301-6915'),
(9,'Carilyn','Calver','ccalver8@samoca.org','3664 Emmet Circle','Dulles','571-718-5931'),
(10,'Barbara-anne','Sweet','bsweet9@samoca.org','257 Mallory Drive','San Antonio','210-776-2859'),

Select * from customers;

-- 5) Update a record

update customers
set email = 'jdachange@red30design.com',
Phone = '860-906-1414'
where customerId = 2;

select * from customers;

-- 6) Delete a record

delete from customers
where customerId = 10;

select * from customers;

-- 7) Create a second table that references the first tables primary key

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
	orderId int NOT NULL,
    customerId int NOT NULL,
    orderDate DATETIME DEFAULT NULL,
   	PRIMARY KEY(orderId),
  	FOREIGN KEY (customerId) REFERENCES customers(customerId)
);


INSERT INTO orders VALUES (1,5,'2019-02-01 17:32:00'),
(2,3,'2019-02-02 16:52:00'),
(3,1,'2019-02-02 16:53:00'),
(4,6,'2019-02-02 16:58:00'),
(5,7,'2019-02-03 12:04:00'),
(6,9,'2019-02-04 14:31:00'),
(7,2,'2019-03-15 16:22:00'),
(8,4,'2019-03-15 18:29:00'),
(9,8,'2019-03-15 19:25:00');


select * from orders;


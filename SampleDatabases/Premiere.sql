Drop database premiere;
Create database premiere;
use premiere;

CREATE TABLE Rep
(
RepNum smallint auto_increment PRIMARY KEY,
LastName VarCHAR(15),
FirstName VarCHAR(15),
Street VarCHAR(15),
City VarCHAR(15),
State CHAR(2),
Zip CHAR(5),
Commission DECIMAL(7,2),
Rate DECIMAL(3,2)
) engine=innoDB;

CREATE TABLE Customer
(
CustomerNum smallint auto_increment PRIMARY KEY,
CustomerName varCHAR(35) NOT NULL,
Street varCHAR(15),
City varCHAR(15),
State varCHAR(2),
Zip CHAR(5),
Balance DECIMAL(8,2),
CreditLimit DECIMAL(8,2),
RepNum smallint,
Foreign Key (RepNum) references Rep (RepNum)
)engine=innoDB;

CREATE TABLE Orders
(
OrderNum smallint auto_increment PRIMARY KEY,
OrderDate DATE,
CustomerNum smallint,
Foreign Key (CustomerNum) references Customer (CustomerNum)
) engine=innoDB;

CREATE TABLE Part
(
PartNum CHAR(4) PRIMARY KEY,
Description varCHAR(15),
OnHand DECIMAL(4,0),
Class CHAR(2),
Warehouse CHAR(1),
Price DECIMAL(6,2)
) engine=innoDB;

CREATE TABLE OrderLine
(
OrderNum smallint not null,
PartNum CHAR(4) not null,
NumOrdered DECIMAL(3,0),
QuotedPrice DECIMAL(6,2),
PRIMARY KEY (OrderNum, PartNum),
Foreign Key (OrderNum) references Orders (OrderNum),
Foreign Key (PartNum) references Part (PartNum)
) engine=innoDB;



INSERT INTO Rep
VALUES
(null,'Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05);
INSERT INTO Rep
VALUES
(null,'Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07);
INSERT INTO Rep
VALUES
(null,'Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);
INSERT INTO Rep
VALUES
(null,'Blogg','Joe','123 Green St','Grove','FL','33321',29500.00,0.05);


INSERT INTO Customer
VALUES
(null,'Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,1);
INSERT INTO CUSTOMER
VALUES
(null,'Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,2);
INSERT INTO CUSTOMER
VALUES
(null,'Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,3);
INSERT INTO CUSTOMER
VALUES
(null,'The Everything Shop','1828 Raven','Crystal','FL','33503',4000.25,5000.00,2);
INSERT INTO CUSTOMER
VALUES
(null,'Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,3);
INSERT INTO CUSTOMER
VALUES
(null,'Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,1);
INSERT INTO CUSTOMER
VALUES
(null,'Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,3);
INSERT INTO CUSTOMER
VALUES
(null,'Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,2);
INSERT INTO CUSTOMER
VALUES
(null,'Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,2);
INSERT INTO CUSTOMER
VALUES
(null,'All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,1);
INSERT INTO CUSTOMER
VALUES
(null,'Brookings Direct','12 Colombo','Sheldon','FL','33553',585.50,10000.00,2);
INSERT INTO CUSTOMER
VALUES
(null,'Kennedy Computing','555 High',null,null,null,500.50,2500.00,3);



INSERT INTO ORDERS
VALUES
(null,'2007-10-20',1);
INSERT INTO ORDERS
VALUES
(null,'2007-10-20',3);
INSERT INTO ORDERS
VALUES
(null,'2007-10-21',4);
INSERT INTO ORDERS
VALUES
(null,'2007-10-21',2);
INSERT INTO ORDERS
VALUES
(null,'2007-10-23',7);
INSERT INTO ORDERS
VALUES
(null,'2007-10-23',1);
INSERT INTO ORDERS
VALUES
(null,'2007-10-23',7);
INSERT INTO ORDERS
VALUES
(null,'2007-10-23',11);

INSERT INTO ORDERS
VALUES
(null,'2007-10-25',11);


INSERT INTO PART
VALUES
('AT94','Iron',50,'HW','3',24.95);
INSERT INTO PART
VALUES
('BV06','Home Gym',45,'SG','2',794.95);
INSERT INTO PART
VALUES
('CD52','Microwave Oven',32,'AP','1',165.00);
INSERT INTO PART
VALUES
('DL71','Cordless Drill',21,'HW','3',129.95);
INSERT INTO PART
VALUES
('DR93','Gas Range',8,'AP','2',495.00);
INSERT INTO PART
VALUES
('DW11','Washer',12,'AP','3',399.99);
INSERT INTO PART
VALUES
('FD21','Stand Mixer',22,'HW','3',159.95);
INSERT INTO PART
VALUES
('KL62','Dryer',12,'AP','1',349.95);
INSERT INTO PART
VALUES
('KT03','Dishwasher',8,'AP','3',595.00);
INSERT INTO PART
VALUES
('KV29','Treadmill',9,'SG','2',1390.00);



INSERT INTO OrderLine
VALUES
(1,'AT94',11,21.95);
INSERT INTO OrderLine
VALUES
(2,'DR93',1,495.00);
INSERT INTO OrderLine
VALUES
(2,'DW11',1,399.99);
INSERT INTO OrderLine
VALUES
(3,'KL62',4,329.95);
INSERT INTO OrderLine
VALUES
(4,'KT03',2,595.00);
INSERT INTO OrderLine
VALUES
(5,'BV06',2,794.95);
INSERT INTO OrderLine
VALUES
(5,'CD52',4,150.00);
INSERT INTO OrderLine
VALUES
(6,'DR93',1,495.00);
INSERT INTO OrderLine
VALUES
(7,'KV29',2,1290.00);
INSERT INTO OrderLine
VALUES
(8,'BV06',1,750.00);
INSERT INTO OrderLine
VALUES
(8,'KV29',2,1290.00);
INSERT INTO OrderLine
VALUES
(8,'CD52',3,1290.00);
INSERT INTO OrderLine
VALUES
(9,'DL71',3,129.95);
INSERT INTO OrderLine
VALUES
(9,'KL62',5,325.00);

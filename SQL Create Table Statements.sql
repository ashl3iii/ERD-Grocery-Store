/* create Database */
CREATE DATABASE GroceryStore2237871 


/* create Store table */
CREATE TABLE Store
(Store_ID Char(3) Not Null, 
Store_Address Varchar(50) Not Null,
PRIMARY KEY (Store_ID))

/* insert values into Store table: sample data and custom data */
INSERT INTO Store (Store_ID, Store_Address)
VALUES 
(854, '22556 Elm St'),
(778, '341 Main St'),
(159, '13636 Fir St'),
(369, '940 Green St'),
(354, '820 Birch Rd'),
(696, '710 Edison Dr'),
(674, '14496 Maple Way'),
/* from here, store_ID provided but store address not provided, so i created my own address data */
(247, '0 Robinson Plaza'),
(348, '909 Mackenzie Rd'),
(989, '24 Holland Way')


/* create Item table: all from sample data provided */
CREATE TABLE Item 
(Item_ID Varchar(6) Not Null,
Brand Varchar(50) Not Null,
Description Varchar(100) Not Null,
Price Decimal(7,2) Not Null,
Cost Decimal(7,2) Not Null,
Shape Varchar(50) Not Null,
Size Varchar(50) Not Null,
UPC Char(6) Not Null,
Weight Decimal(7,2) Not Null,
Taxable Char(1) Not Null,
PRIMARY KEY (Item_ID))

/* insert values into Item table: all from sample data provided */
INSERT INTO Item (Item_ID, Brand, Description, Price, Cost, Shape, Size, UPC, Weight, Taxable)
VALUES 
(12, 'Nabisco', 'Cookies', 2.25, 1.00, 'Oval', '23x5x20', 224852, 22.40, 1),
(145, 'Kleenex', 'Tissues', 2.99, 1.00, 'Rectangle', '3x19x4', 178965, 34.00, 0),
(1566, 'HomeBrand', 'Spagehetti', 0.99, 0.50, 'Round', '3x3x3', 698547, 3.00, 0),
(2365, 'Kellogg', 'Cereal', 1.99, 0.50, 'Round', '10x10x10', 557858, 18.00, 1),
(256, 'Hersey', 'Candy', 3.99, 2.00, 'Rectangle', '4x16x6', 123058, 52.80, 0),
(335, 'DelMonte', 'Canned Fruit', 0.50, 0.10, 'Square', '3x3x3', 411255, 5.20, 1),
(3521, 'Nabisco', 'Crackers', 4.00, 2.00, 'Round', '4x4x4', 254413, 2.00, 0),
(4587, 'Kraft', 'Cheese', 6.00, 4.00, 'Rectangle', '6x12x3', 845532, 0.11, 0),
(658, 'PhillpMorris', 'Cigarettes', 5.00, 3.00, 'Square', '8x8x8', 596543, 89.00, 0),
(84854, 'Quaker', 'Oatmeal', 2.50, 1.00, 'Square', '2x2x2', 556487, 1.00, 0)


/* create Inventory table */
CREATE TABLE Inventory
(Store_ID Char(3) Not Null,
Item_ID Varchar(6) Not Null,
Item_Quantity Integer Null,
PRIMARY KEY (Store_ID, Item_ID), 
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID))

/* insert values into Inventory table: sample data and custom data */
INSERT INTO Inventory (Store_ID, Item_ID, Item_Quantity)
VALUES
/* store 1 */
(159, 1566, 31),
(159, 335, 27), 
(159, 4587, 30), /* created item_quantity data */
/* store 2 */
(247, 145, 56), 
/* store 3 */
(348, 256, 100), 
/* store 4 */
(354, 1566, 4),
/* created item_quantity data */
(354, 145, 10), 
(354, 3521, 113),
(354, 84854, 300),
/* store 5 */
(369, 3521, 113), 
(369, 4587, 23), /* created item_quantity data */
/* store 6 */
(674, 2365, 0), 
(674, 4587, 23), 
(674, 12, 23), /* created item_quantity data */
(674, 658, 38), /* created item_quantity data */
/* store 7 */ 
(696, 12, 23),  
(696, 658, 38), 
(696, 2365, 10), /* created item_quantity data */
(696, 4587, 5), /* created item_quantity data */ 
/* store 8 */
(778, 1566, 31), 
(778, 84854, 350), 
(778, 145, 50), /* created item_quantity data */
/* store 9 */
(854, 12, 10), 
(854, 658, 10), 
(854, 256, 13), /* created item_quantity data */
(854, 2365, 10), /* created item_quantity data */
/* store 10 */
(989, 145, 560) 


/* create Employee table */ 
CREATE TABLE Employee 
(Emp_ID Char(2) Not Null,
EmpName Varchar(50) Not Null,
SSN Char(9) Not Null,
Phone Char(10) Not Null,
StoreRef_ID Char(3) Not Null,
Address Varchar(50) Not Null,
PayType Char(1) Not Null,
Password Varchar(50) Null,
Manager Char(3) Null,
Email Varchar(50) Null,
Date_Hired Date Null,
Date_Start Date Not Null,
Date_End Date Null,
Pay Decimal(7,2) Null,
Pw_Change_Date Date Null, 
Pay_Rate Decimal(7,2) Null,
PRIMARY KEY (Emp_ID),
FOREIGN KEY (StoreRef_ID) REFERENCES Store(Store_ID))

/* insert values into Employee table */
/* Pay column indicates per annum or per hour basis */
/* Pw_Change_Date is data created by me */
/* Rest is all from sample data provided  */
INSERT INTO Employee (Emp_ID, EmpName, SSN, Phone, StoreRef_ID, Address, PayType, Password, Manager, Email, Date_Hired, Date_Start, Date_End, Pay, Pw_Change_Date, Pay_Rate)
VALUES 
(1, 'Darrel Philbin', 654269856, 5489659874, 854, '258 Cumberland dr', 0, '1234', 14, 'baldman@gmail.com', NULL, '1985-04-05', '2011-02-02', 20.00, '2011-01-01', 10.25),
(10, 'Jerry Garcia', 758965897, 6521458569, 247, '214 Q st', 1, '1234', 9, 'govperson@gov.gov', NULL, '1990-09-24', NULL, 52000.00, '2028-02-02', 11.50),
(11, 'Lawarnce Tom', 625458569, 9658745632, 159, '2154 Beech st', 0, NULL, 14, NULL, NULL, '1989-01-20', '2011-09-01', 15.00, '2011-02-21', NULL),
(12, 'Dexter Robert', 254125478, 1111111111, 778, '365 Moon dr', 0, NULL, 15, NULL, NULL, '1990-05-06', NULL, 12.25, '2024-04-01', NULL),
(13, 'Mark Nick', 563258965, 2225478512, 989, '65412 B St', 0, NULL, 15, NULL, NULL, '1998-02-05', NULL, 8.25, '2033-02-02', NULL),
(14, 'Jeremy David', 111111112, 2356895654, 159, '2 Molly Way', 1, NULL, 9, NULL, NULL, '2000-06-03', NULL, 16000.00, '2011-02-02', NULL),
(15, 'Luke Ted', 111111144, 2144544123, 354, '65 Southland Av', 1, NULL, 9, NULL, NULL, '2004-09-09', NULL, 20000.00, '2011-02-02', NULL),
(2, 'Ricky Tanner', 1256514252, 6988532587, 696, '1587 H st', 0, 'Abcdef', 4, 'omegaman@aol.com', NULL, '1990-06-08', '1999-06-10', 10.00, '1999-06-09', 11.25),
(3, 'Susan Phillips', 145969658, 9856984523, 369, '695 LMNOP st', 0, 'Password', 4, 'streetsmartkid@hampster.edu', NULL, '1972-06-09', NULL, 15.00, '2010-03-12', 8.50),
(4, 'George Scott', 147589652, 2586521452, 696, '4521 Gold st', 1, 'Alpha', 9, NULL, NULL, '1999-07-25', NULL, 42000.00, '2014-02-15', 9.50),
(5, 'Erin Albernathy', 256985698, 5896583541, 369, '635 Number In', 0, 'Bottle', 6, 'drinkerster@gmail.com', NULL, '1998-12-20', NULL, 30.00, '2009-05-02', 8.50),
(6, 'Ted Smith', 352956587, 4736593569, 369, '12 S st', 1, 'Worksu...', 9, NULL, NULL, '1989-06-08', NULL, 50000.00, '2011-02-02', 10.00),
(7, 'Harry Buts', 458521658, 2586584763, 674, '1 wonder st', 0, 'Password', 6, NULL, NULL, '1970-10-20', NULL, 12.00, '2011-08-06', 12.00),
(8, 'Maynar Teener', 256656521, 2596573257, 674, '24 nice In', 0, 'Password', 6, 'Meme585@gmail.com', NULL, '2005-06-04', NULL, 9.25, '2012-05-01', 12.00),
(9, 'Matt Longfellow', 958786548, 5249868525, 354, '6144 Computer way', 1, 'Password', NULL, 'thisisshort@az.com', NULL, '2000-09-21', NULL, 60000.00, '2015-04-11', 11.50),
/* sample data provided from employee report ss, only EmpName, SSN, Phone, Address, Date_start, Email, Pay_Rate provided, rest is custom data created by me */
/* assume the simpsons work at 354 and is managed by matt longfellow */
(16, 'Lisa Simpson', 123786548, 4569868525, 354, '601 Computer Way', 1, 'Password1', 9, 'lisa@az.com', NULL, '2000-01-01', NULL, NULL, '2020-01-01', 11.50),
(17, 'Bart Simpson', 123786548, 4569868525, 354, '601 Computer Way', 0, 'Password2', 9, 'bart@az.com', NULL, '2010-01-09', NULL, NULL, '2022-01-01', 7.50),
(18, 'Maggy Simpson', 902786548, 4569868525, 354, '601 Computer Way', 0, 'Password3', 9, 'maggy@az.com', NULL, '2010-01-03', NULL, NULL, '2022-01-01', 7.50),
(19, 'Marge Simpson', 902786548, 4569868525, 354, '601 Computer Way', 0, 'Password4', 9, 'marge@az.com', NULL, '2007-01-05', NULL, NULL, '2022-01-01', 11.00)


/* create Dependency table (weak entity) */
CREATE TABLE Dependency
(Dep_ID Char (2) Not Null, 
Emp_ID Char(2) Not Null,
DepName Varchar(50) Not Null,
Relationship  Varchar(50) Not Null,
PRIMARY KEY (Dep_ID, Emp_ID),
FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID))

/* insert values into Dependency table: Dep_ID, DepName, Relationship is custom data created by me */
INSERT INTO Dependency (Dep_ID, Emp_ID, DepName, Relationship)
VALUES 
(1, 1, 'Rob Johnson', 'Father'),
(2, 1, 'Marrie Johnson', 'Mother'),
(3, 2, 'Dream Harrison', 'Son'),
(4, 2, 'Angel Harrison', 'Daughter'),
(5, 3, 'Alison Harrison', 'Wife'),
(6, 3, 'Alex Harrison', 'Father'),
(7, 4, 'Lucy Lau', 'Sister'),
(8, 4, 'Thomas Lau', 'Brother'),
(9, 5, 'Ashley Tan', 'Wife'),
(10, 6, 'Jake Paul', 'Husband'),
(11, 7, 'Ally Koh', 'Wife'),
(12, 7, 'Chloe Koh', 'Daughter'),
(13, 8, 'Robbie William', 'Husband'),
(14, 8, 'Melissa Tims', 'Father'),
(15, 9, 'Ace Egerton', 'Father'),
(16, 10, 'Thomas Edison', 'Husband'),
(17, 10, 'Jerry Everson', 'Father'),
(18, 11, 'Sebestian Will', 'Father'),
(19, 12, 'Ashley Tisdale', 'Wife'),
(20, 12, 'Austin Butler', 'Father'),
(21, 12, 'Vanessa Hudgens', 'Daughter'),
(22, 13, 'Kelly Clarkson', 'Wife'),
(23, 14, 'Chris Vines', 'Father'),
(24, 14, 'Pharrel Williams', 'Husband'),
(25, 15, 'Lexy Liu', 'Sister'),
(26, 15, 'Simi Liu', 'Brother'),
(27, 16, 'Bruce Jenner', 'Father'),
(28, 16, 'Kris Jenner', 'Mother'),
(29, 17, 'Scott Disick', 'Father'),
(30, 18, 'Kendall Kelly', 'Mother'),
(31, 19, 'Perry Edwards', 'Mother'),
(32, 19, 'Son Heung Min', 'Father'),
(33, 19, 'Son Sekyung', 'Sister')


/* create Cashier table */
CREATE TABLE Cashier
(Cashier_ID Char(2) Not Null,
Store_ID Char(3) Not Null,
PRIMARY KEY (Cashier_ID), 
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
FOREIGN KEY (Cashier_ID) REFERENCES Employee(Emp_ID))

/* insert values into Cashier table: sample data and custom data */
INSERT INTO Cashier (Cashier_ID, Store_ID)
VALUES 
(1, 854),
(2, 696),
(3, 369),
(5, 369),
(7, 674),
(8, 674),
(11, 159),
(12, 778),
(13, 989),
(15, 354), /* luke ted is both a manager and cashier */
/* %simpson is made up store_ID and cashier_ID */
(16, 354), 
(17, 354),
(18, 354),
(19, 354)


/* create Manager table */ 
CREATE TABLE Manager
(Manager_ID Char(2) Not Null,
Store_ID Char(3) Not Null,
IsDirector Char(1) Not Null, /* 0 means not a director, 1 means is a director */
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID))

/* insert values into Manager table: sample data provided */
INSERT INTO Manager (Manager_ID, Store_ID, IsDirector) 
VALUES 
(14, 159, 0),
(10,247, 0),
(10,348, 0),
(15,354, 0), 
(6,369, 0),
(6,674, 0),
(4,696, 0),
(15,778, 0),
(14,854, 0),
(15,989, 0),
/* MATT LONGFELLOW */
(9, 247, 1),
(9,	159, 1),
(9, 354, 1),
(9, 696, 1)


/* create Customer table */
CREATE TABLE Customer
(Cust_ID Char(4) Not Null,
CustName Varchar(50) Not Null,
Phone Char(10) Null,
Email Varchar(50) Null,
Date_Joined Date Not Null,
CustAddress Varchar(50) Not Null,
PRIMARY KEY (Cust_ID))

/* insert values into Customer table */
INSERT INTO Customer (Cust_ID, CustName, Phone, Email, Date_Joined, CustAddress)
VALUES 
(105, 'Master Shake', 5555555555, 'MixMaster@crimefighter.org', '2000-08-25', '9 Holland Avenue'),
(178, 'Bruce Wayne', 6619872145, 'IamBatman@crimefighter.org', '2000-01-09', '223 Clementi Avenue'),
(179, 'Seymoure Butes', 4789582145, 'SButes@education.edu', '2001-01-01', '212 Stella Rd'),
(50, 'Bob Hope', 6615552485, 'Bobhope@gmail.com', '2001-01-01', '912 Haw Par Villa St'),
(51, 'Renee Hicks', 4589854588, 'Dragonthing@aol.com', '2005-05-05', '322 Robinson St'),
(52, 'Scott Sheer', 4176521425, 'Scotts@hotmail.com', '2011-12-12', '12 Kenzingston Rd'),
(53, 'Colleen Mctyre', NULL, 'CMcT@ct.com', '2008-08-12', '6 Manhatten St'),
(58, 'Bart Simpson', NULL, NULL, '2001-06-06', '21 Soho Green'),
(67, 'Lisa Girl', 6619755896, NULL, '1999-04-09', '9 Blue Horizon'),
(99, 'Jeremy Scott', 4586895847, 'TheBigMan@gmail.com', '2000-01-09', '183 Tanjong Rhu Rd')


/* create Checkout table (transaction) */
CREATE TABLE Checkout
(Checkout_ID Char(2) Not Null, 
Store_ID Char(3) Not Null, 
Cust_ID Char(4) Not Null,
Cashier_ID Char(2) Not Null, 
Total_Amt Decimal(7,2) Not Null, 
Transaction_Date Date Not Null,
PRIMARY KEY (Checkout_ID),
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
FOREIGN KEY (Cashier_ID) REFERENCES Cashier(Cashier_ID))

/* insert values into Checkout table: Checkout_ID, Total_Amt is custom data, rest is sample data */
INSERT INTO Checkout (Checkout_ID, Store_ID, Cust_ID, Cashier_ID, Total_Amt, Transaction_Date)
VALUES 
(1, 854, 50, 1, 12.28, '2011-06-10'),  
(2, 778, 178, 12, 29.90, '2011-12-12'), 
(3, 159, 99, 11, 12.00, '2010-06-05'), 
(4, 369, 105, 3, 24.00, '2007-04-05'), 
(5, 354, 51, 15, 25.93, '2011-06-09'), 
(6, 696, 52, 2, 16.30, '2010-08-12'),
(7, 674, 179, 7, 14.86, '2009-11-05')


/* create Receipt table */
CREATE TABLE Receipt 
(Receipt_ID Char(2) Not Null,
Checkout_ID Char(2) Not Null,
Item_Order Char(2) Not Null,
Cust_ID Char(4) Not Null,
Store_ID Char(3) Not Null,
Cashier_ID Char(2) Not Null,
Subtotal Decimal(7,2) Not Null,
Tax Decimal(7,2) Null, 
Item_ID Varchar(6) Not Null,
Purchased_Qty Integer Not Null,
PRIMARY KEY (Receipt_ID, Checkout_ID, Item_Order),
FOREIGN KEY (Checkout_ID) REFERENCES Checkout(Checkout_ID),
FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
FOREIGN KEY (Cashier_ID) REFERENCES Cashier(Cashier_ID),
FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID))

/* insert values into Receipt table: Receipt_ID, Checkout_ID, Item_Order, Subtotal, Tax is custom data, rest in sample data */
/* assume that Tax is 8% gst */
INSERT INTO Receipt (Receipt_ID, Checkout_ID, Item_Order, Store_ID, Cust_ID, Cashier_ID, Item_ID, Subtotal, Tax, Purchased_Qty)
VALUES  
('1', 1, 1, 854, 50, 1, 256, 7.98, NULL, 2),  
('1', 1, 2, 854, 50, 1, 2365, 3.98, 0.32, 2), 
('2', 2, 1, 778, 178, 12, 145, 29.90, NULL, 10), 
('3', 3, 1, 159, 99, 11, 4587, 12.00, NULL, 2), 
('4', 4, 1, 369, 105, 3, 4587, 24.00, NULL, 4), 
('5', 5, 1, 354, 51, 15, 1566, 3.96, NULL, 4), 
('5', 5, 2, 354, 51, 15, 145, 8.97, NULL, 3), 
('5', 5, 3, 354, 51, 15, 3521, 8.00, NULL, 2), 
('5', 5, 4, 354, 51, 15, 84854, 5.00, NULL, 2),
('6', 6, 1, 696, 52, 2, 2365, 3.98, 0.32, 2),
('6', 6, 2, 696, 52, 2, 4587, 12.00, NULL, 2),
('7', 7, 1, 674, 179, 7, 12, 4.50, 0.36, 2),
('7', 7, 2, 674, 179, 7, 658, 10.00, NULL, 2)



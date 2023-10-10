USE GroceryStore2237871


/* query 1: (done)
Write a query to show the name of customer, 
the date of transaction made by the customer, 
the store where the transaction takes place, 
its manager’s name,			
the item brand, description and quantity purchased for the transaction 
and the employee who serves the transaction. */

SELECT DISTINCT C.CustName, S.Store_ID, S.Store_Address, E1.EmpName AS 'Manager of the Store', CO.Transaction_Date AS 'Transaction Date', I.Brand, I.Description, R.Purchased_Qty AS 'Quantity Purchased', E2.EmpName AS 'Served By'
FROM Customer C
JOIN Checkout CO ON C.Cust_ID = CO.Cust_ID
JOIN Store S ON S.Store_ID = CO.Store_ID
JOIN Receipt R ON R.Checkout_ID = CO.Checkout_ID
JOIN Item I ON I.Item_ID = R.Item_ID
JOIN Manager M ON M.Store_ID = CO.Store_ID
JOIN Cashier CS ON CS.Store_ID = S.Store_ID		
JOIN Employee E2 ON E2.Emp_ID = CO.Cashier_ID
JOIN Employee E1 ON E1.Emp_ID = M.Manager_ID


/* query 2: (done)
Write a query to show the following store details and their item inventories. */

SELECT M.Manager_ID AS 'Store Manager ID', E.EmpName AS 'Name of Manager', S.Store_ID AS 'Store managed', I.Item_ID AS 'Item', I.Item_Quantity AS 'Quantity on inventory'
FROM Manager M
JOIN Employee E ON M.Manager_ID = E.Emp_ID
JOIN Store S ON M.Store_ID = S.Store_ID
JOIN Inventory I ON I.Store_ID = S.Store_ID


/* query 3: (done)
Write a query to list all customers who bought not more than 2 items on any single transaction. (done) */ 

SELECT R.Cust_ID, C.CustName, SUM(R.Purchased_Qty) AS 'Total Quantity purchased'
FROM Customer C, Receipt R
WHERE R.Cust_ID = C.Cust_ID 
GROUP BY R.Cust_ID, C.CustName
HAVING SUM(R.Purchased_Qty) <= 2


/* query 4: (done)
Write a query to show the item_ID, its description, total amount ‘Retail’, based on Price and total amount based on 
cost ‘Wholesale’ for those items which are kept by at least 2 stores. */

SELECT I.Item_ID, I.Description, SUM(I.Price) AS 'Total amount ''Retail''', SUM(I.Cost) AS 'Total amount ''Wholesale'''
FROM Item I
JOIN Inventory INV ON I.Item_ID = INV.Item_ID
GROUP BY I.Item_ID, I.Description 
HAVING COUNT(DISTINCT INV.Store_ID) >= 2


/* query 5: (done)
Write a query to show the ID and name of employees and the ID and names 
their managers */

SELECT E1.Emp_ID, E1.EmpName AS 'Employee Name', E1.Manager AS 'Manager ID', E2.EmpName AS 'Manager Name', S.Store_ID, S.Store_Address
FROM Employee E1
JOIN Employee E2 ON E1.Manager = E2.Emp_ID 
JOIN Store S ON E2.StoreRef_ID = S.Store_ID
WHERE E2.EmpName = 'Luke Ted'


/* query 6: 
Write a query to list the emp_ID, name of manager and the boss’ ID and name 
together with the store_ID and its address where both the manager and the 
boss are stationed at the same store. */

SELECT DISTINCT E1.EmpName AS 'Name of Manager', M1.Manager_ID AS 'Manager ID', E2.EmpName AS 'Name of Boss', M2.Manager_ID AS 'Boss ID', S.Store_ID, S.Store_Address
FROM Employee E1, Manager M1, Employee E2, Manager M2, Store S
WHERE (E1.Emp_ID = M1.Manager_ID AND M1.IsDirector = 0) AND (E2.Emp_ID = M2.Manager_ID AND M2.IsDirector = 1) AND (E1.StoreRef_ID = E2.StoreRef_ID) AND (S.Store_ID = E1.StoreRef_ID)



USE classicmodels;

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM products;

/* query 1 */
SELECT CONCAT(firstName, ' ', lastName) AS 'fullName'
FROM employees
WHERE lastName LIKE '%on';

/* query 2 */
SELECT CONCAT(firstName, ' ', lastName) AS 'fullName'
FROM employees
WHERE firstName LIKE 'T%' AND firstName LIKE '%m';

/* query 3 */
SELECT CAST(AVG(buyPrice) AS DECIMAL(5,2)) AS 'averageBuyPrice'
FROM products;

/* query 4 */
SELECT products.productCode, productName, SUM(quantityOrdered) AS 'totalSales'
FROM products
INNER JOIN orderdetails
ON orderdetails.productCode = products.productCode
GROUP BY products.productCode;

/* query 5 */
SELECT productVendor, COUNT(productVendor) AS 'numOfProducts' 
FROM products
GROUP BY productVendor
HAVING COUNT(productVendor) >= 9;

/* query 6 */
SELECT productlines.productLine, productName, MIN(buyPrice) AS 'cheapestProduct'
FROM products
INNER JOIN productlines
ON productlines.productLine = products.productLine
GROUP BY products.productLine;

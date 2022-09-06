use premiere;

select * from customer;
select * from orderline;
select * from orders;
select * from part;
select * from rep;


-- Q1
create or replace view CustomersByCity as
select CustomerName, Street, City
from customer
order by City;
select * from customersbycity;

-- Q2
SELECT CustomerName, City, State
FROM customer
WHERE City NOT LIKE 'Grove';

--  Q3
select CustomerNum, CustomerName, Balance
from customer 
WHERE Balance >= 2000 
AND Balance <= 4000;
-- WHERE Balance BETWEEN 2000 AND 4000

-- Q4  
select avg(Balance) as "AverageBalance", min(Balance) as "MinBalance", max(Balance) as "MinBalance"
from customer;
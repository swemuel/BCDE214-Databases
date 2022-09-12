use premiere;

/* q1 */
delimiter $$
drop procedure spIncreasePrice$$

create procedure spIncreasePrice (IN warehousenum char(1), IN percent decimal(5,2))
begin
update part
set price = round(price + price * percent/100, 2)
where warehouse = warehousenum;
end$$

select * from part where warehouse = 2$$ -- BV06 = 794.95
call spIncreasePrice(2, 10.00)$$
select * from part where warehouse = 2$$ -- BV06 = 874.45

/* q2 */
drop procedure spWarehouseValue$$

create procedure spWarehouseValue (IN warehousenum char(1), OUT totalvalue decimal (8,2))
begin
select sum(price*onhand) as totalvalue from part 
where warehouse = warehousenum;
end$$

/* 
how to call a procedure with an OUT parameter
*/
call spWarehouseValue(1, @total);


/* q3 */

drop procedure if exists spOrdersValue$$

create procedure spOrdersValue(in newOrderNum smallint, out customerName varCHAR(35), out totalValue decimal (8,2))
begin
select customer.CustomerName as customerName, sum(orderline.QuotedPrice * orderline.NumOrdered) as totalValue
	from orderline
	inner join orders on orders.OrderNum = orderline.OrderNum
	inner join customer on customer.CustomerNum = orders.CustomerNum
where newOrderNum = orders.OrderNum
group by customer.CustomerName;
end$$

call spOrdersValue(4, @customerNum, @totalValue)$$



select * from customer$$
select * from orders$$
select * from orderline$$



/*
create procedure spOrdersValue (IN custnum integer, OUT custName char(20), OUT totalvalue decimal(8,2))
begin

select customername as custName, sum(numordered * quotedprice) as totalvalue
from orders inner join orderline on orders.ordernum = orderline.ordernum
            inner join customer on orders.customernum = customer.customernum  
where orders.customernum = custnum
group by orders.customernum, customername;

end$$

/*
call spOrdersValue(148, @custName, @totalvalue);
*/

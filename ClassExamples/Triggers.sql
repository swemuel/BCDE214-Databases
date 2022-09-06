use premiere;

create table PartPriceHistory 
(
	PartNum char(4),
	ChangeDate date,
    OldPrice decimal(6,2),
    OnHand DECIMAL(4,0)   
);

-- --------------------- trigger 1
-- step 1 delimiter
Delimiter $$

-- step 2 - drop trigger
drop trigger part_au_priceUpdate$$

-- step 3 - create trigger
create trigger part_au_priceUpdate after update on part
for each row 
begin
	if (old.Price <> new.price) then
		insert into PartPriceHistory(PartNum, ChangeDate, OldPrice, OnHand) 
		values (old.PartNum, now(), old.Price, old.OnHand);
    end if;
end;
$$

-- test the trigger
Delimiter ;

select * from Part; -- AT94 = 30.00

-- after update to activate the trigger 
update Part
set price = 60.00
where PartNum = 'AT94';

select * from Part; -- AT94 = 60.00

select * from PartPriceHistory;

-- --------------------- trigger 2

create table ReOrder
(
	PartNum char(4),
    Description varchar(15),
    OnHand decimal(4,0),
    TodaysDate Date
);

drop trigger part_au_reorderPart;

Delimiter $$
create trigger part_au_reorderPart 
after update on part
for each row 
begin
	if(new.OnHand < 10) then
		insert into ReOrder(PartNum, Description, OnHand, TodaysDate)
        values (old.PartNum, old.Description, new.OnHand, now());
    end if;
end;
$$
Delimiter ;
-- Test for trigger
select * from part; -- BV06 OnHand = 45
-- update
update part
set onHand = 5
where PartNum = 'BV06'; 
-- test again
select * from part; -- BV06 OnHand = 5
select * from ReOrder; -- 

-- --------------------- trigger 3
select * from orderline;
Delimiter $$

drop trigger orderline_ai_updateBalance $$

create trigger orderline_ai_updateBalance
after insert on orderline
for each row 
begin

	declare newCustomerNum smallint;
	select CustomerNum into newCustomerNum from orders
	where OrderNum = new.OrderNum;
	
    update customer
	set balance = balance + (new.QuotedPrice * new.NumOrdered)
    where CustomerNum = newCustomerNum;
	
end;

$$

Delimiter ;

select * from customer; -- cust 1 = 6550.00

insert into orderline values ('2', 'KV29', 5, 1550);

select * from customer; -- cust 1 = 6550.00
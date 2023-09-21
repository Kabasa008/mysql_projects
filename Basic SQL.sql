show tables;

select * from sales;

-- Create a view called 2022_Data
create view 2022_Data as
select GeoID, PID, Amount, SaleDate, Boxes, Amount/Customers as 'Amount Per Customer'
from sales 
where Amount >10000 and	GeoID = 'G1' and SaleDate >= '2022-01-01'
order by PID
limit 10;


-- Query a view called 2022_Data
select GeoID, PID, Amount, SaleDate, Boxes
from 2022_Data
limit 10;


-- Delete a view called 2022_Data
drop view 2022_Data;




select GeoID, PID, Amount, SaleDate, Boxes, Amount/Customers as 'Amount Per Customer'
from sales 
where Amount >10000 and	GeoID = 'G1' and year(SaleDate) = 2022
order by PID
limit 10;

select PID, sum(Amount)
from sales
group by PID
order by PID desc
limit 10;

select * 
from sales
where Boxes 
between 400 and 500
order by Amount
limit 10;






/* ------------------------------------------------------------------------------------------------------------------------ */


/* Home work tasks 1
Print details of shipments (sales) where amounts are > 2,000 and boxes are <100? */
select *
from sales
where Amount > 2000 and Boxes < 100;


/* Home work tasks 2
How many shipments (sales) each of the sales persons had in the month of January 2022? */
select SPID, sum(Boxes)
from sales
Where SaleDate
between '2022-01-01' and '2022-01-31'
group by SPID
order by SPID;


select SPID, sum(Boxes)
from sales
Where SaleDate >= '2022-01-01' and SaleDate < '2022-02-01'
group by SPID
order by SPID;


select SPID, count(Boxes)
from sales
Where SaleDate >= '2022-01-01' and SaleDate < '2022-02-01'
group by SPID
order by SPID;



/*--------------------------------------------------------------------------------------------------------------------------*/

select 
case
	when weekday(SaleDate) = 0 then 'Monday'
	when weekday(SaleDate) = 1 then 'Tuesday'
	when weekday(SaleDate) = 2 then 'Wednesday'
	when weekday(SaleDate) = 3 then 'Thursday'
	when weekday(SaleDate) = 4 then 'Friday'
	when weekday(SaleDate) = 5 then 'Saturday'
	else 'Sunday'
end
SaleDate, SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of Week'
from sales
where weekday(SaleDate) = 4;


select
case
	when weekday(SaleDate) = 0 then 'Monday'
	when weekday(SaleDate) = 1 then 'Tuesday'
	when weekday(SaleDate) = 2 then 'Wednesday'
	when weekday(SaleDate) = 3 then 'Thursday'
	when weekday(SaleDate) = 4 then 'Friday'
	when weekday(SaleDate) = 5 then 'Saturday'
	else 'Sunday'
end as 'DayofWeek', SaleDate, Amount, Boxes
from sales
where weekday(SaleDate) = 4
order by Amount;


select 
sum(Amount), 
case
	when weekday(SaleDate) = 0 then 'Monday'
    when weekday(SaleDate) = 1 then 'Tuesday'
    when weekday(SaleDate) = 2 then 'Wednesday'
    when weekday(SaleDate) = 3 then 'Thursday'
    when weekday(SaleDate) = 4 then 'Friday'
    when weekday(SaleDate) = 5 then 'Saturday'
    else 'Sunday'
end as Weekday
from sales
where SaleDate between '2022-01-01' and '2022-01-31'
group by Weekday;


select sum(Amount), sum(Boxes), weekday(SaleDate) as DayofWeek
from sales
group by DayofWeek;

select *
from people
where Team = 'Yummies' or Team = 'Delish';

select *
from people
where Team in ('Yummies', 'Delish');

select *
from people
where Salesperson like '%B%';

select 
    sum(Amount) as 'Total Amount',
    case
		when Boxes >= 300 then 'Regional distributor'
		when Boxes >= 100 then 'State distributor'
        else 'LGA distributor'
	end as Distributorship,
    sum(Boxes) as 'Total Boxes',
    sum(Customers) as 'Total Customers'
from sales
group by Distributorship;


/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX */


/* Compprehensive practice coding for working with Dates and Time functions in SQL */

select * from sales;
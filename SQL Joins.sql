/* ------------------------------------------------ Joins in My SQL ----------------------------------------------------------- */


/* Single Table Join! 
Get salesperson Name, Team Name and Location Name from the 'People Table' into the 'Sales Table' using a Join */
select s.*,
p.Salesperson,
p.Team,
p.Location
from sales as s
join people as p on p.SPID = s.SPID;


/* Multiple Table Join! 
Get Product Name, Category Name, Size, salesperson Name, Team Name and Location Name
from the 'Product' and 'People' Tables into the 'Sales' Table using a Join */
select s.*,
pr.product,
pr.Category,
pr.Size,
p.Salesperson,
p.Team,
p.Location,
s.Amount/s.Boxes as 'Price per Box'
from sales as s
join products as pr on pr.PID = s.PID
join people as p on p.SPID = s.SPID
order by s.PID;


/* Multiple Table Join! 
Get Product Name, Category Name, Size, salesperson Name, Team Name and Location Name
from the 'Product' and 'People' Tables into the 'Sales' Table using a Join */
select s.*,
pr.product,
pr.Category,
pr.Size,
p.Salesperson,
p.Team,
p.Location,
s.Amount/s.Boxes as 'Price per Box'
from sales as s
join products as pr on pr.PID = s.PID
join people as p on p.SPID = s.SPID
where s.SaleDate >= '2022-02-01' and s.SaleDate <= '2022-02-28' and s.GeoID in ('G2', 'G6')
order by s.PID;



select
s.SaleDate,
s.Amount,
s.Customers,
s.Boxes,
pr.product,
pr.Category,
pr.Size,
p.Salesperson,
p.Team,
p.Location,
g.Region,
g.Geo,
s.Amount/s.Boxes as 'Price per Box'
from sales as s
join products as pr on pr.PID = s.PID
join people as p on p.SPID = s.SPID
join geo as g on g.GeoID = s.GeoID
where s.SaleDate >= '2022-02-01'and s.SaleDate <= '2022-02-28'
and s.GeoID in ('G2', 'G6')
and s.Amount > 5000
and g.geo = 'UK'
and p.Team = ''
order by s.PID;
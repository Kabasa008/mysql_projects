select
pr.Product,
p.Salesperson,
g.Geo,
sum(s.Amount) as 'Amount',
round(sum(s.Amount)/sum(s.Customers), 1) as "Price Per Customer",
count(p.Salesperson) as 'Nos of Sales Person',
round(sum(pr.Cost_per_box), 1) as 'Cost Per Product'
from sales as s
join geo as g on g.GeoID = s.GeoID
join products as pr on pr.PID = s.PID
join people as p on p.SPID = s.SPID
group by pr.Product, p.Salesperson, g.Geo;


select
pr.Product,
round( sum(s.Amount) ) as TotalAmount
from sales as s
join products as pr on pr.PID = s.PID
group by pr.Product
order by TotalAmount desc
limit 10;
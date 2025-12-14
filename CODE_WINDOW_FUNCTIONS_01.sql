
select
	o.OrderID,
	O.CustomerID,
	round(SUM(ord.UnitPrice*ord.Quantity*(1-ord.Discount)),0) as [ Total Order Sum ],
	coalesce(
		round(
			abs(
			SUM(ord.UnitPrice*ord.Quantity*(1-ord.Discount))
		   -LAG(SUM(ord.UnitPrice*ord.Quantity*(1-ord.Discount)))
			over (partition by o.customerid  order by o.orderid))
		,0)
	,0)as [Current - Previous]

from dbo.[Order Details] ord
inner join dbo.Orders o 
	on o.OrderID = ord.OrderID
group by o.orderid,o.customerid,o.OrderDate


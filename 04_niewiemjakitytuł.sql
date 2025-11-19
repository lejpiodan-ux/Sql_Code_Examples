-- Wyœwietl listê produktów wraz z:nazw¹ kategorii,nazw¹ dostawcy,³¹czn¹ liczb¹ sprzedanych sztuk,œredni¹ cen¹, po jakiej dany produkt sprzedawano.
-- Zwróæ tylko produkty, które sprzeda³y siê lepiej ni¿ œrednia liczba sprzedanych sztuk poœród wszystkich produktów.
-- Zwrócone rekordy podziel na strony i zwróæ stronê numer 3 przy rozmiarze strony 10.

select
	p.ProductName,
	sb1. [Avg Order Value],
	sb1.[ Product Order Count ] ,
	c.CategoryName,
	s.ContactName
from dbo.PRODUCTS p
INNER JOIN (
	SELECT
		ord.ProductID,
		round(AVG(sb.ordvalue),2) as [Avg Order Value],
		COUNT(ord.OrderID) as [ Product Order Count ]	
	FROM dbo.[Order Details] ord
	INNER JOIN (
				SELECT
					SUM(unitprice*quantity*(1-discount)) as ordvalue ,
					OrderID
				FROM dbo.[Order Details] 
				group by OrderID
			) sb
		on sb.OrderID = ord.OrderID
	group by ord.ProductID
) sb1
	on sb1.ProductID = p.ProductID
inner join Categories c
	on p.CategoryID = c.CategoryID
inner join Suppliers s
	on s.SupplierID=p.SupplierID
where sb1. [Avg Order Value] > (
	select 
	avg(unitprice*quantity*(1-discount)) 
	from dbo.[Order Details] 
)
order by sb1. [Avg Order Value] desc
offset 20 rows fetch next 10rows only 
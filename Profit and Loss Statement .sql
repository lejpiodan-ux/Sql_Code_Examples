
with GR as
(
	 select 
		sum(OrderQty * UnitPrice) as [Gross Revenue],-- quantity * unit price to count GR for each order id
		SUM(OrderQty * UnitPrice * (1-UnitPriceDiscount)) as [Net Revenue], -- Gr - Discounts to count Net Revenue
		cast (SUM(OrderQty * UnitPrice * (1-UnitPriceDiscount))  * 0.015 as decimal (10,2)) AS 'Depreciation', -- This database dont contain depreciation cost, so I added it to My P&L Statement
		SalesOrderID
		
	 from Sales.SalesOrderDetail
	 group by SalesOrderID

),
COGS as -- I calculated quantity * standard cost for each product id summed it to get the real COGS amount for each order
(
	Select 
		salesorderid,
		sum([total cost per product]) as COGS
	 from (
			select -- I need subquerry to count real cost of amount of products. If order includes e.g. 2 products ( 550 and 552, and product with id 550 cointains 2 quantities, formula multiply standard cost for each quantity * amount of products in one order)
				pp.StandardCost * sod.OrderQty as [total cost per product],
				sod.ProductID,
				SalesOrderID
			from Sales.SalesOrderDetail sod
			join Production.Product pp
				on sod.ProductID = pp.ProductID
				) tcpp
	group by salesorderid	 
),
net as
(

	Select
		G.SalesOrderID as SalesorderID,
		[Gross Revenue],
		[Net Revenue],
		COGS,
		concat(datename(MONTH,orderdate),' ',YEAR(OrderDate))as [Month and Year],
		[Net Revenue] - COGS as [Gross Profit],
		cast(Freight as decimal (10,2)) as [OPEX],
		cast(TaxAmt as decimal (10,2)) as [Taxamt],
		Depreciation, 
		[Net Revenue] - COGS  - Freight AS [EBITDA],
		[Net Revenue] - COGS  - Freight - Depreciation AS [EBIT],
		[Net Revenue] - COGS  - Freight - TaxAmt AS [Net profit],
		(([Net Revenue] - COGS - Freight - TaxAmt) / NULLIF([Net Revenue], 0)) * 100 AS [Net margin %]
		
	from GR g
		join COGS c
	on c.SalesOrderID = g.SalesOrderID
		join Sales.SalesOrderHeader soh
	on g.SalesOrderID = soh.SalesOrderID
)
select
	SalesorderID,
	[Gross Revenue],
	[Net Revenue],
	COGS,
	[Month and Year],
	[Gross Profit],
	[OPEX],
	[Taxamt],
	Depreciation,
	[EBITDA],
	[EBIT],
	[Net profit],
	[Net margin %],
	avg([net margin %]) over (partition by [Month and Year]) as [Average monthly net margin],-- I used Window function to calculate average net margin for each month of every order
	cast([net margin %] - avg([net margin %]) over (partition by [Month and Year]) as decimal (10,2)) as [Net margin Difference to order/monthly] -- I calculated the difference between order net margin and average monthly net margin
	
from net
order by cast([net margin %] - avg([net margin %]) over (partition by [Month and Year]) as decimal (10,2)) desc

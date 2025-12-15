select
	c1.CustomerId,
	c1.LastName,	
	c1.FirstName,
	b.Total_Customer_Amount

from (
	select	
		SUM(total) as 'Total_Customer_Amount',
		CustomerId
	from dbo.invoice i1
	group by CustomerId
) as b

inner join dbo.customer c1
	on c1.customerid = b.customerid
where  b.Total_Customer_Amount > (
	select
		SUM(I.total) 
	FROM dbo.Invoice I
	INNER JOIN DBO.CUSTOMER c
		on I.CustomerId = C.customerid
	WHERE c.LastName LIKE 'JOHANSSON'
		)
order by Total_Customer_Amount desc

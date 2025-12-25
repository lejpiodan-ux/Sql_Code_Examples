/*3. Historia zakupowa klientów
Przygotuj raport przedstawiaj¹cy chronologiczn¹ sekwencjê zamówieñ ka¿dego klienta wraz z wartoœci¹ tych zamówieñ oraz z informacj¹ jak dane zamówienie odnosi siê do wczeœniejszych i nastêpnych zakupów.*/

SELECT
    CustomerID,
    ROUND(order_total, 1) AS OrderTotal,
    o.OrderDate,

    COALESCE(                                                                               /*Procentowa zmiana w stosunku do poprzedniego zamówienia*/
        CAST(
            ROUND(
                (order_total - LAG(order_total) 
                    OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC)) * 100
                / LAG(order_total) 
                    OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC),
                1
            ) AS VARCHAR
        ),
        'First Order'
    ) AS PercentChangeFromPreviousOrder,	

    COALESCE(																			    /*Procentowa zmiana w stosunku do nastêpnego zamówienia*/	                       
        CAST(
            ROUND(
                (order_total - LEAD(order_total) 
                    OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC)) * 100
                / LEAD(order_total) 
                    OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC),
                1
            ) AS VARCHAR
        ),
        'No Next Order'
    ) AS PercentChangeToNextOrder,

    COALESCE(                                                                                       /* Wartoœæ poprzedniego zamówienia*/
        CAST(
            LAG(order_total) 
                OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC) AS VARCHAR
        ),
        'First Order'
    ) AS PreviousOrderTotal,

    COALESCE(																						/* Wartoœæ nastêpnego zamówienia*/
        CAST(
            LEAD(order_total) 
                OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC) AS VARCHAR
        ),
        'No Next Order'
    ) AS NextOrderTotal

FROM (
    SELECT            
        SUM(Quantity * UnitPrice * (1 - Discount)) AS order_total,
        OrderID
    FROM dbo.[Order Details]
    GROUP BY OrderID
) order_summary
LEFT JOIN dbo.Orders o
    ON order_summary.OrderID = o.OrderID
ORDER BY CustomerID, o.OrderDate;


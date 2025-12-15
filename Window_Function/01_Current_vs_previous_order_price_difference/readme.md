Analiza zamówień z użyciem Window Functions z ogólnodostępnej bazy danych Northwind

W tym zadaniu obliczyłem całkowitą wartość każdego zamówienia po uwzględnieniu rabatów oraz porównałem ją z poprzednim zamówieniem tego samego klienta.

Wykorzystane Funkcje:
`LAG`
`COALESCE`
`ABS`
`ORDER BY`

Funkcje  `LAG() `z `OVER(PARTITION BY CustomerID ORDER BY OrderID)`,  umożliwiły mi pobranie wartości poprzedniego zamówienia w obrębie tego samego klienta.
Dzięki użyciu funkcji  `Coalesce` zmieniłem wartość która ma być wyświetlana poczas występowania pierwszego zamówienia każdego nowego klienta z `NULL` NA "0".
Funkcja `ABS` wyciąga wartość bezwzględną aby zapis wyniku był bez znaków minusowych.

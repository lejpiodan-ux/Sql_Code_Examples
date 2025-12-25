Historia zakupowa klientów z analizą porównawczą zamówień na podstawe ogólnodostępnej bazie danych `northwind`

W tym zadaniu przygotowałem raport przedstawiający chronologiczną sekwencję zamówień każdego klienta wraz z wartością zamówień oraz analizą ich zmian w odniesieniu do poprzednich i następnych zakupów.
Wykorzystane funkcje:
`LAG`,
`LEAD,` 
`COALESCE`,
`ROUND`,
`CAST`,
`OVER(PARTITION BY … ORDER BY …)`,
`LEFT JOIN`, 
`ORDER BY`

Funkcje `LAG`oraz LEAD pozwalają pobrać wartość poprzedniego i następnego zamówienia w obrębie tego samego klienta, dzięki czemu mogłem
obliczyć procentową zmianę wartości zamówienia w stosunku do wcześniejszych i kolejnych zakupów.
Funkcja `COALESCE `umożliwiła zastąpienie wartości NULL odpowiednimi komunikatami
('First Order' lub 'No Next Order') w przypadku, gdy klient nie miał poprzedniego lub następnego zamówienia. 
W wyniku otrzymujemy raport, który pokazuje:

całkowitą wartość zamówienia (OrderTotal),
datę zamówienia (OrderDate),
procentową zmianę w stosunku do poprzedniego zamówienia (PercentChangeFromPreviousOrder),
procentową zmianę w stosunku do następnego zamówienia (PercentChangeToNextOrder),
wartość poprzedniego zamówienia (PreviousOrderTotal),
wartość następnego zamówienia (NextOrderTotal).

Raport pozwala łatwo prześledzić historię zakupową każdego klienta, zidentyfikować trendy w zamówieniach oraz zauważyć znaczące wzrosty lub spadki w wartościach zakupów. 
Kod napisany przez Piotr leja

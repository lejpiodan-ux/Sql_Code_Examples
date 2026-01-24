

# English

## Title:
Order Analysis with Window Functions
Used database: Northwind

## Description 
In this Query i calculated total values for each order, including discounts. I also compared it with previous order of same customer

## Techniques used in this query:
##### "LAG" - Let me take the value from previous order for the same customer 
##### "COALESCE" - Is responsible for changing all Nulls into "0"
##### "ABS" - Gives me absolute value, becouse i dont want to have minus signs in  my querry

## Result

Raport is showing how much money customer spend on order and  what is the difference between this and previous order bought by the same customer.

# Polish
## Tytuł
Analiza zamówień z użyciem funkcji okienkowych z ogólnodostępnej bazy danych Northwind

## Opis
W tym zadaniu obliczyłem całkowitą wartość każdego zamówienia po uwzględnieniu rabatów oraz porównałem ją z poprzednim zamówieniem tego samego klienta.

## Techniki:

##### "LAG() z OVER(PARTITION BY CustomerID ORDER BY OrderID)" - umożliwiły mi pobranie wartości poprzedniego zamówienia w obrębie tego samego klienta.
##### "Coalesce" - zmienia wartość która ma być wyświetlana podczas występowania pierwszego zamówienia każdego nowego klienta z "NULL" NA "0".
##### "ABS"- wyciąga wartość bezwzględną aby zapis wyniku był bez znaków minusowych.

## Rezultat

Raport pokazuje, ile pieniędzy wydał klient na dane zamówienie oraz o ile ta kwota różni się od jego poprzednich zakupów.






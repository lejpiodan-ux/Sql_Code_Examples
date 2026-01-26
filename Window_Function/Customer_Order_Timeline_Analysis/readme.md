# English

## Title
Customer Order Timeline Analysis

## Description
In this query, I am showing the chronological sequence of orders for each customer, with the value of orders and with their changes in reference to previous and next purchase

## Techniques used in this query

##### LAG - Returns the total value of the previous order placed by the same customer
##### LEAD - Returns the total value of the next order placed by the same customer
##### COALESCE- Replaces "NULL" values returned by "LEAD" and "LAG"
##### ROUND - Rounds values returned from "LEAD" and "LAG"
##### CAST - Allows combining numeric values with textual labels inside "COALESCE"

## Columns
##### Total order value (OrderTotal)
##### Order date (Orderdate)
##### Percentage change in reference to previous order (PercentChangeFromPreviousOrder)
##### Percentage change in reference to next order (PercentChangeToNextOrder)
##### Value of previous order (PreviousOrderTotal)
##### Value of next order (NextOrderTotal)

## Results

Raport enables tracking each customer's order history, identify growing or dropping trends in purchased orders

Written by Piotr Leja



# Polish
## Tytuł
Historia zakupowa klientów z analizą porównawczą zamówień na podstawe ogólnodostępnej bazie danych "Northwind"

## Opis
W tym zadaniu przygotowałem raport przedstawiający chronologiczną sekwencję zamówień każdego klienta wraz z wartością zamówień oraz analizą ich zmian w odniesieniu do poprzednich i następnych zakupów.

## Techniki
##### LAG -  Zwraca łączną wartość poprzedniego zamówienia złożonego przez tego samego klienta
##### LEAD - Zwraca łączną wartość następnego zamówienia złożonego przez tego samego klienta
##### COALESCE - Zastępuje wartości "NUL"L zwracane przez funkcje "LAG" i "LEAD"
##### ROUND - Zaokrągla wartości zwracane przez funkcje "LAG" i "LEAD"
##### CAST - Umożliwia łączenie wartości liczbowych z etykietami tekstowymi wewnątrz funkcji "COALESCE"


## Kolumny
##### całkowita wartość zamówienia (OrderTotal),
##### data zamówienia (OrderDate),
##### procentowa zmiana w stosunku do poprzedniego zamówienia (PercentChangeFromPreviousOrder),
##### procentowa zmiana w stosunku do następnego zamówienia (PercentChangeToNextOrder),
##### wartość poprzedniego zamówienia (PreviousOrderTotal),
##### wartość następnego zamówienia (NextOrderTotal).

Raport pozwala łatwo prześledzić historię zakupową każdego klienta, zidentyfikować trendy w wartościach zakupów. 
Kod napisany przez Piotr Leja




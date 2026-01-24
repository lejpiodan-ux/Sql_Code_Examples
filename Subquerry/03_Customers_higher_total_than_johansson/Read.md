
# English

## Title
Analysis of Customers with higher value of shopping than customer named "Johansson"
Used Database: "Chinook"

## Description:
The main goal of this query was to identify customers who have higher total sales (invoice total) than sum of all orders by customer named "Johansson"

## Tables used in Query:
##### Invoice
##### Customer

## Techniques used in this Query:
##### Aggregative Subquerry - To calculate total value of orders for Johansson
##### Subquerry in clause From (derived table) - To calculate order sum per customer
##### Inner Join - To connect tables
##### Where - With condition responsible for comparing sum values
##### Order By - To sort results decreasing by value of order

## Result
Nested Subquerry calculates total value od orders by each customer.
Second Subquerry calculates a sum of orders for customer named "Johansson"
I am comparing every sum with reference value  -> Final result contain only customers with highest expense
Data is sorted from highetst sum of ordest.

Writted by Piotr Leja


# Polish

## Tytuł
Analiza klientów o wyższej wartości zakupów niż klient “Johansson”  w bazie danych (Chinook)

## Opis
Celem tej analizy było zidentyfikowanie klientów, których łączna wartość zakupów (Invoice Total) jest wyższa niż suma wszystkich zakupów dokonanych przez klienta o nazwisku “Johansson”.


## Wykorzystane tabele
##### Invoice
##### Customer

## Techniki

##### podzapytanie agregujące "subquery" do obliczenia łącznej wartości zakupów klienta „Johansson”,
##### podzapytanie w klauzuli "FROM (derived table)" do policzenia sumy zakupów per klient,
##### "INNER JOIN" do powiązania danych klientów z ich sumami zakupów,
##### klauzula "WHERE"z warunkiem porównującym wartości "sum",
##### "ORDER BY" do sortowania wyników malejąco według wartości zakupów.

## Rezultat

Podzapytanie wewnętrzne oblicza łączną wartość zakupów każdego klienta.
Drugie podzapytanie oblicza suma zakupów klienta o nazwisku “Johansson”.
Porównuje każdą sumę z wartością referencyjną — do wyniku trafiają tylko klienci z wyższymi wydatkami.
Dane są sortowane od największej sumy zakupów.

Projekt SQL wykonany jako część portfolio analityka danych.
Autor: Piotr Leja


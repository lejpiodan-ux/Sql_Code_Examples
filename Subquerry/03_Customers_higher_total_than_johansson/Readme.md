
# English

## Title
Analysis of Customers with a higher value of shopping than the customer named "Johansson"
Used Database: "Chinook"

## Description:
The main goal of this query was to identify customers who have higher total sales (invoice total) than the sum of all orders by the customer named "Johansson"

## Tables used in Query:
##### Invoice
##### Customer

## Techniques used in this Query:
##### Aggregative Subquery - To calculate the total value of orders for Johansson
##### Subquery in clause From (derived table) - To calculate order sum per customer
##### Inner Join - To connect tables
##### Where - With condition responsible for comparing sum values
##### Order By - To sort results in decreasing order by value of order

## Result
The nested subquery calculates the total value of orders by each customer.
The second subquery calculates the sum of orders for the customer named "Johansson"
I am comparing every sum with the reference value  -> The final result contains only customers with the highest expense
Data is sorted from the highest sum of orders.

Written by Piotr Leja


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


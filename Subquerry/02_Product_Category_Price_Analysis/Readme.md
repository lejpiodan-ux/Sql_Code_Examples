
# English

## Title
Average product price analysis
Used Database: Northwind

## Description:
Show name of categories with average product price is higher than average of all products in Northwind Database. Add product value status (expensive, normal, cheap) and today's date

## Tables used in Query:
##### "Products"
##### "Categories"

## Techniques used in this Query:

##### "INNER JOIN" - To connect tables
##### "AVG" - To calculate average unit price of products in each category
##### "GROUP BY" - to group results by categories
##### "HAVING" - To compare average prices with global average price of all products
##### "CASE" - To classify category as "Expensive", "Normal", or "Cheap"
##### "CAST (GET DATE () AS DATE)" - For adding a current data
##### "ORDER BY" - To sort results decreasing by average price


## Result
Query returns  list of categories with their average unit price, product value status and current data

Writted By Piotr Leja


# Polish

# Tytuł
Analiza średnich cen produktów w bazie danych (Northwind)

# Opis
Treść zadania: Pokaż nazwy kategorii, dla których średnia cena produktów jest wyższa niż średnia cena wszystkich produktów
w bazie northwind. Dodaj status wartości produktu (expensive, normal, cheap) oraz dzisiejszą datę.

# Wykorzystane tabele:

##### Products 
##### Categories 

# Techniki

##### INNER JOIN do połączenia tabel Products i Categories
##### AVG() do obliczenia średniej ceny jednostkowej produktów w każdej kategorii, 
##### GROUP BY do grupowania wyników według kategorii,
##### HAVING do porównania średnich cen z globalną średnią wszystkich produktów, 
##### CASE do klasyfikacji kategorii jako Expensive, Normal lub Cheap  
##### CAST(GETDATE() AS DATE)` do pobrania bieżącej daty bez czasu  
##### ORDER BY do posortowania wyników malejąco według średniej ceny.  

# Rezultat 
Zapytanie zwraca listę kategorii wraz z ich średnią ceną jednostkową, statusem wartości produktu oraz aktualną datą wykonania analizy.  
Wyniki są posortowane od najwyższej do najniższej średniej ceny produktów.

Projekt SQL wykonany jako część portfolio analityka danych.  
Autor: Piotr Leja



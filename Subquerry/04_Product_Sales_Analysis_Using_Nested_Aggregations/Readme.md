# English

## Title
Product order value analysis in the Northwind databa

## Description:
Return product list with:
##### name of category
##### name of supplier
##### total number of pieces sold
##### average price of product

Only return products that sold more than the average number of units sold across all products.
Divide results on 3 pages. Every page has to contain 10 records

## Tables used in Query:
##### Products
##### Order Details
##### Categories
##### Suppliers

## Techniques used in this Query:
##### "INNER JOIN" - To connect tables
##### Nested Subquerry - To calculate value of order id
##### Agreggations "AVG", "COUNT", "SUM" 
##### "WHERE" - which is filtering data with containing subquerry
##### "ORDER BY"- To sort results
##### "OFFSET" and "FETCH" - To pagination

## Result
1.Nested subquerry is calculating a total value for each "Order Id"
2.Then data is grouping by "Product Id", becouse i need to:
##### calculate average order price for each product
##### calculate order quantity for each product
3.The main querry is adding:

##### Name of product
##### Name of category
##### Name of supplier

4.Whole result is filtering. Main querry is returning only products with average value of order highest than average value for single order in whole database
5.Results are sorted decreasingly and are paginated. ( Querry is returning only third page ( 21-30 last records)

Writted by Piotr Leja



# Polish
 
 
## Tytuł
Analiza wartości zamówień produktów w bazie danych Northwind
 
## Opis

Wyświetl listę produktów wraz z:
nazwą kategorii,
nazwą dostawcy,
łączną liczbą sprzedanych sztuk,
średnią ceną, po jakiej dany produkt sprzedawano.

Zwróć tylko produkty, które sprzedały się lepiej niż średnia liczba sprzedanych sztuk pośród wszystkich produktów.
Zwrócone rekordy podziel na strony i zwróć stronę numer 3 przy rozmiarze strony 10.


## Wykorzystane Tabele

##### "Products"
##### "Order Details"
##### "Categories"
##### "Suppliers"

## Techniki
##### "INNER JOIN" do łączenia danych między tabelami  
##### Podzapytanie zagnieżdżone (subquery) - do obliczenia wartości zamówienia na poziomie "OrderID" 
##### Agregacje "AVG", "COUNT", "SUM"- obliczenia statystyczne i wartości finansowe  
##### Filtracja warunkowa w "WHERE" z porównaniem do subquery  
##### Sortowanie wyników "ORDER BY"  
##### Paginacja wyników przy użyciu "OFFSET" i "FETCH"

## Rezultat

1. W podzapytaniu wyliczana jest **łączna wartość zamówienia** dla każdego "OrderID"  
2. Następnie dane te są grupowane po "ProductID", aby:  
   - obliczyć średnią wartość zamówienia dla danego produktu,  
   - policzyć liczbę zamówień, w których dany produkt występuje.  
3. Główne zapytanie uzupełnia wynik o:
   - nazwę produktu,  
   - nazwę kategorii,  
   - dane dostawcy.  
4. Wyniki są filtrowane - zwracane są wyłącznie produkty, których średnia wartość zamówienia przekracza średnią wartość pojedynczego zamówienia w całej bazie.  
5. Wyniki są sortowane malejąco i poddawane paginacji (wyświetlana jest trzecia strona ( 21-30 ostatnich rekordów)

Projekt SQL wykonany jako część portfolio analityka danych.
Autor: Piotr Leja




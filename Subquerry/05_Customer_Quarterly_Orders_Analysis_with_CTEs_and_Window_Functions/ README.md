
# Tytuł
Analiza kwartalnej dynamiki sprzedaży dla klienta w bazie danych AdventureWorks2017

## Opis
Celem skryptu jest znalezienie 10 klientów z największym procentowym wzrostem wartości zamówień kwartał do kwartału w roku 2013. 
Analiza pozwala na monitorowanie trendów zakupowych.

## Wykorzystane tabele
* Sales.SalesOrderDetail - Dane o pozycjach zamówień (ilość, cena,).
* Sales.SalesOrderHeader - Informacje o nagłówkach zamówień, daty.
* Sales.Customer - Tabela łącząca
* Person.Person - Dane klientów (imiona i nazwiska).

## Techniki
* Common Table Expressions (CTE) - Użycie with w celu nadania skryptowi czytelnej struktury.
* Podzapytania - Zagnieżdżone zapytania służące do agregacji sum sprzedaży oraz formatowania nazwisk.
* Funkcje okna (Window Functions)
* RANK - Do chronologicznego ponumerowania kwartałów dla każdego klienta.
* LAG - Do pobrania wartości sprzedaży z poprzedniego okresu w celu porównania.
* Funkcje daty i tekstu - YEAR(), DATEPART(), CONCAT() oraz obsługa wartości NULL przez funkcję CASE WHEN.

## Rezultat
Główne zapytanie najpierw wylicza czystą wartość sprzedaży (uwzględniając rabaty) dla każdego klienta w podziale na kwartały roku 2013.
Dzięki funkcji LAG, wartość z obecnego kwartału jest zestawiana z poprzednim w tym samym wierszu.Wyliczany jest wskaźnik procentowy wzrostu.
Wynik końcowy zwraca 10 klientów z najwyższym skokiem wartości zamówień, co pozwala skupić się na najbardziej perspektywicznych odbiorcach.

Autor: Piotr Leja

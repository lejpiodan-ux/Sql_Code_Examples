Analiza klientów o wyższej wartości zakupów niż klient “Johansson”  w bazie danych (Chinook)

Celem tej analizy było zidentyfikowanie klientów, których łączna wartość zakupów (Invoice Total) jest wyższa niż suma wszystkich zakupów dokonanych przez klienta o nazwisku “Johansson”.


W zapytaniu wykorzystano następujące tabele:
`Invoice`
`Customer`

Zastosowane techniki SQL:

podzapytanie agregujące `subquery` do obliczenia łącznej wartości zakupów klienta „Johansson”,
podzapytanie w klauzuli `FROM (derived table)` do policzenia sumy zakupów per klient,
`INNER JOIN` do powiązania danych klientów z ich sumami zakupów,
klauzula `WHERE`z warunkiem porównującym wartości `sum`,
`ORDER BY` do sortowania wyników malejąco według wartości zakupów.

Opis działania zapytania

Podzapytanie wewnętrzne oblicza łączną wartość zakupów każdego klienta.
Drugie podzapytanie oblicza suma zakupów klienta o nazwisku “Johansson”.
Porównujemy każdą sumę z wartością referencyjną — do wyniku trafiają tylko klienci z wyższymi wydatkami.
Dane są sortowane od największej sumy zakupów.

Projekt SQL wykonany jako część portfolio analityka danych.
Autor: Piotr Leja

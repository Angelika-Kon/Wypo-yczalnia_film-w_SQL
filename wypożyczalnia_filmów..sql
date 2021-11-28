use Projekt1

CREATE TABLE Konta
(
 id_konta INT NOT NULL IDENTITY PRIMARY KEY,
 Nazwa NVARCHAR(50) NOT NULL UNIQUE,
); 

CREATE TABLE Klient
(
 id_klienta INT NOT NULL IDENTITY PRIMARY KEY,
 Imie NVARCHAR(50) NOT NULL,
 Nazwisko NVARCHAR(50) NOT NULL,
 Data_urodzenia DATE NOT NULL,
 id_konta INT NULL,
 FOREIGN KEY (id_konta) REFERENCES Konta (id_konta),
); 
CREATE TABLE Filmy
(
 id_filmu INT NOT NULL IDENTITY PRIMARY KEY,
 Tytul NVARCHAR(50) NOT NULL,
 Rok_produkcji CHAR(4) NOT NULL,
 Gatunek NVARCHAR (20) NOT NULL,
); 
CREATE TABLE Aktorzy
(
 id_aktora INT NOT NULL IDENTITY PRIMARY KEY,
 Imie NVARCHAR(15) NOT NULL,
 Nazwisko NVARCHAR(25) NOT NULL,
);
CREATE TABLE Zagrali
(
 id_filmu INT NOT NULL,
 id_aktora INT NOT NULL,
 FOREIGN KEY (id_filmu) REFERENCES Filmy (id_filmu),
 FOREIGN KEY (id_aktora) REFERENCES Aktorzy (id_aktora),
);
CREATE TABLE Nosniki
(
 nr INT NOT NULL IDENTITY PRIMARY KEY,
 Typ NVARCHAR(15) NOT NULL,
 Czy_wypozyczone CHAR(3) NULL,
 CHECK (Czy_wypozyczone IN ('TAK', 'NIE')),
 id_filmu INT NOT NULL,
 FOREIGN KEY (id_filmu) REFERENCES Filmy (id_filmu),
);
CREATE TABLE Rezerwacje
(
 id_rezerwacji INT NOT NULL IDENTITY PRIMARY KEY,
 Data_wprowadzenia DATE NOT NULL,
 Data_realizacji DATE NOT NULL,
 Czy_zrealizowano CHAR(3) NOT NULL,
 CHECK (Czy_zrealizowano IN ('TAK', 'NIE')),
 id_filmu INT NULL,
 nr INT NULL,
 id_konta INT NULL,
 FOREIGN KEY (id_filmu) REFERENCES Filmy (id_filmu),
 FOREIGN KEY (id_konta) REFERENCES Konta (id_konta),
 FOREIGN KEY (nr) REFERENCES Nosniki (nr),
);
CREATE TABLE Wypozyczenia
(
 id_Wypozyczenia INT NOT NULL IDENTITY PRIMARY KEY,
 Data_wypozyczenia DATE NOT NULL,
 Plan_data_zwrotu DATE NOT NULL,
 Data_zwrotu DATE NOT NULL,
 Cena_pozycji INT NOT NULL,
 Kara INT NULL,
 nr INT NULL,
 id_konta INT NULL,
 FOREIGN KEY (id_konta) REFERENCES Konta (id_konta),
 FOREIGN KEY (nr) REFERENCES Nosniki (nr),
);

INSERT INTO Konta (nazwa)
VALUES ( N'Akowal');
INSERT INTO Konta (nazwa)
VALUES ( N'SZNowak');
INSERT INTO Konta (nazwa)
VALUES ( N'Wszyn');
INSERT INTO Konta (nazwa)
VALUES ( N'Lisek');
INSERT INTO Konta (nazwa)
VALUES ( N'AdamM');
INSERT INTO Konta (nazwa)
VALUES ( N'AlaKot');

INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Anna', N'Kowalska', '1990-01-20', '1');
INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Szymon', N'Nowak', '1995-03-31', '2');
INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Wiktor', N'Szyna', '1998-12-06', '3');
INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Ewa', N'Lis', '1991-12-05', '4');
INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Adam', N'Malinowski', '2000-01-15', '5');
INSERT INTO Klient (imie, nazwisko, data_urodzenia, id_konta)
VALUES ( N'Alicja', N'Kot', '2001-05-31', '6');



INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Zielona Mila', '1999', N'Dramat');
INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Forrest Gump', '1994', N'Komedia');
INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Leon Zawodowiec', '1994', N'Krymina³');
INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Avatar', '2009', N'Science Fiction');
INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Joker', '2019', N'Dramat');
INSERT INTO Filmy (Tytul, Rok_produkcji, Gatunek)
VALUES ( N'Wilk z Wall Street', '2013', N'Biograficzny');

INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Tom', N'Hanks');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Robin', N'Bright');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Stephen', N'Lang');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Sam', N'Worthington');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Natalie', N'Portman');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Joaquin', N'Phoenix');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Robert', N'De Niro');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Leonardo', N'DiCaprio');
INSERT INTO Aktorzy (Imie, Nazwisko)
VALUES ( N'Margot', N'Robbie');

INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('1', '1');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('2', '1');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('3', '5');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('4', '2');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('4', '4');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('5', '6');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('5', '7');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('6', '8');
INSERT INTO Zagrali (id_filmu, id_aktora)
VALUES ('6', '9');

INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('1', 'DVD', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('1', 'VHS', 'NIE');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('2', 'DVD', 'NIE');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('2', 'DVD', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('2', 'VHS', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('3', 'DVD', 'NIE');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('3', 'VHS', 'NIE');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('4', 'DVD', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('4', 'VHS', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('5', 'DVD', 'NIE');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('5', 'DVD', 'TAK');
INSERT INTO Nosniki (id_filmu, typ, Czy_wypozyczone)
VALUES ('6', 'DVD', 'NIE');

INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('1', '1', '2', '2020-05-14', '2020-05-15', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('2', '3', '1', '2020-05-01', '2020-05-16', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('2', '5', '2', '2020-05-14', '2020-05-17', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('4', '8', '3', '2020-05-21', '2020-05-22', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('5', '11', '6', '2020-04-30', '2020-05-01', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('4', '9', '5', '2020-05-11', '2020-05-13', 'TAK');
INSERT INTO Rezerwacje (id_filmu, nr, id_konta, Data_wprowadzenia, Data_realizacji, Czy_zrealizowano)
VALUES ('6', '12', '5', '2020-06-02', '2020-06-08', 'NIE');

INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('2', '1', '2020-05-15', '2020-05-20', '2020-05-19', '10', NULL);
INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('1', '4', '2020-05-16', '2020-05-21', '2020-05-22', '15', '2');
INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('2', '5', '2020-05-17', '2020-05-22', '2020-05-20', '8', NULL);
INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('3', '8', '2020-05-22', '2020-05-27', '2020-05-27', '20', NULL);
INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('6', '11', '2020-05-01', '2020-05-05', '2020-06-05', '20', '62');
INSERT INTO Wypozyczenia (id_konta, nr, Data_wypozyczenia, Plan_data_zwrotu, Data_zwrotu, Cena_pozycji, Kara)
VALUES ('5', '9', '2020-05-13', '2020-05-19', '2020-05-15', '15', NULL);


/*Kwerenda pobiera dane z tabeli Klient. Kwerenda zawiera klauzulê WHERE która zwraca klientów urodzonych przed rokiem 2000
oraz wykorzystuje funkcje CONCAT która ³¹czy imie i nazwisko klienta oraz zapisuje je pod nazw¹ Klienci urodzeni przed 2000r */
SELECT CONCAT(imie,' ',nazwisko) as 'Klienci urodzeni przed 2000r' FROM Klient WHERE year(data_urodzenia)<2000;

/*Kwerenda ³¹czy dane z tabeli Konta i Wypozyczenia poprzez id_konta */
SELECT Nazwa, Kara FROM Konta k INNER JOIN Wypozyczenia w on k.id_konta=w.id_konta;

/*Kwerenda ³¹czy dane z tabel Aktorzy,Filmy i Zagrali */
SELECT Nazwisko,Tytul FROM Zagrali z
INNER JOIN Filmy f ON f.id_filmu=z.id_filmu
INNER JOIN  Aktorzy a ON a.id_aktora=z.id_aktora;

/*Kwerenda, która wykorzystuje grupowanie wed³ug id_Wypozyczenia, funkcje agreguj¹c¹ SUM do sumowania ceny danej pozycji i kary za przetrzymanie
oraz klauzulê HAVING która wyklucza wypozyczenia bez kary*/
SELECT id_Wypozyczenia,(SUM(Cena_pozycji)+SUM(Kara)) AS [Calkowita kwota do zaplaty] FROM Wypozyczenia GROUP BY id_Wypozyczenia HAVING SUM(Kara) IS NOT NULL;

/*Kwerenda, która zawiera podzapytanie zwyk³e wierszowe zwracaj¹ce nam informacjê o najm³odszym filmie w wypo¿yczalni*/
SELECT Tytul,Rok_produkcji FROM Filmy WHERE Rok_produkcji=(select MAX(Rok_produkcji) from Filmy );

/*Kwerenda pobieraj¹ca dane z tabel Filmy i Noœniki, wykorzystuj¹ca grupowanie wed³ug Tytu³u oraz funkcje agreguj¹c¹ COUNT która zlicza iloœæ noœników danego filmu*/
SELECT Tytul,COUNT(Typ) AS [Ilosc nosnikow] FROM Filmy f INNER JOIN  Nosniki n ON f.id_filmu=n.id_filmu GROUP BY Tytul;


Создание таблицы "Компьютерная фирма"
-------------------------------------
CREATE TABLE product
(maker varchar(10),
 model varchar(50),
 type  varchar(50)
)

CREATE TABLE laptop
(code int,
 model varchar(50),
 speed smallint,
 ram smallint,
 hd real,
 price money,
 screen tinyint
)

CREATE TABLE pc
(code int,
 model varchar(50),
 speed smallint,
 ram smallint,
 hd real,
 cd varchar(10),
 price money
)

CREATE TABLE printer
(code int,
 model varchar(50),
 color char(1),
 type varchar(10),
 price money
)

INSERT INTO product (maker, model, type) VALUES
	('A',	1232,	'PC'),
	('A',	1233,	'PC'),
	('A',	1276,	'Printer'),
	('A',	1298,	'Laptop'),
	('A',	1401,	'Printer'),
	('A',	1408,	'Printer'),
	('A',	1752,	'Laptop'),
	('B',	1121,	'PC'),
	('B',	1750,	'Laptop'),
	('C',	1321,	'Laptop'),
	('D',	1288,	'Printer'),
	('D',	1433,	'Printer'),
	('E',	1260,	'PC'),
	('E',	1434,	'Printer'),
	('E',	2112,	'PC'),
	('E',	2113,	'PC');
	
INSERT INTO laptop (code, model, speed, ram, hd, price, screen) VALUES
	(1,	1298,	350,	32,		4.0,	700.0000,	11),
	(2,	1321,	500,	64,		8.0,	970.0000,	12),
	(3,	1750,	750,	128,	12.0,	1200.0000,	14),
	(4,	1298,	600,	64,		10.0,	1050.0000,	15),
	(5,	1752,	750,	128,	10.0,	1150.0000,	14),
	(6,	1298,	450,	64,		10.0,	950.0000,	12);


INSERT INTO pc (code, model, speed, ram, hd, cd, price) VALUES
	(1,		1232,	500,	64,		5.0,	'12x',	600.0000),
	(10,	1260,	500,	32,		10.0,	'12x',	350.0000),
	(11,	1233,	900,	128,	40.0,	'40x',	980.0000),
	(12,	1233,	800,	128,	20.0,	'50x',	970.0000),
	(2,		1121,	750,	128,	14.0,	'40x',	850.0000),
	(3,		1233,	500,	64,		5.0,	'12x',	600.0000),
	(4,		1121,	600,	128,	14.0,	'40x',	850.0000),
	(5,		1121,	600,	128,	8.0,	'40x',	850.0000),
	(6,		1233,	750,	128,	20.0,	'50x',	950.0000),
	(7,		1232,	500,	32,		10.0,	'12x',	400.0000),
	(8,		1232,	450,	64,		8.0,	'24x',	350.0000),
	(9,		1232,	450,	32,		10.0,	'24x',	350.0000);

INSERT INTO printer (code, model, color, type, price) VALUES
	(1,	1276,	'n',	'Laser',	400.0000),
	(2,	1433,	'y',	'Jet',		270.0000),
	(3,	1434,	'y',	'Jet',		290.0000),
	(4,	1401,	'n',	'Matrix',	150.0000),
	(5,	1408,	'n',	'Matrix',	270.0000),
	(6,	1288,	'n',	'Laser',	400.0000);
---------------------------------------------------------------------


Задание № 14

SELECT DISTINCT maker, type
FROM product
WHERE maker IN (SELECT maker FROM product GROUP by maker HAVING COUNT(model) > 1 AND COUNT(DISTINCT type) = 1)

Задание № 16

SELECT DISTINCT a.model, b.model, b.speed, b.ram
FROM pc a, pc b
WHERE a.speed = b.speed AND a.ram = b.ram AND a.model > b.model

Задание № 17

SELECT DISTINCT p.type, l.model, l.speed
FROM laptop l, product p
WHERE speed < ALL (SELECT speed FROM PC)
AND l.model=p.model


SELECT DISTINCT p.type, l.model, l.speed
FROM product p
JOIN laptop l
ON l.speed < ALL (SELECT speed FROM pc)
AND l.model = p.model

Задание № 18

SELECT distinct maker, price
FROM product a
JOIN printer b
ON a.model = b.model AND color = 'y'
WHERE price = (SELECT MIN(price) FROM printer WHERE color = 'y')

Задание № 19

-------------------------
Вопросы на собеседование
-------------------------

-----------------------------
Создание необходимой таблицы:
-----------------------------


USE master;  
GO  
--Delete the TestData database if it exists.  
IF EXISTS(SELECT * from sys.databases WHERE name='TestData')  
BEGIN  
    DROP DATABASE TestData;  
END  
--Create a new database called TestData.  
CREATE DATABASE TestData;

USE TestData
GO

CREATE TABLE query_table
	(query varchar(40),
	date_reg datetime null,
	region varchar(40),
	hash bigint,
	);

CREATE TABLE region_table
	(id int,
	name varchar(40),
	population int,
	is_city boolean
	);
	
INSERT query_table (query, date_reg, region, hash)
VALUES	('водій', '2016-08-05 23:41:10.810', 'Київ', 7388294625252170025),
		('водитель', '2016-08-04 23:41:19.573', 'Одеса', 886475788899192942),
		('', '2016-08-04 23:41:27.527', 'Київ', 1464272952244521281),
		('водій', '2016-08-04 23:41:56.143', 'Винницкая область', 4151792716562418318),
		('using OpenQA.Selenium', '2016-08-04 23:42:57.423', 'Харків', 4369084763786110948),
		('водитель', '2016-08-04 23:43:32.197', 'Одеса', 4369084763786110948),
		('Харьковский комбикормовый завод', '2016-08-04 23:44:49.227', 'Київ', 4369084763786110948)
	
INSERT region_table (id, name, population, is_city)
VALUES	(1, 'Київ', 3500620, 1),
		(2, 'Одеса', 253021, 1),
		(3, 'Винницкая область', 325410, 0),
		(4, 'Волынская область', 425632, 0),
		(5, 'Днепропетровская область', 3521142, 0),
		(6, 'Харків', 2500000, 1)

-------------------------
Запросы на собеседование

1) Порахувати кількість queries "водій" в таблиці
2) Вибрати останній по даті query по регіону "Одеса"
3) Порахувати кількість queries по кожному регіону
4) Вивести всі queries, де регіон є містом (is_city) 
5) Вивести queries, назву регіона і кількість його населення за 2016-08-05

-------------------------

1)

SELECT COUNT(query)
FROM query_table
WHERE query like 'водій'

2)

SELECT TOP 1 query
FROM query_table
WHERE region like 'Одеса'
ORDER by date_reg desc

3)

SELECT *
FROM query_table
SELECT COUNT(query) as Count, region
FROM query_table
GROUP by region

4)

SELECT query
FROM query_table a
JOIN region_table b
ON a.region = b.name AND b.is_city = 1

5)

SELECT q.query, r.name, r.population
FROM region_table r, query_table q
WHERE q.region=r.name AND q.date_reg = '2016-08-05 23:41:04.820'


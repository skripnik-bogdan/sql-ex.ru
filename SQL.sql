Задание № 14
?
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


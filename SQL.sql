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

-------------------------------------------------------

Вопросы на собеседование

1)

SELECT COUNT(query)
FROM query_table
WHERE query like 'vodiy'

2)

SELECT query
FROM query_table
WHERE region like 'Odesa'
ORDER by data desc
LIMIT 1

--------------
3) SELECT COUNT(query) as foo
FROM query_table
GROUP by region
4) SELECT query
FROM query_table a
JOIN region_table b
ON a.region = b.name AND is_sity = 1
5) SELECT name r, population r, date q
FROM region_table r, query_table q
WHERE date > '2016-08-05%'
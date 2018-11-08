Задание № 14
?
Задание № 16

SELECT DISTINCT a.model, b.model, b.speed, b.ram
FROM pc a, pc b
WHERE a.speed = b.speed AND a.ram = b.ram AND a.model > b.model

Задание № 17

SELECT type, model
FROM product
WHERE model IN (SELECT model FROM laptop WHERE speed < ANY (SELECT speed FROM pc))



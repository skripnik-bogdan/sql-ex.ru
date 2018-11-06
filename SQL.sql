Задание № 13
?
Задание № 14

SELECT DISTINCT a.model AS model, b.model AS model, b.speed, b.ram
FROM pc a, pc b
WHERE a.speed = b.speed AND a.ram = b.ram
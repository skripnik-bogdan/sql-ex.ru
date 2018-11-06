SELECT DISTINCT maker
FROM product a
LEFT JOIN pc b
ON a.model = b.model
WHERE type = 'pc'
EXCEPT
SELECT DISTINCT maker
FROM product a
RIGHT JOIN pc b
ON a.model = b.model
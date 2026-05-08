-- 1. CTE Recursiva: Ver categorías como un árbol [cite: 30]
WITH RECURSIVE Arbol AS (
    SELECT id, nombre, parent_id, 1 as nivel FROM categorias WHERE parent_id IS NULL
    UNION ALL
    SELECT c.id, c.nombre, c.parent_id, a.nivel + 1 FROM categorias c JOIN Arbol a ON c.parent_id = a.id
) SELECT * FROM Arbol;

-- 2. Window Function: Ranking de productos más caros [cite: 29]
SELECT nombre, precio, RANK() OVER (ORDER BY precio DESC) as ranking FROM productos LIMIT 10;

-- Generar 1.000.000 de registros en productos para "sentir el peso" [cite: 16]
INSERT INTO productos (nombre, precio, detalles_jsonb)
SELECT 
    'Producto ' || i, 
    (random() * 1000)::decimal(10,2),
    jsonb_build_object('stock', floor(random()*100), 'oferta', (random() > 0.5))
FROM generate_series(1, 1000000) s(i);

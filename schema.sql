-- Estructura del Supermercado (3NF) [cite: 13]
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    parent_id INTEGER REFERENCES categorias(id) -- Para Categorías Anidadas [cite: 30]
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150),
    categoria_id INTEGER REFERENCES categorias(id),
    precio DECIMAL(10,2),
    detalles_jsonb JSONB -- Para el índice GIN [cite: 22]
);

-- Creación de Índices [cite: 17]
CREATE INDEX idx_productos_precio ON productos USING btree (precio); -- B-Tree [cite: 19]
CREATE INDEX idx_productos_nombre_hash ON productos USING hash (nombre); -- Hash [cite: 20]
CREATE INDEX idx_productos_detalles_gin ON productos USING GIN (detalles_jsonb); -- GIN [cite: 22]

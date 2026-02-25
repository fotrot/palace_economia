CREATE TABLE IF NOT EXISTS economia_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    precio_base BIGINT NOT NULL,
    precio_actual BIGINT NOT NULL,
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
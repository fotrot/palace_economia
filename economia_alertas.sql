CREATE TABLE IF NOT EXISTS economia_alertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100),
    descripcion TEXT,
    nivel VARCHAR(20),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
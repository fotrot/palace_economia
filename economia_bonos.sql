CREATE TABLE IF NOT EXISTS economia_bonos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizenid VARCHAR(50) NOT NULL,
    monto BIGINT NOT NULL,
    interes FLOAT DEFAULT 5.0,
    fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento TIMESTAMP NULL,
    estado VARCHAR(20) DEFAULT 'activo'
);
CREATE TABLE IF NOT EXISTS economia_empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    citizenid VARCHAR(50) NOT NULL,
    nombre VARCHAR(100),
    rango VARCHAR(50),
    decisiones INT DEFAULT 0,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
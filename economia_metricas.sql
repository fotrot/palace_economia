CREATE TABLE IF NOT EXISTS economia_metricas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    inflacion FLOAT NOT NULL,
    deuda BIGINT NOT NULL,
    riesgo INT NOT NULL,
    confianza INT NOT NULL,
    masa BIGINT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
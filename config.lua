Config = {}

-- =====================================================
-- CONFIGURACIÓN GENERAL
-- =====================================================

Config.Debug = false

-- Intervalos (en milisegundos)
Config.Intervalos = {
    SnapshotMetricas = 30 * 60 * 1000,   -- 30 minutos
    ActualizacionInflacion = 15 * 60 * 1000, -- 15 minutos
    ActualizacionPrecios = 20 * 60 * 1000, -- 20 minutos
    CobroImpuestos = 60 * 60 * 1000      -- 1 hora
}

-- =====================================================
-- BANCO CENTRAL
-- =====================================================

Config.BancoCentral = {
    Trabajo = "bcentral", -- nombre del job en qbox
    Permisos = {
        "director",
        "presidente"
    }
}

-- =====================================================
-- MASA MONETARIA
-- =====================================================

Config.MasaMonetaria = {
    LimiteCritico = 500000000, -- alerta roja
    EmisionMaximaPorOperacion = 50000000
}

-- =====================================================
-- INFLACIÓN
-- =====================================================

Config.Inflacion = {
    Base = 2.0,
    Maxima = 100.0,
    Minima = -10.0,

    ImpactoMasa = 0.00000001, -- impacto de emisión
    ImpactoConfianza = 0.02   -- baja confianza sube inflación
}

-- =====================================================
-- PRESUPUESTO E IMPUESTOS
-- =====================================================

Config.Impuestos = {
    Minimo = 2000,
    Maximo = 5000,
    PorcentajeBase = 5, -- si se usa sistema porcentual
}

-- =====================================================
-- DEUDA PÚBLICA
-- =====================================================

Config.Deuda = {
    LimiteRiesgo = 1000000000, -- 1B
    InteresBase = 5.0,
    InteresMaximo = 20.0
}

-- =====================================================
-- RIESGO PAÍS
-- =====================================================

Config.RiesgoPais = {
    Base = 100,
    Maximo = 5000,
    ImpactoDeuda = 0.000001,
    ImpactoInflacion = 5
}

-- =====================================================
-- CONFIANZA ECONÓMICA
-- =====================================================

Config.Confianza = {
    Inicial = 70,
    Maxima = 100,
    Minima = 0
}

-- =====================================================
-- PRECIOS DINÁMICOS
-- =====================================================

Config.Precios = {
    MultiplicadorInflacion = true,
    AjusteMaximo = 3.0 -- máximo 300% del precio base
}

-- =====================================================
-- BONOS
-- =====================================================

Config.Bonos = {
    DuracionDias = 7,
    InteresDefault = 5.0,
    PenalizacionDefault = 10 -- baja confianza si no paga
}

-- =====================================================
-- WEBHOOK
-- =====================================================

Config.Webhook = {
    Habilitado = true,
    URL = "https://discord.com/api/webhooks/1476029982693261436/Onaqs-UyHUrzAYUjWgomM1kCLP8BTBR3lbnZ5He9j2Yq1C1_Thwoe9RDkYFT4WEQkgXp"
}
-- =========================================
-- PALACE ECONOMIA V4
-- SHARED UTILIDADES Y FORMULAS MACRO
-- =========================================

Utils = {}

-- =========================================
-- REDONDEO
-- =========================================

function Utils.Round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- =========================================
-- FORMATEO MONEDA
-- =========================================

function Utils.FormatMoney(amount)
    local formatted = tostring(math.floor(amount))
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1.%2")
        if k == 0 then break end
    end
    return "$" .. formatted
end

-- =========================================
-- LIMITADOR GENERICO
-- =========================================

function Utils.Clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

-- =========================================
-- RATIO DEUDA / MASA
-- =========================================

function Utils.GetRatioDeudaMasa(deuda, masa)
    if masa <= 0 then return 0 end
    return Utils.Round((deuda / masa) * 100, 2)
end

-- =========================================
-- CALCULO ESTABILIDAD ECONOMICA
-- =========================================

function Utils.CalcularEstabilidad(inflacion, riesgo, confianza)

    -- Base 100%
    local estabilidad = 100

    -- Penalizacion por inflacion
    estabilidad = estabilidad - (inflacion * 2)

    -- Penalizacion por riesgo pais
    estabilidad = estabilidad - (riesgo / 50)

    -- Bonificacion por confianza
    estabilidad = estabilidad + (confianza / 5)

    return Utils.Clamp(Utils.Round(estabilidad, 2), 0, 100)
end

-- =========================================
-- ESTADO MACROECONOMICO
-- =========================================

function Utils.GetEstadoPais(inflacion, deudaRatio, confianza)

    if inflacion >= 25 then
        return "HIPERINFLACIÓN"
    end

    if deudaRatio >= 80 then
        return "CRISIS DE DEUDA"
    end

    if confianza <= 30 then
        return "RECESIÓN PROFUNDA"
    end

    if inflacion >= 12 then
        return "INFLACIÓN ALTA"
    end

    if inflacion <= 2 and confianza >= 70 then
        return "EXPANSIÓN ECONÓMICA"
    end

    return "ESTABLE"
end

-- =========================================
-- IMPACTO EMISION MONETARIA
-- =========================================

function Utils.CalcularImpactoEmision(montoEmitido, masaActual)

    if masaActual <= 0 then return 0 end

    local impacto = (montoEmitido / masaActual) * 10
    return Utils.Round(impacto, 2)
end

-- =========================================
-- IMPACTO GASTO PUBLICO
-- =========================================

function Utils.CalcularImpactoGasto(montoGasto, presupuesto)

    if presupuesto <= 0 then return 0 end

    local impacto = (montoGasto / presupuesto) * 5
    return Utils.Round(impacto, 2)
end

-- =========================================
-- IMPACTO BONOS / ENDEUDAMIENTO
-- =========================================

function Utils.CalcularImpactoDeuda(nuevaDeuda, masaActual)

    if masaActual <= 0 then return 0 end

    local impacto = (nuevaDeuda / masaActual) * 3
    return Utils.Round(impacto, 2)
end

-- =========================================
-- VARIACION RIESGO PAIS
-- =========================================

function Utils.CalcularRiesgo(inflacion, deudaRatio)

    local riesgo = 100

    riesgo = riesgo + (inflacion * 8)
    riesgo = riesgo + (deudaRatio * 1.5)

    return Utils.Clamp(math.floor(riesgo), 100, 5000)
end
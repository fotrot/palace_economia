-- =========================================
-- SISTEMA PRECIOS DINAMICOS
-- =========================================

Precios = {}

function Precios.GetMultiplicador()
    return 1 + (Economia.Inflacion / 100)
end
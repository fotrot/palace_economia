-- =========================================
-- PALACE ECONOMIA V4
-- CONTROL MASA MONETARIA
-- =========================================

-- =========================================
-- EMITIR DINERO
-- =========================================

RegisterNetEvent("palace:bc:emitirDinero", function(monto)

    local src = source
    monto = tonumber(monto)

    if not monto or monto <= 0 then return end

    Economia.MasaMonetaria = Economia.MasaMonetaria + monto
    Economia.DecisionesTomadas = Economia.DecisionesTomadas + 1

    -- Impacto inflacionario
    local impactoInflacion = Utils.CalcularImpactoEmision(
        monto,
        Economia.MasaMonetaria
    )

    Economia.Inflacion = Economia.Inflacion + impactoInflacion

    -- Baja confianza si emisión fuerte
    if impactoInflacion > 1 then
        Economia.Confianza = Economia.Confianza - 2
    end

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Banco Central",
        "Se emitieron $" .. monto .. " en nueva masa monetaria",
        "inform"
    )

end)

-- =========================================
-- MODIFICAR TASA INTERES
-- =========================================

RegisterNetEvent("palace:bc:modificarTasa", function(tipo)

    Economia.DecisionesTomadas = Economia.DecisionesTomadas + 1

    if tipo == "subir" then

        Economia.Inflacion = Economia.Inflacion - 0.5
        Economia.Confianza = Economia.Confianza + 2

        TriggerClientEvent("palace:notificacionGeneral", -1,
            "Política Contractiva",
            "Se aumentó la tasa de interés",
            "success"
        )

    elseif tipo == "bajar" then

        Economia.Inflacion = Economia.Inflacion + 0.5
        Economia.Confianza = Economia.Confianza - 2

        TriggerClientEvent("palace:notificacionGeneral", -1,
            "Política Expansiva",
            "Se redujo la tasa de interés",
            "warning"
        )

    end

    Economia.Inflacion = Utils.Clamp(Economia.Inflacion, 0, 100)
    Economia.Confianza = Utils.Clamp(Economia.Confianza, 0, 100)

    Economia.Recalcular()

end)

-- =========================================
-- AJUSTE AUTOMATICO MASA (SIMULACION CICLO)
-- =========================================

CreateThread(function()

    while true do
        Wait(600000) -- 10 minutos

        -- crecimiento natural economía
        local crecimiento = Economia.MasaMonetaria * 0.001
        Economia.MasaMonetaria = Economia.MasaMonetaria + crecimiento

        Economia.Recalcular()

    end

end)
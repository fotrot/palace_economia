-- =========================================
-- POLITICA FISCAL - PRESUPUESTO
-- =========================================

RegisterNetEvent("palace:bc:gastoPublico", function(monto)

    local src = source
    monto = tonumber(monto)
    if not monto or monto <= 0 then return end

    Economia.PresupuestoEstado = Economia.PresupuestoEstado - monto
    Economia.DecisionesTomadas = Economia.DecisionesTomadas + 1

    -- Impacto inflacionario leve
    local impacto = Utils.CalcularImpactoGasto(
        monto,
        Economia.PresupuestoEstado + monto
    )

    Economia.Inflacion = Economia.Inflacion + impacto
    Economia.Confianza = Economia.Confianza - 1

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Gasto Público Aprobado",
        "El Estado aprobó un gasto de $" .. monto,
        "inform"
    )

end)
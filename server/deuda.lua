-- =========================================
-- DEUDA PUBLICA
-- =========================================

RegisterNetEvent("palace:bc:emitirBonos", function(monto)

    monto = tonumber(monto)
    if not monto or monto <= 0 then return end

    Economia.DeudaPublica = Economia.DeudaPublica + monto
    Economia.PresupuestoEstado = Economia.PresupuestoEstado + monto
    Economia.DecisionesTomadas += 1

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Bonos Emitidos",
        "Se emitieron bonos por $" .. monto,
        "warning"
    )

end)

RegisterNetEvent("palace:bc:pagarDeuda", function(monto)

    monto = tonumber(monto)
    if not monto or monto <= 0 then return end

    if Economia.PresupuestoEstado < monto then return end

    Economia.DeudaPublica = Economia.DeudaPublica - monto
    Economia.PresupuestoEstado = Economia.PresupuestoEstado - monto
    Economia.DecisionesTomadas += 1

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Pago de Deuda",
        "Se pagaron $" .. monto .. " de deuda pública",
        "success"
    )

end)
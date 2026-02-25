-- =========================================
-- DEUDA PUBLICA
-- =========================================

RegisterNetEvent("palace:bc:emitirBonos", function(monto)

    if not Economia.TienePermisoBC(source) then return end

    monto = tonumber(monto)
    if not monto or monto <= 0 then return end

    Economia.DeudaPublica = Economia.DeudaPublica + monto
    Economia.PresupuestoEstado = Economia.PresupuestoEstado + monto
    Economia.DecisionesTomadas = Economia.DecisionesTomadas + 1

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Bonos Emitidos",
        "Se emitieron bonos por $" .. monto,
        "warning"
    )

end)

RegisterNetEvent("palace:bc:pagarDeuda", function(monto)

    if not Economia.TienePermisoBC(source) then return end

    monto = tonumber(monto)
    if not monto or monto <= 0 then return end

    if Economia.PresupuestoEstado < monto then return end

    Economia.DeudaPublica = math.max(Economia.DeudaPublica - monto, 0)
    Economia.PresupuestoEstado = Economia.PresupuestoEstado - monto
    Economia.DecisionesTomadas = Economia.DecisionesTomadas + 1

    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", -1,
        "Pago de Deuda",
        "Se pagaron $" .. monto .. " de deuda pública",
        "success"
    )

end)
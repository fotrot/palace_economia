-- =========================================
-- SNAPSHOT METRICAS
-- =========================================

RegisterNetEvent("palace:bc:getMetricas", function()

    local src = source

    if not Economia.TienePermisoBC(src) then return end

    TriggerClientEvent("palace:bc:enviarMetricas", src, {
        impuestos = Economia.TotalImpuestosRecaudados,
        decisiones = Economia.DecisionesTomadas,
        estabilidad = Economia.Estabilidad
    })

end)

CreateThread(function()

    while true do
        Wait(Config.Intervalos.SnapshotMetricas or 1800000) -- 30 minutos

        local snap = Economia.GetSnapshot()

        MySQL.insert([[
            INSERT INTO economia_metricas
            (inflacion, deuda, riesgo, confianza, masa)
            VALUES (?, ?, ?, ?, ?)
        ]], {
            snap.inflacion,
            snap.deuda,
            snap.riesgo,
            snap.confianza,
            snap.masa
        })

    end

end)
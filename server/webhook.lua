-- =========================================
-- WEBHOOK BANCO CENTRAL
-- =========================================

function EnviarReporte()

    if not Config.Webhook.Habilitado or not Config.Webhook.URL or Config.Webhook.URL == "" then
        return
    end

    Economia.Recalcular()

    local snap = Economia.GetSnapshot()

    local embed = {
        username = "Banco Central",
        embeds = {{
            title = "📊 Informe Económico Oficial",
            description =
                "Inflación: " .. snap.inflacion .. "%\n" ..
                "Deuda Pública: $" .. snap.deuda .. "\n" ..
                "Masa Monetaria: $" .. snap.masa .. "\n" ..
                "Riesgo País: " .. snap.riesgo .. "\n" ..
                "Confianza: " .. snap.confianza .. "%\n" ..
                "Estabilidad: " .. snap.estabilidad .. "%\n" ..
                "Estado: " .. snap.estado
        }}
    }

    PerformHttpRequest(Config.Webhook.URL,
        function() end,
        "POST",
        json.encode(embed),
        { ["Content-Type"] = "application/json" }
    )

end

RegisterNetEvent("palace:bc:forzarReporte", function()
    if not Economia.TienePermisoBC(source) then return end
    EnviarReporte()
end)

CreateThread(function()
    while true do
        Wait((Config.Intervalos.SnapshotMetricas or (30 * 60 * 1000)) * 2)
        EnviarReporte()
    end
end)

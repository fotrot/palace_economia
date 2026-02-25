-- =========================================
-- WEBHOOK BANCO CENTRAL
-- =========================================

function EnviarReporte()

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

    PerformHttpRequest(Config.Webhook,
        function() end,
        "POST",
        json.encode(embed),
        { ["Content-Type"] = "application/json" }
    )

end

RegisterNetEvent("palace:bc:forzarReporte", function()
    EnviarReporte()
end)

CreateThread(function()
    while true do
        Wait(Config.ReporteIntervalo * 60000)
        EnviarReporte()
    end
end)
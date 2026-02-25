-- =========================================
-- PANEL METRICAS Y KPI
-- =========================================

RegisterNetEvent("palace:bc:metricas", function()

    TriggerServerEvent("palace:bc:getMetricas")

end)

RegisterNetEvent("palace:bc:enviarMetricas", function(data)

    lib.registerContext({
        id = "bc_metricas",
        title = "📈 Métricas Banco Central",
        options = {
            {
                title = "Total Impuestos Recaudados",
                description = "$" .. data.impuestos
            },
            {
                title = "Decisiones Tomadas",
                description = data.decisiones
            },
            {
                title = "Nivel de Estabilidad",
                description = data.estabilidad .. "%"
            }
        }
    })

    lib.showContext("bc_metricas")

end)
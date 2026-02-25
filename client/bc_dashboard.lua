-- =========================================
-- DASHBOARD ECONOMICO
-- =========================================

RegisterNetEvent("palace:bc:dashboard", function()

    TriggerServerEvent("palace:bc:getEstado")

end)

RegisterNetEvent("palace:bc:enviarEstado", function(data)

    lib.registerContext({
        id = "bc_dashboard",
        title = "📊 Estado Económico Nacional",
        options = {
            {
                title = "Inflación",
                description = data.inflacion .. "%"
            },
            {
                title = "Deuda Pública",
                description = "$" .. data.deuda
            },
            {
                title = "Masa Monetaria",
                description = "$" .. data.masa
            },
            {
                title = "Presupuesto Estado",
                description = "$" .. data.presupuesto
            },
            {
                title = "Riesgo País",
                description = data.riesgo .. " pts"
            },
            {
                title = "Confianza Inversora",
                description = data.confianza .. "%"
            }
        }
    })

    lib.showContext("bc_dashboard")

end)
-- =========================================
-- REPORTES ECONOMICOS
-- =========================================

RegisterNetEvent("palace:bc:reportes", function()

    lib.registerContext({
        id = "bc_reportes",
        title = "📑 Reportes Oficiales",
        options = {
            {
                title = "Enviar Reporte Oficial",
                onSelect = function()
                    TriggerServerEvent("palace:bc:forzarReporte")
                end
            }
        }
    })

    lib.showContext("bc_reportes")

end)
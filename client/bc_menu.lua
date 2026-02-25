-- =========================================
-- MENU PRINCIPAL BANCO CENTRAL
-- =========================================

RegisterCommand("bcentral", function()

    lib.registerContext({
        id = "bc_menu_principal",
        title = "🏛 Banco Central",
        options = {
            { title = "📊 Dashboard Económico", event = "palace:bc:dashboard" },
            { title = "💰 Política Monetaria", event = "palace:bc:monetaria" },
            { title = "🏦 Política Fiscal", event = "palace:bc:fiscal" },
            { title = "📉 Deuda Pública", event = "palace:bc:deuda" },
            { title = "📈 Métricas y KPI", event = "palace:bc:metricas" },
            { title = "📑 Reportes Económicos", event = "palace:bc:reportes" }
        }
    })

    lib.showContext("bc_menu_principal")

end)
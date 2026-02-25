-- =========================================
-- PALACE ECONOMIA V4
-- BANCO CENTRAL SISTEMA MACROECONOMICO
-- =========================================

fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Palace Development'
description 'Sistema Economico Nacional - Banco Central Operativo IC'
version '4.0.0'

-- =========================================
-- DEPENDENCIAS
-- =========================================

dependencies {
    'ox_lib',
    'oxmysql',
    'qbx_core'
}

-- =========================================
-- SHARED
-- =========================================

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared/utils.lua'
}

-- =========================================
-- CLIENT
-- =========================================

client_scripts {
    'client/notificaciones.lua',
    'client/bc_menu.lua',
    'client/bc_dashboard.lua',
    'client/bc_monetaria.lua',
    'client/bc_fiscal.lua',
    'client/bc_deuda.lua',
    'client/bc_metricas.lua',
    'client/bc_reportes.lua'
}

-- =========================================
-- SERVER
-- =========================================

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'server/main.lua',
    'server/masa.lua',
    'server/inflacion.lua',
    'server/presupuesto.lua',
    'server/impuestos.lua',
    'server/deuda.lua',
    'server/riesgo.lua',
    'server/precios.lua',
    'server/bonos.lua',
    'server/bc_logs.lua',
    'server/bc_metricas.lua',
    'server/bc_gestion.lua',
    'server/webhook.lua',
    'server/comandos.lua'
}
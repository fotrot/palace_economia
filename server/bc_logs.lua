-- =========================================
-- LOGS BANCO CENTRAL
-- =========================================

function BC_Log(accion, empleado)

    MySQL.insert([[
        INSERT INTO economia_logs (accion, empleado)
        VALUES (?, ?)
    ]], { accion, empleado })

end
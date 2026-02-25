-- =========================================
-- PALACE ECONOMIA V4
-- NOTIFICACIONES CLIENT
-- =========================================

RegisterNetEvent("palace:notificarImpuesto", function(prop, salud, total)
    lib.notify({
        id = "impuestos_bc",
        title = "Banco Central - Cobro de Impuestos",
        description =
            "• Impuesto Propiedades: $" .. prop .. "\n" ..
            "• Impuesto Salud: $" .. salud .. "\n\n" ..
            "TOTAL DEBITADO: $" .. total,
        position = "top-right",
        type = "warning",
        duration = 10000
    })
end)

RegisterNetEvent("palace:notificacionGeneral", function(titulo, mensaje, tipo)
    lib.notify({
        title = titulo,
        description = mensaje,
        position = "top-right",
        type = tipo or "inform",
        duration = 8000
    })
end)
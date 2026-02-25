-- =========================================
-- POLITICA MONETARIA
-- =========================================

RegisterNetEvent("palace:bc:monetaria", function()

    lib.registerContext({
        id = "bc_monetaria",
        title = "💰 Política Monetaria",
        options = {
            {
                title = "Emitir Dinero",
                onSelect = function()
                    local input = lib.inputDialog("Emitir Dinero", {
                        { type = "number", label = "Monto a emitir" }
                    })

                    if input then
                        TriggerServerEvent("palace:bc:emitirDinero", input[1])
                    end
                end
            },
            {
                title = "Subir Tasa de Interés",
                onSelect = function()
                    TriggerServerEvent("palace:bc:modificarTasa", "subir")
                end
            },
            {
                title = "Bajar Tasa de Interés",
                onSelect = function()
                    TriggerServerEvent("palace:bc:modificarTasa", "bajar")
                end
            }
        }
    })

    lib.showContext("bc_monetaria")

end)
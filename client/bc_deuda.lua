-- =========================================
-- GESTION DEUDA PUBLICA
-- =========================================

RegisterNetEvent("palace:bc:deuda", function()

    lib.registerContext({
        id = "bc_deuda",
        title = "📉 Gestión Deuda Pública",
        options = {
            {
                title = "Emitir Bonos",
                onSelect = function()
                    local input = lib.inputDialog("Emitir Bonos", {
                        { type = "number", label = "Monto Bonos" }
                    })

                    if input then
                        TriggerServerEvent("palace:bc:emitirBonos", input[1])
                    end
                end
            },
            {
                title = "Pagar Deuda",
                onSelect = function()
                    local input = lib.inputDialog("Pagar Deuda", {
                        { type = "number", label = "Monto a pagar" }
                    })

                    if input then
                        TriggerServerEvent("palace:bc:pagarDeuda", input[1])
                    end
                end
            }
        }
    })

    lib.showContext("bc_deuda")

end)
-- =========================================
-- POLITICA FISCAL
-- =========================================

RegisterNetEvent("palace:bc:fiscal", function()

    lib.registerContext({
        id = "bc_fiscal",
        title = "🏦 Política Fiscal",
        options = {
            {
                title = "Aprobar Gasto Público",
                onSelect = function()
                    local input = lib.inputDialog("Gasto Público", {
                        { type = "number", label = "Monto a gastar" }
                    })

                    if input then
                        TriggerServerEvent("palace:bc:gastoPublico", input[1])
                    end
                end
            }
        }
    })

    lib.showContext("bc_fiscal")

end)
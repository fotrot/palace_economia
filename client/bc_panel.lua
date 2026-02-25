RegisterNetEvent("bc:abrirUI", function(data)

    lib.registerContext({
        id = 'bc_panel',
        title = 'Banco Central Palace',
        options = {

            {
                title = "Ver Estado Económico",
                description = "Inflación, deuda, riesgo",
                onSelect = function()

                    lib.notify({
                        title = "Estado Actual",
                        description =
                        "Inflación: "..string.format("%.2f%%",(data.InflacionGlobal-1)*100)
                        .."\nDeuda: $"..math.floor(data.DeudaPublica)
                        .."\nRiesgo País: "..data.RiesgoPais
                        .."\nConfianza: "..data.ConfianzaMercado.."%"
                    })

                end
            }
        }
    })

    lib.showContext('bc_panel')
end)
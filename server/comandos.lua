RegisterCommand("cobrarpuestos", function(source)
    Impuestos.CobrarTodos()
end, true)

RegisterCommand("reporte", function(source)
    EnviarReporte()
end, true)
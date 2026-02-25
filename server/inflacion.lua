-- =========================================
-- PALACE ECONOMIA V4
-- SISTEMA DINAMICO DE INFLACION
-- =========================================

CreateThread(function()

    while true do
        Wait(600000) -- 10 minutos

        -- Variación base aleatoria
        local variacionBase = math.random(-2, 3) * 0.1

        -- Impacto deuda
        local deudaRatio = Utils.GetRatioDeudaMasa(
            Economia.DeudaPublica,
            Economia.MasaMonetaria
        )

        local impactoDeuda = deudaRatio * 0.01

        -- Impacto confianza
        local impactoConfianza = (50 - Economia.Confianza) * 0.02

        -- Aplicar cambios
        Economia.Inflacion = Economia.Inflacion +
                             variacionBase +
                             impactoDeuda +
                             impactoConfianza

        Economia.Inflacion = Utils.Clamp(Economia.Inflacion, 0, 100)

        Economia.Recalcular()

    end

end)
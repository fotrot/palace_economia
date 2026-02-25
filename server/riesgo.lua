-- =========================================
-- SISTEMA RIESGO PAIS DINAMICO
-- =========================================

CreateThread(function()

    while true do
        Wait(900000) -- 15 minutos

        Economia.Recalcular()

    end

end)
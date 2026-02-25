-- =========================================
-- PALACE ECONOMIA V4
-- CORE ECONOMICO PRINCIPAL
-- =========================================

Economia = {}

-- =========================================
-- VALORES INICIALES DEL PAIS
-- =========================================

Economia.Inflacion = 5.0
Economia.MasaMonetaria = 100000000
Economia.PresupuestoEstado = 5000000
Economia.DeudaPublica = 10000000
Economia.RiesgoPais = 250
Economia.Confianza = 75
Economia.TotalImpuestosRecaudados = 0
Economia.DecisionesTomadas = 0

Economia.Estabilidad = 100
Economia.EstadoPais = "ESTABLE"

function Economia.TienePermisoBC(src)

    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return false end

    local jobData = Player.PlayerData.job or {}
    local requiredJob = Config.BancoCentral.Trabajo

    if jobData.name ~= requiredJob then
        return false
    end

    local permisos = Config.BancoCentral.Permisos or {}
    local gradeName = (jobData.grade and jobData.grade.name) or ""

    for _, permiso in ipairs(permisos) do
        if gradeName == permiso then
            return true
        end
    end

    return false

end

-- =========================================
-- RECALCULO GLOBAL ECONOMICO
-- =========================================

function Economia.Recalcular()

    local deudaRatio = Utils.GetRatioDeudaMasa(
        Economia.DeudaPublica,
        Economia.MasaMonetaria
    )

    Economia.RiesgoPais = Utils.CalcularRiesgo(
        Economia.Inflacion,
        deudaRatio
    )

    Economia.Estabilidad = Utils.CalcularEstabilidad(
        Economia.Inflacion,
        Economia.RiesgoPais,
        Economia.Confianza
    )

    Economia.EstadoPais = Utils.GetEstadoPais(
        Economia.Inflacion,
        deudaRatio,
        Economia.Confianza
    )

end

-- =========================================
-- ALERTAS AUTOMATICAS
-- =========================================

function Economia.VerificarAlertas()

    if Economia.Inflacion >= 15 then
        TriggerClientEvent("palace:notificacionGeneral", -1,
            "ALERTA ECONÓMICA",
            "Inflación crítica detectada (" .. Economia.Inflacion .. "%)",
            "error"
        )
    end

    if Economia.Confianza <= 30 then
        TriggerClientEvent("palace:notificacionGeneral", -1,
            "CRISIS DE CONFIANZA",
            "La confianza inversora está en niveles peligrosos",
            "warning"
        )
    end

    if Economia.PresupuestoEstado < 0 then
        TriggerClientEvent("palace:notificacionGeneral", -1,
            "DÉFICIT FISCAL",
            "El Estado se encuentra en déficit",
            "warning"
        )
    end

end

-- =========================================
-- ENVIO ESTADO AL CLIENTE (Dashboard)
-- =========================================

RegisterNetEvent("palace:bc:getEstado", function()

    local src = source

    if not Economia.TienePermisoBC(src) then
        TriggerClientEvent("palace:notificacionGeneral", src,
            "Acceso denegado",
            "No tienes permisos del Banco Central.",
            "error"
        )
        return
    end

    Economia.Recalcular()

    TriggerClientEvent("palace:bc:enviarEstado", src, {
        inflacion = Utils.Round(Economia.Inflacion, 2),
        deuda = Utils.Round(Economia.DeudaPublica, 0),
        masa = Utils.Round(Economia.MasaMonetaria, 0),
        presupuesto = Utils.Round(Economia.PresupuestoEstado, 0),
        riesgo = Economia.RiesgoPais,
        confianza = Economia.Confianza,
        estabilidad = Economia.Estabilidad,
        estado = Economia.EstadoPais
    })

end)

-- =========================================
-- SISTEMA DE SNAPSHOT AUTOMATICO
-- (se usa luego en bc_metricas.lua)
-- =========================================

function Economia.GetSnapshot()

    Economia.Recalcular()

    return {
        inflacion = Economia.Inflacion,
        deuda = Economia.DeudaPublica,
        masa = Economia.MasaMonetaria,
        riesgo = Economia.RiesgoPais,
        confianza = Economia.Confianza,
        estabilidad = Economia.Estabilidad,
        estado = Economia.EstadoPais
    }

end

-- =========================================
-- HILO GLOBAL DE MONITOREO
-- =========================================

CreateThread(function()

    while true do
        Wait(300000) -- 5 minutos

        Economia.Recalcular()
        Economia.VerificarAlertas()

    end

end)

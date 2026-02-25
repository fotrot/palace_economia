-- =========================================
-- SISTEMA IMPUESTOS
-- =========================================

Impuestos = {}

function Impuestos.CalcularPropiedades(Player)

    local bank = Player.Functions.GetMoney("bank") or 0
    local porcentaje = Config.ImpuestoPropiedades or 0.05

    return math.floor(bank * porcentaje)

end

function Impuestos.CobrarJugador(src)

    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    local impuestoProp = Impuestos.CalcularPropiedades(Player)
    local impuestoSalud = math.random(Config.SaludMin, Config.SaludMax)

    local total = impuestoProp + impuestoSalud

    Player.Functions.RemoveMoney("bank", total)

    Economia.TotalImpuestosRecaudados += total
    Economia.PresupuestoEstado += total

    Economia.Recalcular()

    TriggerClientEvent("palace:notificarImpuesto",
        src, impuestoProp, impuestoSalud, total)

end

function Impuestos.CobrarTodos()

    for _, src in pairs(GetPlayers()) do
        Impuestos.CobrarJugador(src)
    end

end

CreateThread(function()
    while true do
        Wait(Config.ImpuestosIntervalo * 60000)
        Impuestos.CobrarTodos()
    end
end)
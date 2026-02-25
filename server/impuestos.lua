-- =========================================
-- SISTEMA IMPUESTOS
-- =========================================

Impuestos = {}

function Impuestos.CalcularPropiedades(Player)

    local bank = Player.Functions.GetMoney("bank") or 0
    local porcentaje = (Config.Impuestos.PorcentajeBase or 5) / 100

    return math.floor(bank * porcentaje)

end

function Impuestos.CobrarJugador(src)

    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    local impuestoProp = Impuestos.CalcularPropiedades(Player)
    local impuestoSalud = math.random(
        Config.Impuestos.Minimo or 2000,
        Config.Impuestos.Maximo or 5000
    )

    local total = impuestoProp + impuestoSalud
    local bank = Player.Functions.GetMoney("bank") or 0

    if total <= 0 or bank <= 0 then return end
    if total > bank then total = bank end

    if not Player.Functions.RemoveMoney("bank", total) then return end

    Economia.TotalImpuestosRecaudados = Economia.TotalImpuestosRecaudados + total
    Economia.PresupuestoEstado = Economia.PresupuestoEstado + total

    Economia.Recalcular()

    TriggerClientEvent("palace:notificarImpuesto",
        src, impuestoProp, impuestoSalud, total)

end

function Impuestos.CobrarTodos()

    for _, src in pairs(GetPlayers()) do
        Impuestos.CobrarJugador(tonumber(src))
    end

end

CreateThread(function()
    while true do
        Wait(Config.Intervalos.CobroImpuestos or (60 * 60 * 1000))
        Impuestos.CobrarTodos()
    end
end)

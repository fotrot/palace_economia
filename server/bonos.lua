RegisterCommand("comprarbono", function(source, args)

    local monto = tonumber(args[1])
    if not monto or monto <= 0 then return end

    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end

    local bank = Player.Functions.GetMoney("bank") or 0
    if bank < monto then return end

    if not Player.Functions.RemoveMoney("bank", monto) then return end

    local interes = Config.Bonos.InteresDefault or Config.Deuda.InteresBase or 5.0

    MySQL.insert.await(
        'INSERT INTO economia_bonos (citizenid, monto, interes) VALUES (?, ?, ?)',
        {
            Player.PlayerData.citizenid,
            monto,
            interes
        }
    )

    Economia.DeudaPublica = math.max(Economia.DeudaPublica - monto, 0)
    Economia.Recalcular()

    TriggerClientEvent("palace:notificacionGeneral", source,
        "Bono comprado",
        "Compraste un bono por $" .. monto .. " al " .. interes .. "%.",
        "success"
    )
end)

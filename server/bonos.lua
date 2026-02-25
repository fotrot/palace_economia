RegisterCommand("comprarbono", function(source, args)

    local monto = tonumber(args[1])
    if not monto then return end

    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end

    if Player.PlayerData.money.bank < monto then return end

    Player.Functions.RemoveMoney("bank", monto)

    MySQL.insert.await(
        'INSERT INTO economia_bonos (citizenid, monto, interes) VALUES (?, ?, ?)',
        {
            Player.PlayerData.citizenid,
            monto,
            Economia.TasaInteresBase
        }
    )

    Economia.DeudaPublica =
        Economia.DeudaPublica - monto
end)
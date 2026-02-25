RegisterNetEvent("bc:abrirPanel", function()

    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return end

    if Player.PlayerData.job.name ~= "bancocentral" then return end

    TriggerClientEvent("bc:abrirUI", source, Economia)
end)
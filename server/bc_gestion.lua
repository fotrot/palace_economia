RegisterNetEvent("bc:abrirPanel", function()

    local src = source
    if not Economia.TienePermisoBC(src) then return end

    TriggerClientEvent("bc:abrirUI", src, Economia)
end)

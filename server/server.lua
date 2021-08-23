local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterCommand(Config.CommandName, Config.Authorized, function(xPlayer, args, showError)
    local ped = GetPedSet(args.ped)
    if ped ~= nil then
        args.playerId.triggerEvent('fnx-setPed', ped)
        Citizen.Wait(1000)
        SetPlayerModel(GetPlayerPed(args.playerId.source), GetHashKey(ped))
        if Config.DB == 'mysql-async' then
            MySQL.Async.execute('UPDATE users SET ped=@ped WHERE identifier =@identifier', {
                ['@identifier'] = args.playerId.identifier,
                ['@ped'] = ped
            })
        elseif Config.DB == 'ghmattimysql' then
            exports['ghmattimysql']:execute("UPDATE users SET ped='" .. ped .. "' WHERE identifier ='" ..args.playerId.identifier .. "'")
        end
        if Config.WebHook ~= nil then
            PerformHttpRequest(Config.WebHook, function(Error, Content, Head)
            end, 'POST', json.encode({
                username = 'fnx-setPed',
                content = string.format('``` ```**USATO COMANDO SETPED**: `ID:` **' .. xPlayer.source ..'** *Ha settato il ped a* `ID:` **' .. args.playerId.source ..'**\n```MODEL: %s```', ped)
            }), {
                ['Content-Type'] = 'application/json'
            })
        end
        xPlayer.showNotification(string.format('Settato il ped a %s',args.playerId.source))
    else
        xPlayer.showNotification('PED non esistente')
    end
end, true, {
    help = 'Set ped',
    validate = true,
    arguments = {{
        name = 'playerId',
        help = 'Id Giocatore',
        type = 'player'
    }, {
        name = 'ped',
        help = 'ped',
        type = 'string'
    }}
})

GetPedSet = function(ped)
    if #Config.Peds > 0 then
        for k, v in pairs(Config.Peds) do
            if ped == v.name then
                return v.ped
            end
        end
    end
    for k, v in pairs(Peds) do
        if ped == v then
            return v
        end
    end
    return nil
end

AddEventHandler('esx:playerLoaded',function(source,xPlayer,isNew)
    if not isNew then
        if Config.DB == 'mysql-async' then
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier =@identifier',{
                ['@identifier'] = xPlayer.identifier
            },function(r)
                if r and type(r) == 'table' then
                    if r[1].ped ~= nil then
                        xPlayer.triggerEvent('fnx-setPed', r[1].ped)
                    end
                end
            end)
        elseif Config.DB == 'ghamttimysql' then
            exports['ghamttimysql']:execute('SELECT * FROM users WHERE identifier = @identifier',{
                ['@identifier'] = xPlayer.identifier
            },function(r)
                if r and type(r) == 'table' then
                    if r[1].ped ~= nil then
                        xPlayer.triggerEvent('fnx-setPed', r[1].ped)
                    end
                end
            end)
        end
    end
end)

exports('GetPedModel',function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and type(xPlayer) == 'table' then
        
    end
end)
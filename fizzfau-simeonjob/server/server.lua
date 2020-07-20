
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fizzfau-simeonjob:addMoney')
AddEventHandler('fizzfau-simeonjob:addMoney', function()
	local player = ESX.GetPlayerFromId(source)
	player.addMoney(Config.Reward)
end)

RegisterServerEvent('fizzfau-simeonjob:alertcops')
AddEventHandler('fizzfau-simeonjob:alertcops', function(cx, cy, cz)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == Config.Notify.job or xPlayer.job.name == Config.Notify.job2 and random < Config.Notify.chance then
			TriggerClientEvent('fizzfau-simeonjob:setcopblip', xPlayers[i], cx, cy, cz)

        end
    end
end)

-- ESX.RegisterServerCallback('fizzfau-simeonjob:limitcheck', function(cb)
--     local identifier = GetPlayerIdentifiers(source)[1]
--     MySQL.Async.fetchAll('SELECT simeon_limit FROM characters WERE identifier = @identifier', {
--         ['@identifier'] = identifier        
--     }, function(fizzfau)
--         limit = fizzfau[1].simeon_limit
--         if limit > 0 then
--             cb(true)
--             Update(source)
--         else
--             cb(false)
--         end
--     end)
-- end)

function Update(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    MySQL.Async.execute('UPDATE characters SET simeon_limit = simeon_limit - 1 WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })
end

function Reset()
    MySQL.Async.execute('UPDATE characters SET simeon_limit = @limit', {
        ['@limit'] = Config.Limit.max
    })
end


RegisterServerEvent('fizzfau-simeonjob:alertcopschat')
AddEventHandler('fizzfau-simeonjob:alertcopschat', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == Config.Notify.job or xPlayer.job.name == Config.Notify.job2 and random < Config.Notify.chance then
			TriggerClientEvent('chat:addMessage', xPlayer.source, { template = '<div class="chat-message server"><b>[Dispatch]</b> {0}</div>', args = { _U("police_notify")}})		
        end
    end
end)



RegisterServerEvent('fizzfau-simeonjob:removeblip')
AddEventHandler('fizzfau-simeonjob:removeblip', function()
	local player = ESX.GetPlayerFromId(source)
	TriggerClientEvent('fizzfau-simeonjob:removeblip', -1)
end)
local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("sayer-weedshop:bill:player")
AddEventHandler("sayer-weedshop:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'weedshop' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

----//////useables/////------

-- for k, v in pairs(Config.JointEffects) do --WIP
--     QBCore.Functions.CreateUseableItem(k, function(source, item) TriggerClientEvent('sayer-weedshop:UseJoint', source, item.name) end)
-- end

QBCore.Functions.CreateUseableItem("weed-grinder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-menu:GrindWeed", source, item.name)
end)

QBCore.Functions.CreateUseableItem("weed-gift-set", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerEvent("sayer-weedshop:server:addgiftboxitems", source, item.name)
    Player.Functions.RemoveItem('weed-gift-set', 1)
end)

QBCore.Functions.CreateUseableItem("dream-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:use-dream-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hazy-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:use-hazy-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("crush-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:use-crush-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bloomer-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:use-bloomer-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("weed-drink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:Can", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("weed-brownie", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("sayer-weedshop:Egobar", src, item.name)
    end
end)

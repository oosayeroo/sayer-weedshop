local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-weedshop:bill:player")
AddEventHandler("qb-weedshop:bill:player", function(playerId, amount)
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

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientjoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("streetweed")
    local meat = Ply.Functions.GetItemByName("rolling_paper")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientdream', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("dream-weed")
    local meat = Ply.Functions.GetItemByName("rolling_paper")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredienthazy', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("hazy-weed")
    local meat = Ply.Functions.GetItemByName("rolling_paper")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientcrush', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("crush-weed")
    local meat = Ply.Functions.GetItemByName("rolling_paper")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientbloomer', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("bloomer-weed")
    local meat = Ply.Functions.GetItemByName("rolling_paper")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientweed-drink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bun = Ply.Functions.GetItemByName("aluminumcan")
    local tomato = Ply.Functions.GetItemByName("drink-mix")
    local lettuce = Ply.Functions.GetItemByName("streetweed")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientgiftset', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("joint")
    local heartstopper = Ply.Functions.GetItemByName("gift-box")
    local dream = Ply.Functions.GetItemByName("dream-joint")
    local hazy = Ply.Functions.GetItemByName("hazy-joint")
    local crush = Ply.Functions.GetItemByName("crush-joint")
    local bloomer = Ply.Functions.GetItemByName("bloomer-joint")
    if fries ~= nil and heartstopper ~= nil and dream ~= nil and hazy ~= nil and crush ~= nil and bloomer ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ingredientweedbrownie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("brownie-mix")
    local heartstopper = Ply.Functions.GetItemByName("streetweed")
    if fries ~= nil and heartstopper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)




QBCore.Functions.CreateUseableItem("weed-grinder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-menu:GrindWeed", source, item.name)
end)

QBCore.Functions.CreateUseableItem("weed-gift-set", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-weedshop:giftset", source, item.name)
end)

QBCore.Functions.CreateUseableItem("dream-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:use-dream-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hazy-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:use-hazy-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("crush-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:use-crush-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bloomer-joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:use-bloomer-joint", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("weed-drink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:Can", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("weed-brownie", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-weedshop:Egobar", src, item.name)
    end
end)

----------DELIVERY STUFF----------------

RegisterNetEvent('qb-weedshop:server:DeliveryItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'chill-pills'
    local quantity = 1

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('qb-weedshop:server:WetWeedPickUp2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local wetcost = Config.WetWeedCost
    local item2 = 'wet_weed'
    local quantity = Config.WetWeedAmount

    Player.Functions.RemoveMoney('cash', wetcost)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('qb-weedshop:server:PickupWetWeed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item2 = 'wet_weed'
    local quantity = Config.WetWeedAmount

    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('qb-weedshop:server:KnockDoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'chill-pills'
    local item2 = 'customer-receipt'
    local quantity = 1

    Player.Functions.RemoveItem(item1, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

QBCore.Functions.CreateCallback('qb-weedshop:server:get:ReceiptChecker', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local wreceipt = Ply.Functions.GetItemByName("customer-receipt")
    if wreceipt ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-weedshop:server:ReceivePayment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('customer-receipt', 1)
    Player.Functions.AddMoney('bank', payment)
end)
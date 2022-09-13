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

RegisterNetEvent('qb-weedshop:server:addgiftboxitems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('joint', 1)
    Player.Functions.AddItem('dream-joint', 1)
    Player.Functions.AddItem('hazy-joint', 1)
    Player.Functions.AddItem('crush-joint', 1)
    Player.Functions.AddItem('bloomer-joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:addrandomgift1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('casinochips', 1)
end)

RegisterNetEvent('qb-weedshop:server:addrandomgift2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('lockpick', 1)
end)

RegisterNetEvent('qb-weedshop:server:addrandomgift3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('empty_weed_bag', 1)
end)

RegisterNetEvent('qb-weedshop:server:addrandomgift4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:addrandomgift5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('weed_nutrition', 1)
end)

RegisterNetEvent('qb-weedshop:server:creategiftbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('joint', 1)
    Player.Functions.RemoveItem('dream-joint', 1)
    Player.Functions.RemoveItem('hazy-joint', 1)
    Player.Functions.RemoveItem('crush-joint', 1)
    Player.Functions.RemoveItem('bloomer-joint', 1)
    Player.Functions.RemoveItem('gift-box', 1)
    Player.Functions.AddItem('weed-gift-set', 1)
end)

RegisterNetEvent('qb-weedshop:server:makingjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:makingdreamjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('dream-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('dream-joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:makinghazyjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('hazy-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('hazy-joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:makingcrushjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('crush-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('crush-joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:makingbloomerjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bloomer-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('bloomer-joint', 1)
end)

RegisterNetEvent('qb-weedshop:server:makingbrownie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('brownie-mix', 1)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.AddItem('weed-brownie', Config.BrownieMixAmount)
end)

RegisterNetEvent('qb-weedshop:server:makingweeddrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('drink-mix', 1)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.RemoveItem('aluminumcan', 1)
    Player.Functions.AddItem('weed-drink', Config.WeedDrinkAmount)
end)

RegisterNetEvent('qb-weedshop:server:grindstreet', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('weedbud', 1)
    Player.Functions.AddItem('streetweed', Config.GrindingAmount)
end)

RegisterNetEvent('qb-weedshop:server:grinddream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('dream-bud', 1)
    Player.Functions.AddItem('dream-weed', Config.GrindingAmount)
end)

RegisterNetEvent('qb-weedshop:server:grindhazy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('hazy-bud', 1)
    Player.Functions.AddItem('hazy-weed', Config.GrindingAmount)
end)

RegisterNetEvent('qb-weedshop:server:grindcrush', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('crush-bud', 1)
    Player.Functions.AddItem('crush-weed', Config.GrindingAmount)
end)

RegisterNetEvent('qb-weedshop:server:grindbloomer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bloomer-bud', 1)
    Player.Functions.AddItem('bloomer-weed', Config.GrindingAmount)
end)

RegisterNetEvent('qb-weedshop:server:drystreet', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('weedbud', Config.DryingAmount)
end)

RegisterNetEvent('qb-weedshop:server:drydream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('dream-bud', Config.DryingAmount)
end)

RegisterNetEvent('qb-weedshop:server:dryhazy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('hazy-bud', Config.DryingAmount)
end)

RegisterNetEvent('qb-weedshop:server:drycrush', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('crush-bud', Config.DryingAmount)
end)

RegisterNetEvent('qb-weedshop:server:drybloomer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('bloomer-bud', Config.DryingAmount)
end)


----//////useables/////------

QBCore.Functions.CreateUseableItem("weed-grinder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-menu:GrindWeed", source, item.name)
end)

QBCore.Functions.CreateUseableItem("weed-gift-set", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-weedshop:usegiftset", source, item.name)
    Player.Functions.RemoveItem('weed-gift-set', 1)
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

RegisterNetEvent('qb-weedshop:server:PickupWetWeed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item2 = 'wet_weed'
    local quantity = Config.WetWeedAmount

    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('qb-weedshop:server:pickupfinished', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('wet_weed', Config.WetWeedAmount)
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
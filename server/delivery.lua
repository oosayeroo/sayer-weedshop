local QBCore = exports['qb-core']:GetCoreObject()
local ReceiptItem = {["customer-receipt"]  =  Config.DeliveryPayment ,}
local delitem = ''
local wwamount = 0

----------DELIVERY STUFF----------------

RegisterNetEvent('sayer-weedshop:server:DeliveryItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount)
end)

RegisterNetEvent('sayer-weedshop:server:pickupordered', function(wwamount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = wwamount
    local price = Config.SingleWetWeedCost
    local result = amount*price

    if Config.PaySociety then
        local balance = exports['qb-management']:GetAccount(Config.SocietyName)
        print(balance)
        if balance >= result then
            exports['qb-management']:RemoveMoney(Config.SocietyName, result)
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have $"..result.." in your business account")
        end
    else
        local balance = Player.Functions.GetMoney('cash', result)
        if balance >= result then
            Player.Functions.RemoveMoney('cash', result)
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have $"..result.." in your pockets")
        end
    end
end)

RegisterNetEvent('sayer-weedshop:server:PickupFinished', function(wwamount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('wet_weed', wwamount)
    TriggerClientEvent('QBCore:Notify', src, "You Picked up "..wwamount.." Wet Weed")
end)

RegisterNetEvent('sayer-weedshop:server:KnockDoor', function(delitem)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item2 = 'customer-receipt'
    local quantity = 1

    Player.Functions.RemoveItem(delitem, 1)
    Player.Functions.AddItem(item2, quantity)
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ReceiptChecker', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local wreceipt = Ply.Functions.GetItemByName("customer-receipt")
    if wreceipt ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('sayer-weedshop:server:ReceivePayment', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(ReceiptItem)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ReceiptItem[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ReceiptItem[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

                    if Config.PaySociety then
                        exports['qb-management']:AddMoney(Config.SocietyName, price)
                        TriggerClientEvent('QBCore:Notify', src, "You filed all receipts for $"..price.." Cash is in Society Fund")
                    else
                        Player.Functions.AddMoney("cash", price)
                        TriggerClientEvent('QBCore:Notify', src, "You filed all receipts for $"..price)
                    end
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no Receipts..")
    end
end)

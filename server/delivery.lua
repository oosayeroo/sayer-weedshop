local QBCore = exports['qb-core']:GetCoreObject()
local ReceiptItem = {
    ["customer-receipt"]  =  Config.DeliveryPayment ,
}

----------DELIVERY STUFF----------------

RegisterNetEvent('qb-weedshop:server:DeliveryItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'chill-pill'
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
    local amount = Config.WetWeedAmount
    local price = Config.WedWeedCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem('wet_weed', amount)
end)

RegisterNetEvent('qb-weedshop:server:KnockDoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'chill-pill'
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
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(ReceiptItem)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ReceiptItem[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ReceiptItem[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

                    Player.Functions.AddMoney("cash", price)
                    TriggerClientEvent('QBCore:Notify', src, "You filed all receipts for $"..price)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no Moonshine..")
    end

end)
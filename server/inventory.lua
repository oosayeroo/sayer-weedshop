local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('sayer-weedshop:server:addgiftboxitems', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('joint', 1)
    Player.Functions.AddItem('dream-joint', 1)
    Player.Functions.AddItem('hazy-joint', 1)
    Player.Functions.AddItem('crush-joint', 1)
    Player.Functions.AddItem('bloomer-joint', 1)
    if Config.EnableRandomGift then
        local randchance = math.random(1,100)
        if randchance <= Config.RandomGiftChance then
            local RandomGift = Config.GiftBoxRewards[math.random(1, #Config.GiftBoxRewards)]
            Player.Functions.AddItem(RandomGift, Config.RandomGiftAmount)
            TriggerClientEvent('QBCore:Notify', source, 'You Recieved Items', 'success')
        else
            TriggerClientEvent('QBCore:Notify', source, 'Unlucky! No Extra Item', 'error')
        end
    end
end)

RegisterNetEvent('sayer-weedshop:RemoveItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('sayer-weedshop:server:creategiftbox', function()
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

RegisterNetEvent('sayer-weedshop:server:makingjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('joint', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makingbong', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('glass', 1)
    Player.Functions.RemoveItem('plastic', 1)
    Player.Functions.AddItem('bong', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makingdreamjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('dream-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('dream-joint', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makinghazyjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('hazy-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('hazy-joint', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makingcrushjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('crush-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('crush-joint', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makingbloomerjoint', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bloomer-weed', 1)
    Player.Functions.RemoveItem('rolling_paper', 1)
    Player.Functions.AddItem('bloomer-joint', 1)
end)

RegisterNetEvent('sayer-weedshop:server:makingbrownie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('brownie-mix', 1)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.AddItem('weed-brownie', Config.BrownieMixAmount)
end)

RegisterNetEvent('sayer-weedshop:server:makingweeddrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('drink-mix', 1)
    Player.Functions.RemoveItem('streetweed', 1)
    Player.Functions.RemoveItem('aluminumcan', 1)
    Player.Functions.AddItem('weed-drink', Config.WeedDrinkAmount)
end)

RegisterNetEvent('sayer-weedshop:server:GrindWeed', function(taken, given)
    local amount = Config.GrindingAmount
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(taken, 1)
    Player.Functions.AddItem(given, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], "add", amount)
end)

RegisterNetEvent('sayer-weedshop:server:DryWeed', function(itemtype)
    local item = itemtype
    local amount = Config.DryingAmount
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
end)
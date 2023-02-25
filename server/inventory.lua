local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('sayer-weedshop:server:addgiftboxitems', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('joint', 1)
    Player.Functions.AddItem('dream-joint', 1)
    Player.Functions.AddItem('hazy-joint', 1)
    Player.Functions.AddItem('crush-joint', 1)
    Player.Functions.AddItem('bloomer-joint', 1)
    local randchance = math.random(1,100)
    if randchance <= Config.RandomGiftChance then
        local RandomGift = Config.GiftBoxRewards[math.random(1, #Config.GiftBoxRewards)]
        Player.Functions.AddItem(RandomGift, Config.RandomGiftAmount)
        TriggerClientEvent('QBCore:Notify', source, 'You Recieved Items', 'success')
    else
        TriggerClientEvent('QBCore:Notify', source, 'Unlucky! No Extra Item', 'error')
    end
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

RegisterNetEvent('sayer-weedshop:server:grindstreet', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('weedbud', 1)
    Player.Functions.AddItem('streetweed', Config.GrindingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:grinddream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('dream-bud', 1)
    Player.Functions.AddItem('dream-weed', Config.GrindingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:grindhazy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('hazy-bud', 1)
    Player.Functions.AddItem('hazy-weed', Config.GrindingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:grindcrush', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('crush-bud', 1)
    Player.Functions.AddItem('crush-weed', Config.GrindingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:grindbloomer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('bloomer-bud', 1)
    Player.Functions.AddItem('bloomer-weed', Config.GrindingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:drystreet', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('weedbud', Config.DryingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:drydream', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('dream-bud', Config.DryingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:dryhazy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('hazy-bud', Config.DryingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:drycrush', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('crush-bud', Config.DryingAmount)
end)

RegisterNetEvent('sayer-weedshop:server:drybloomer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('wet_weed', 1)
    Player.Functions.AddItem('bloomer-bud', Config.DryingAmount)
end)

RegisterNetEvent('sayer-weedshop:GrinderBroke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('weed-grinder', 1)
end)

RegisterNetEvent('sayer-weedshop:InfusionBroke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('infusion-kit', 1)
end)
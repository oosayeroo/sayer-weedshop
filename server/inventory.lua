local QBCore = exports['qb-core']:GetCoreObject()

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

RegisterNetEvent('qb-weedshop:GrinderBroke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('weed-grinder', 1)
end)

RegisterNetEvent('qb-weedshop:InfusionBroke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('infusion-kit', 1)
end)
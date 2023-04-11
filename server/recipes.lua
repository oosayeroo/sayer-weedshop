local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientjoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    local paper = Ply.Functions.GetItemByName("rolling_paper")
    if streetweed ~= nil and paper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientbong', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local glass = Ply.Functions.GetItemByName("glass")
    local plastic = Ply.Functions.GetItemByName("plastic")
    if glass ~= nil and plastic ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientdream', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local dream = Ply.Functions.GetItemByName("dream-weed")
    local paper = Ply.Functions.GetItemByName("rolling_paper")
    if dream ~= nil and paper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredienthazy', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local hazy = Ply.Functions.GetItemByName("hazy-weed")
    local paper = Ply.Functions.GetItemByName("rolling_paper")
    if hazy ~= nil and paper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientcrush', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local crush = Ply.Functions.GetItemByName("crush-weed")
    local paper = Ply.Functions.GetItemByName("rolling_paper")
    if crush ~= nil and paper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientbloomer', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bloomer = Ply.Functions.GetItemByName("bloomer-weed")
    local paper = Ply.Functions.GetItemByName("rolling_paper")
    if bloomer ~= nil and paper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientweed-drink', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local can = Ply.Functions.GetItemByName("aluminumcan")
    local drinkmix = Ply.Functions.GetItemByName("drink-mix")
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    if can ~= nil and drinkmix ~= nil and streetweed ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientgiftset', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local joint = Ply.Functions.GetItemByName("joint")
    local gift = Ply.Functions.GetItemByName("gift-box")
    local dream = Ply.Functions.GetItemByName("dream-joint")
    local hazy = Ply.Functions.GetItemByName("hazy-joint")
    local crush = Ply.Functions.GetItemByName("crush-joint")
    local bloomer = Ply.Functions.GetItemByName("bloomer-joint")
    if joint ~= nil and gift ~= nil and dream ~= nil and hazy ~= nil and crush ~= nil and bloomer ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('sayer-weedshop:server:get:ingredientweedbrownie', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local brownie = Ply.Functions.GetItemByName("brownie-mix")
    local streetweed = Ply.Functions.GetItemByName("streetweed")
    if brownie ~= nil and streetweed ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
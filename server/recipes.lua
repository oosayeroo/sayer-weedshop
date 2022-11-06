local QBCore = exports['qb-core']:GetCoreObject()

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
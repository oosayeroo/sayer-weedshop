Config = {}

Config.DebugWeedPoly = false  --true for testing/false for live server

Config.MLO = 'blazeit'
-- 'legion' = https://www.gta5-mods.com/maps/mlo-legion-weed-clinic
-- 'blazeit' = https://fiv3devs.tebex.io/package/5046942
-- 'widow' = https://mosbaekdesign.com/vare/white-widow-cannabis-cafe-shop-mlo-v2-update/
Config.Phone = 'qb' --supports qb = qb-Phone/qs = quasar Phone/gk = GK Phone
Config.JimShops = false

Config.JobName = 'weedshop' --jobcode used in shared/jobs
Config.PaySociety = true --uses qb-management for everything related to money (delivery receipts, ordering wet weed.) does not work for Shop items as thats a seperate script(for now)
Config.SocietyName = 'weedshop' --society name in database of qb-management

Config.WeedGaragePedModel = "g_m_importexport_01"  --ped model
Config.WeedVehicles = { 
    --Label = how you see the name in menu
    --Model = spawncode of vehicle 
    --Livery = number that corresponds to the livery you want it to have. if vehicle has no livery then put 0
    {Label = "Paradise", Model = 'paradise', Livery = 1},
    {Label = "Burrito", Model = 'burrito', Livery = 2},
}
-- https://www.gtabase.com/grand-theft-auto-v/vehicles/#sort=attr.ct3.frontend_value&sortdir=desc
--in case you want to check vehicle liveries

Config.CraftingTime = 5 --in seconds (5 = 5 seconds)
--Breakable Equipment
Config.GrinderCanBreak = true --whether or not grinder can break after grinding
Config.GrinderBreakChance = 5 -- in % (5 = 5% chance of a break)
Config.InfusionCanBreak = true --whether or not infusion kit can break after drying something
Config.InfusionBreakChance = 5 --in % (5 = 5% chance of a break)

--Item Info
Config.RandomGiftChance = 5 -- in % chance of recieving an item from the gift sets. items configured below
Config.RandomGiftAmount = 1
Config.GiftBoxRewards = { --change these to whatever you want to use. 
    'lockpick',
    'weapon_pistol',
}
Config.BrownieMixAmount = 5 --amount of weed brownies to get from 1 mix
Config.WeedDrinkAmount = 5 --amount of weed drinks to get from 1 crafting
Config.GrindingAmount = 2 --amount of ground weed to get from grinding 1
Config.DryingAmount = 2 --amount of dried weed to get back when drying 1

--Delivery
Config.DeliveryWait = 10 --now in seconds
Config.DeliveryPayment = math.random(50, 100)
Config.SingleWetWeedCost = 1   -- amount you pay for a pickup of wet weed
Config.WetWeedLocation = { -- location to pick up wet weed with target when on a pickup
    vector3(3688.24, 4563.43, 25.18),
    vector3(808.72, -163.69, 75.88),
}   
Config.DeliveryItems = {
    'dream-joint',
    'hazy-joint',
    'crush-joint',
    'bloomer-joint',
}
Config.MaxDeliveries = 10 --maximum deliveries before having to return to shop and cash receipts
--delivery locations -- you can now have as many locations as you want
Config.DropOffPoints = {
    vector3(-297.74, 379.84, 112.1),
    vector3(119.37, 564.19, 183.96),
    vector3(808.72, -163.69, 75.88),
    vector3(1060.41, -378.3, 68.23),
    vector3(850.27, -532.63, 57.93),
    vector3(281.96, -1694.96, 29.65),
    vector3(39.02, -1911.58, 21.95),
    vector3(256.43, -2023.4, 19.27),
    vector3(512.51, -1790.77, 28.92),
    vector3(1193.52, -1622.37, 45.22)
}

Config.Items = {
label = "Weedshop",
    slots = 10,
    items = {
        [1]  =  {name = "lighter",        price = 10,amount = 50,info = {},type = "item",slot = 1,},
        [2]  =  {name = "empty_weed_bag", price = 3,amount = 50,info = {},type = "item",slot = 2,},
        [3]  =  {name = "rolling_paper",  price = 2,amount = 50,info = {},type = "item",slot = 3,},
        [4]  =  {name = "weed_nutrition", price = 40,amount = 50,info = {},type = "item",slot = 4,},
        [5]  =  {name = "gift-box",       price = 45,amount = 50,info = {},type = "item",slot = 5,},
        [6]  =  {name = "brownie-mix",    price = 8,amount = 50,info = {},type = "item",slot = 6,},
        [7]  =  {name = "aluminumcan",    price = 1,amount = 50,info = {},type = "item",slot = 7,},
        [8]  =  {name = "drink-mix",      price = 15,amount = 50,info = {},type = "item",slot = 8,},
        [9]  =  {name = "weed-grinder",   price = 30,amount = 20,info = {},type = "item",slot = 9,},
        [10] =  {name = "infusion-kit",   price = 50,amount = 50,info = {},type = "item",slot = 10,},
    }
}

--WIP (DO NOT USE)
-- Config.JointEffects = {
--     ["dream-joint"] = {
--         type = 'joint',
--         stressrelief = math.random(2,5),
--         screen = 'blue',
--         shake = true,
--     },
-- }

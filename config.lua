Config = {}

Config.DebugWeedPoly = false  --true for testing/false for live server

Config.WeedGaragePedLocation = vector4(372.18, -827.04, 29.29, 90.12) --ped location
Config.WeedGaragePedModel = "g_m_importexport_01"  --ped model
Config.SpawnWeedVehicle = vector4(368.15, -827.12, 29.29, 182.61) --location car spawns
Config.WeedVehicleModel = 'paradise'  --model of vehicle for easy swapping

Config.WSDrawText = "enabled"
Config.JobName = "weedshop"
Config.WeedshopLocations = {
    ["weedshop-duty"] = {
        [1] = vector3(375.97, -823.74, 29.3),
    },
    ["weed-tray1"] = {
        [1] = vector3(377.0, -827.34, 29.3),
    },
    ["weedshop-dryer"] = {
        [1] = vector3(380.44, -813.94, 29.3),
    },
    ["weedshop-grind"] = {
        [1] = vector3(382.31, -816.57, 29.3),
    },
    ["weedshop-menu"] = {
        [1] = vector3(375.32, -827.69, 29.3),
    },
    ["weedshop-storage"] = {
        [1] = vector3(382.54, -819.79, 29.3),
    },
    ["weedshop-craft"] = {
        [1] = vector3(374.54, -816.8, 29.3),
    },
    ["weedshop-register"] = {
        [1] = vector3(380.37, -826.66, 29.3),
    },
    ["weedshop-garage"] = {
        [1] = vector3(371.39, -826.98, 29.29),
    },
    ["wetbud-pickup"] = {
        [1] = vector3(3688.24, 4563.43, 25.18),
    },
}

Config.DeliveryWait = 10000
Config.DeliveryPayment = math.random(500, 700)
Config.WetWeedCost = math.random(1000, 1200)   -- amount you pay for a pickup of wet weed
Config.WetWeedAmount = math.random(100,150)   --amount of wet weed you get from a pickup
Config.WetWeedLocation = vector3(3688.24, 4563.43, 25.18)   -- location to pick up wet weed with target when on a pickup

----/////Item Amounts//////----
Config.BrownieMixAmount = 5 --amount of weed brownies to get from 1 mix
Config.WeedDrinkAmount = 5 --amount of weed drinks to get from 1 crafting
Config.GrindingAmount = 2 --amount of ground weed to get from grinding 1
Config.DryingAmount = 2 --amount of dried weed to get back when drying 1


--delivery locations
Config.DropOffPoint1 = vector3(-297.74, 379.84, 112.1)
Config.DropOffPoint2 = vector3(119.37, 564.19, 183.96)
Config.DropOffPoint3 = vector3(808.72, -163.69, 75.88)
Config.DropOffPoint4 = vector3(1060.41, -378.3, 68.23)
Config.DropOffPoint5 = vector3(850.27, -532.63, 57.93)
Config.DropOffPoint6 = vector3(281.96, -1694.96, 29.65)
Config.DropOffPoint7 = vector3(39.02, -1911.58, 21.95)
Config.DropOffPoint8 = vector3(256.43, -2023.4, 19.27)
Config.DropOffPoint9 = vector3(512.51, -1790.77, 28.92)
Config.DropOffPoint10 = vector3(1193.52, -1622.37, 45.22)

Config.Items = {
label = "weedshop",
    slots = 9,
    items = {
        [1] = {
            name = "lighter",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "empty_weed_bag",
            price = 3,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "rolling_paper",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weed_nutrition",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "gift-box",
            price = 45,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "brownie-mix",
            price = 8,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "aluminumcan",
            price = 1,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "drink-mix",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weed-grinder",
            price = 30,
            amount = 20,
            info = {},
            type = "item",
            slot = 9,
        },
    }
}


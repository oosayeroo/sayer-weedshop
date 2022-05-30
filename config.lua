Config = {}

Config.WeedGaragePedLocations = {
    {coords = vector4(372.18, -827.04, 29.29, 90.12)},
}

Config.DeliveryWait = 10000
Config.DeliveryPayment = math.random(500, 700)

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
    slots = 8,
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
    }
}

fx_version 'cerulean'
game 'gta5'

author 'DrB1ackBeard'   --rewritten by oosayeroo
description 'qb-burgershot for QBCore Created By DrB1ackBeard & Rewritten as qb-weedshop by oosayeroo'
version '3.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua',
	'client/deliveries.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

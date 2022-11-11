fx_version 'cerulean'
game 'gta5'

author 'oosayeroo'  
description 'qb-weedshop by oosayeroo'
version '3.3.1'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/garage.lua',
	'client/menus.lua',
	'client/deliveries.lua',
	'client/crafting.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

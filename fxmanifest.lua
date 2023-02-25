fx_version 'cerulean'
game 'gta5'

author 'oosayeroo'  
description 'sayer-weedshop by oosayeroo'
version '4.1.5'

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

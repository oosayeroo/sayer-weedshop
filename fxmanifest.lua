fx_version 'cerulean'
game 'gta5'

author 'oosayeroo'  
description 'sayer-weedshop by oosayeroo'
version '5.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/menus.lua',
	'client/deliveries.lua',
	'client/crafting.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

fx_version 'adamant'

game 'gta5'

author 'evann™'

-- RageUI V2

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}

----Client Side

client_scripts {
    "ClientSide/rdv.lua",
    "ClientSide/generplate.lua",
    "config.lua",

}

----Serveur Side

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'ServeurSide/server.lua',
    'config.lua',
}


ui_page 'nui/nui.html'

files {
    'nui/nui.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}

dependencies {
	'mysql-async'
}





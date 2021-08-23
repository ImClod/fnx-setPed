fx_version "cerulean"
game "gta5"
client_script "client/client.lua"

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "config.lua",
    "peds.lua",
    "server/server.lua"
}
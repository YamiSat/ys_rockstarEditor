name "ys_rockstarEditor"
author "YamiSat"
version "v1.0.0"
description "ys_rockstar By YamiSat"
fx_version "cerulean"
game "gta5"

shared_scripts { 
 '@ox_lib/init.lua',
  'config.lua',
 }
server_script { 
  'server.lua',
}
client_scripts { 
   'client.lua',
 }

 files {
  'locales/*.json',
}

 escrow_ignore {
  'config.lua',
}

lua54 'yes'

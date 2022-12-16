fx_version 'cerulean'
game 'gta5'

description 'qb-fakeplate'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts{
    'client/main.lua'
} 

lua54 'yes'

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'fizzfau presents'

client_scripts {
	'@es_extended/locale.lua',
	'client/client.lua',
    'config.lua',
    'locales/eng.lua',
    'locales/tr.lua'

}

server_scripts {
	'@es_extended/locale.lua',
    'server/server.lua',
    'locales/eng.lua',
    'locales/tr.lua',
    "config.lua"
}
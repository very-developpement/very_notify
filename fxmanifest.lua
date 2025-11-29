fx_version 'cerulean'
game 'gta5'

description 'Système de notification'
author 'Very Developpement'

ui_page 'html/index.html'

client_scripts {
    'client.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/sounds/success.ogg',
    'html/sounds/error.ogg',
    'html/sounds/info.ogg',
    'html/sounds/warning.ogg'
}

exports {
    'Notify'
}

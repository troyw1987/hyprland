local mocha = require("themes.mocha")

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 7,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border   = { colors = { mocha.mauve, mocha.base, mocha.mauve }, angle = 45 },
            inactive_border = { colors = { "rgb(24273A)", "rgb(24273A)", "rgb(24273A)" } },
        },
    },
})

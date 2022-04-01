return require('specs').setup{ 
    show_jumps  = true,
    min_jump = 8,
    popup = {
            delay_ms = 0,
            inc_ms = 10,
            blend = 100,
            width = 20,
            winhl = "PMenu",
            fader = require('specs').linear_fader,
            resizer = require('specs').slide_resizer 
    },
}
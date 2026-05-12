hl.config({
    input = {
        kb_layout  = "es",
        kb_variant = "winkeys",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
        },

        tablet = {
            output = "HDMI-A-1",
            region_size = {29376, 16524},
            region_position = {0, 0},
            active_area_size = {293.76, 165.24},
            transform = 0
        }
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
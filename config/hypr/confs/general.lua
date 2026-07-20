hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = {
				colors = {
					"rgba(666666ff)",
					"rgba(444444ff)",
					"rgba(666666ff)",
				},
				angle = 45,
			},
			inactive_border = "rgba(222222ff)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 32,
			render_power = 2,
			color = 0x881a1a1a,
			color_inactive = 0x66101010,
		},
		blur = {
			enabled = true,
			xray = false,
			size = 2,
			passes = 4,
			vibrancy = 0.170,
		},
	},
	animations = {
		enabled = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 20,
		border_size = 0,
		col = {
			active_border = {
				colors = {
					"rgba(ccccccff)",
					"rgba(aaaaaaff)",
					"rgba(ccccccff)",
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
		rounding = 8,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 18,
			render_power = 2,
			color = "rgba(101010bb)",
			color_inactive = "rgba(16161688)",
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

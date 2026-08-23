hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 4,
		border_size = 2,
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
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 32,
			render_power = 2,
			color = "rgba(1a1a1a88)",
			color_inactive = "rgba(10101066)",
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

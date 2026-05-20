hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 4,
		border_size = 2,
		col = {
			active_border = {
				colors = {
					"rgba(e6e6e6ff)",
					"rgba(888888ff)",
					"rgba(e6e6e6ff)",
				},
				angle = 45,
			},
			inactive_border = "rgba(444444ff)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 2,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 12,
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
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
		orientation = "left",
		new_on_top = true,
		drop_at_cursor = false,
	},
	scrolling = {
		fullscreen_on_one_column = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

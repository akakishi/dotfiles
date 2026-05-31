hl.config({
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
		column_width = 0.5,
		focus_fit_method = 0,
		follow_focus = true,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
		wrap_focus = true,
		wrap_swapcol = true,
		direction = "right",
	},
})

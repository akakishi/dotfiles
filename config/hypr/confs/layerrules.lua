hl.layer_rule({
	name = "kitty",
	match = {
		namespace = "kitty",
	},
	blur = true,
	ignore_alpha = 0.3,
})

hl.layer_rule({
	name = "rofi",
	match = {
		namespace = "rofi",
	},
	blur = true,
	ignore_alpha = 0.3,
})

hl.layer_rule({
	name = "swaync-control-center",
	match = {
		namespace = "swaync-control-center",
	},
	blur = true,
	ignore_alpha = 0.3,
	animation = "slide right",
})

hl.layer_rule({
	name = "swaync-notification-window",
	match = {
		namespace = "swaync-notification-window",
	},
	blur = true,
	ignore_alpha = 0.3,
	animation = "slide right",
})

hl.layer_rule({
	name = "waybar",
	match = {
		namespace = "topbar",
	},
	animation = "slide top",
})

hl.layer_rule({
	name = "hyprshutdown",
	match = {
		namespace = "hyprshutdown",
	},
	animation = "fade",
})

hl.window_rule({
	name = "clipse",
	match = {
		class = "(clipse)",
	},
	float = true,
	size = { 600, 650 },
	stay_focused = true,
})

hl.window_rule({
	name = "smile",
	match = {
		title = "(Smile)",
	},
	float = true,
	size = { 350, 450 },
	stay_focused = true,
})

hl.window_rule({
	name = "picture-in-picture",
	match = {
		title = "^(Picture-in-Picture)$",
	},
	float = true,
	pin = true,
	size = { 300, 200 },
	move = { 35, 35 },
})

hl.window_rule({
	name = "pavucontrol",
	match = {
		class = "^(pavucontrol)$",
	},
	float = true,
})

hl.window_rule({
	name = "proton-vpn",
	match = {
		class = "^(protonvpn-app)$",
	},
	float = true,
	size = { 400, 600 },
})

hl.window_rule({
	name = "steam-game",
	match = {
		class = "^(steam_app_.*)$",
	},
	workspace = 2,
})

hl.window_rule({
	name = "bonsai",
	enabled = false,
	match = {
		title = "^(cbonsai.*)$",
		class = "kitty",
	},
	float = true,
	size = { 500, 500 },
	rounding = 20,
	rounding_power = 2,
})

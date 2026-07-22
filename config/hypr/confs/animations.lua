-- Animation Configuration
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
--
-- stolen from luyu-wu: https://github.com/luyu-wu/Config/blob/Laptop/hypr/animations.lua

hl.config({ animations = { enabled = true } })

-- Bezier curves
hl.curve("md3_decel", { type = "bezier", points = { { 0, 0.75 }, { 0.25, 1 } } })
--hl.curve("md3_accel", { type = "bezier", points = { { 0.75, 0 }, { 1, 0.25 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.50, 1.35 }, { 1, 0.75 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("ease", { type = "bezier", points = { { 0.25, 0.25 }, { 0.5, 1.00 } } })
hl.curve("big_small", { type = "bezier", points = { { 0, 0 }, { 0.45, 1.50 } } })

-- Spring Curves
hl.curve("spring_menu", { type = "spring", mass = 1, stiffness = 280, dampening = 25 })
hl.curve("spring_window", { type = "spring", mass = 1, stiffness = 280, dampening = 20 })
hl.curve("spring_open", { type = "spring", mass = 1, stiffness = 280, dampening = 25 })
hl.curve("spring_workspace", { type = "spring", mass = 1.2, stiffness = 280, dampening = 30 })
hl.curve("spring_move", { type = "spring", mass = 1, stiffness = 280, dampening = 25 })
hl.curve("spring_special", { type = "spring", mass = 1, stiffness = 280, dampening = 20 })

-- Window animations
hl.animation({ leaf = "windows", enabled = true, speed = 0.5, spring = "spring_window" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, bezier = "ease", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "ease", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 0.5, spring = "spring_move", style = "popin 80%" })

-- Border animations (disabled)
hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "borderangle", enabled = false })

-- Fade
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "ease" })

-- Zoom cursor
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "ease" })

-- Layer animations
hl.animation({ leaf = "layersIn", enabled = true, speed = 1, bezier = "ease", style = "popin 80%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "ease", style = "popin 80%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, bezier = "ease" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1, bezier = "ease" })

-- Workspace animations
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 2,
	bezier = "ease",
	style = "slide",
})

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 2,
	bezier = "ease",
	style = "slidefadevert 40%",
})

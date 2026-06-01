---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "nemo"
local menu = "~/.config/rofi/bin/launcher.sh"
local powerMenu = "~/.config/rofi/bin/powermenu.sh"
local notifications = "swaync-client -t -sw"
local lock = "hyprlock --grace 2"
local printScreen = "~/.config/grim/save-copy-notify.sh"
local clipboard = "kitty --class clipse -e clipse"

local layouts = { "scrolling", "dwindle", "master", "monocle" }

hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd(powerMenu))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + H", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(notifications))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(printScreen))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + period", function()
	local workspace = hl.get_active_workspace()
	if workspace ~= nil and workspace.tiled_layout == "scrolling" then
		hl.dispatch(hl.dsp.layout("swapcol r"))
	elseif workspace ~= nil and workspace.tiled_layout == "monocle" then
		hl.dispatch(hl.dsp.layout("cyclenext"))
	end
end)
hl.bind(mainMod .. " + comma", function()
	local workspace = hl.get_active_workspace()
	if workspace ~= nil and workspace.tiled_layout == "scrolling" then
		hl.dispatch(hl.dsp.layout("swapcol l"))
	elseif workspace ~= nil and workspace.tiled_layout == "monocle" then
		hl.dispatch(hl.dsp.layout("cycleprev"))
	end
end)

hl.bind(mainMod .. " + SHIFT + period", function()
	local workspace = hl.get_active_workspace()
	if workspace ~= nil and workspace.tiled_layout == "scrolling" then
		hl.dispatch(hl.dsp.layout("colresize +0.1"))
	end
end)

hl.bind(mainMod .. " + SHIFT + comma", function()
	local workspace = hl.get_active_workspace()
	if workspace ~= nil and workspace.tiled_layout == "scrolling" then
		hl.dispatch(hl.dsp.layout("colresize -0.1"))
	end
end)

local closeWindowBind = hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + Minus", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Minus", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Game Mode
hl.bind("SUPER + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)
	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end

	hl.config({
		general = {
			gaps_in = 0,
			gaps_out = 0,
			border_size = 0,
		},
		animations = {
			enabled = false,
		},
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			rounding = 0,
		},
	})
end)

-- Cycle Layouts
hl.bind("SUPER + tab", function()
	local workspace = hl.get_active_workspace()
	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	hl.workspace_rule({ workspace = workspace.name, layout = next_layout })
	local notify_cmd = "notify-send -t 1500 -e 'Layout change' 'Workspace: "
		.. workspace.name
		.. " Layout: "
		.. next_layout

	hl.dispatch(hl.dsp.exec_cmd(notify_cmd))
	hl.notification.create({
		text = "Workspace: " .. workspace.name .. ". \nLayout: " .. next_layout,
		duration = 1500,
	})
end)

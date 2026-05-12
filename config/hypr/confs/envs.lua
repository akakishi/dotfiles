local cursorTheme = "Simp1e-Dark"
local cursorSize = 24

hl.env("XCURSOR_SIZE", cursorSize)
hl.env("XCURSOR_THEME", cursorTheme)
hl.env("HYPRCURSOR_SIZE", cursorSize)
hl.env("HYPRCURSOR_THEME", cursorTheme)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")
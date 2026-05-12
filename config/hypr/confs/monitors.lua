local f = io.popen("hostname")
if f ~= nil then
    local hostname = f:read("*a") or ""
    f:close()

    local desktopSuffix = "-dt"
    local laptopSuffix = "-lt"

    if hostname:match(laptopSuffix .. "$") then
        hl.monitor({
            output   = "eDP-1",
            mode     = "preferred",
            position = "auto",
            scale    = "1"
        })
    end

    if hostname:match(desktopSuffix .. "$") then
        hl.monitor({
            output   = "HDMI-A-1",
            mode     = "1920x1080",
            position = "0x0",
            scale    = "1"
        })

        hl.monitor({
            output   = "DP-1",
            mode     = "1920x1080",
            position = "1920x0",
            scale    = "1"
        })

        hl.monitor({
            output   = "DP-2",
            mode     = "1920x1080@75",
            position = "3840x0",
            scale    = "1"
        })

        hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
    end

end


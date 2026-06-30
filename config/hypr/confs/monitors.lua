local f = io.popen("hostname")
if f ~= nil then
	local hostname = f:read("*a") or ""
	f:close()

	local desktopSuffix = "-dt"
	local laptopSuffix = "-lt"

	if string.match(hostname, laptopSuffix) then
		hl.notification.create({
			text = "Laptop Config",
			duration = 1500,
		})

		hl.monitor({
			output = "eDP-1",
			mode = "preferred",
			position = "auto",
			scale = 1,
		})
	elseif string.match(hostname, desktopSuffix) then
		hl.notification.create({
			text = "Desktop Config",
			duration = 1500,
		})

		hl.monitor({
			output = "HDMI-A-1",
			mode = "1920x1080",
			position = "0x0",
			scale = 1,
		})

		hl.monitor({
			output = "DP-1",
			mode = "1920x1080",
			position = "3000x0",
			scale = 1,
		})

		hl.monitor({
			output = "DP-2",
			mode = "1920x1080@75",
			position = "1920x-420",
			transform = 1,
			scale = 1,
		})

		hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
	end
end

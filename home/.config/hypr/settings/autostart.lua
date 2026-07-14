-- Floating Reminder window rule
hl.window_rule({
	name = "floating-reminder",
	match = { class = "^(floating-reminder)$" },
	float = true,
	size = { 1000, 1000 },
})

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprctl setcursor macOS 24")
	hl.exec_cmd("hyprctl hyprpaper wallpaper 'eDP-1, ~/.config/hypr/wallpapers/Sigillum_Dei.png, cover'")
	hl.exec_cmd("~/.config/hypr/scripts/open_reminders")
end)

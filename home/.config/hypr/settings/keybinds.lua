local mainMod = "SUPER"

-- APP BINDS:
hl.bind(mainMod .. " + " .. "RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + " .. "C", hl.dsp.window.close())
hl.bind(mainMod .. " + " .. "ESCAPE", hl.dsp.exit())
hl.bind(mainMod .. " + " .. "V", hl.dsp.window.float())
-- bindr = triggers on key RELEASE, not on repeat
hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("rofi -show drun"), { release = true })

-- HYPR BINDS:
hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + " .. "P", hl.dsp.window.pseudo()) -- dwindle

hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
-- NOTE: original config's SUPER+SHIFT+0 sent the window to workspace 1 (not 10) - preserved as-is
hl.bind(mainMod .. " + SHIFT + " .. 0, hl.dsp.window.move({ workspace = 1 }))

hl.bind(mainMod .. " + " .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + " .. "S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- MY KEYBINDS:
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot"))

hl.bind(mainMod .. " + " .. "w", hl.dsp.exec_cmd("~/.config/hypr/scripts/pick_wallpaper"))
hl.bind(mainMod .. " + " .. "i", hl.dsp.exec_cmd("~/.config/hypr/scripts/hypridle_toggle"))

hl.bind(mainMod .. " + " .. "b", hl.dsp.exec_cmd("hyprshade toggle box_blur"))
hl.bind(mainMod .. " + " .. "n", hl.dsp.exec_cmd("hyprshade toggle pixelate"))

hl.bind("XF86Favorites", hl.dsp.exec_cmd("swaync-client -op")) -- f12

-- binde = repeats while held
hl.bind("XF86Keyboard", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/keyboard-backlight_keybind"), { repeating = true }) -- f11

hl.bind("XF86Tools", hl.dsp.exec_cmd("kitty nvim ~/.config")) -- F9
hl.bind("XF86Display", hl.dsp.exec_cmd("nwg-displays")) -- F7

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true }) -- f6
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true }) -- f5

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t")) -- F4

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer --allow-boost -i 5"), { repeating = true }) -- F3
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --allow-boost -d 5"), { repeating = true }) -- F2

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t")) -- F1

-- Ctrl keys:
hl.bind("Control_L + Left", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("Control_L + Right", hl.dsp.exec_cmd("playerctl next"))
hl.bind("Control_L + Up", hl.dsp.exec_cmd("playerctl play"))
hl.bind("Control_L + Down", hl.dsp.exec_cmd("playerctl pause"))

hl.bind("SUPER + T", hl.dsp.exec_cmd("killall -SIGUSR1 waybar")) -- Waybar toggle

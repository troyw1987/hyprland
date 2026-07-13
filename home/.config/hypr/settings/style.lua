-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
hl.config({
	decoration = {
		rounding = 10,
		blur = {
			enabled = false,
			size = 2,
			passes = 1,
		},
		inactive_opacity = 0.9,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		touchpad = {
			natural_scroll = false,
			disable_while_typing = false,
		},
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- you probably want this
	},
})

hl.config({
	animations = {
		enabled = true,
	},
})

hl.config({
	misc = {
		disable_hyprland_logo = true,
	},
})

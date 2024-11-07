local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", -- disable the title bar but enable the resize border
	default_cursor_style = "SteadyBar",
	color_scheme = "rose-pine",
	font = wezterm.font("InconsolataGo Nerd Font Mono", { weight = "Bold" }),
	font_size = 16,
	background = {
		{
			source = {
				File = "/Users/erichanley/Pictures/elden_ring 2.jpeg",
			},
			hsb = {
				hue = 1.0,
				saturation = 1.02,
				brightness = 0.25,
			},
			width = "100%",
			height = "100%",
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.55,
		},
	},
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
}

return config

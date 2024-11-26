local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = {}

config.color_scheme = "Catppuccin Macchiato"

config.window_padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
config.enable_tab_bar = true

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "n", mods = "SHIFT|CTRL", action = wezterm.action.ToggleFullScreen },
	-- Split controls using leader
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
}

config.unix_domains = {
	{
		name = "master",
	},
}

config.enable_wayland = false -- This fixes fullscreen bug where bottom of screen is not covered
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.9

smart_splits.apply_to_config(config, {
	-- 	direction_keys = { "h", "j", "k", "l" },
	direction_keys = {
		move = { "h", "j", "k", "l" },
		resize = { "LeftArrow", "DownArrow", "UpArrow", "RightArrow" },
	},
	modifiers = {
		move = "CTRL",
		resize = "META",
	},
})

return config

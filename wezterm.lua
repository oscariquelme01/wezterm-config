-- Vesper theme for WezTerm
-- Source: https://github.com/raunofreiberg/vesper

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font_with_fallback({
	{
		family = "GeistMono Nerd Font",
		weight = "Regular",
		style = "Normal",
	},
})
config.font_size = 14.0

-- Explicit font variants (bold, italic, bold italic)
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "GeistMono Nerd Font",
			weight = "Bold",
			style = "Normal",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "GeistMono Nerd Font",
			weight = "Regular",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "GeistMono Nerd Font",
			weight = "Bold",
			style = "Italic",
		}),
	},
}

-- Colors
config.color_scheme = "Vesper"

-- Helpers
local function add_keys(keys)
	for _, k in ipairs(keys) do
		table.insert(config.keys, k)
	end
end

-- Plugins
require("plugins.bar")

-- Key bindings
config.keys = {
	-- Cmd+V to split vertically
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- CMD+X to split horizontally (I know, names are backward)
	{
		key = "x",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "s",
		mods = "CMD",
		action = wezterm.action.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{
		key = "S", -- Cmd+Shift+S
		mods = "CMD|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},
}

add_keys(require("plugins.resurrect"))

-- Window
-- Closest equivalent to Alacritty's "Buttonless" (macOS): hide title bar but
-- keep window resizable. On other platforms this just removes decorations.
config.window_decorations = "RESIZE"

return config

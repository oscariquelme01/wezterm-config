local wezterm = require("wezterm")

local M = {}

function M.apply(config)
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
			key = "w",
			mods = "CMD",
			action = wezterm.action.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		{
			key = "w",
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
end

return M

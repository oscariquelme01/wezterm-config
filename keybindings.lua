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
		-- CMD h,j,k,l to navigate panes
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
		-- CMD + w to fuzzy search workspaces
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		-- CMD + SHIFT + w to create a new workspace
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
		{
			key = "t",
			mods = "CMD|ALT",
			action = wezterm.action.PromptInputLine({
				description = "Enter new tab name",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		-- Press Ctrl+Shift+Alt+W to rename the current workspace
		{
			key = "w",
			mods = "CMD|ALT",
			action = wezterm.action.PromptInputLine({
				description = "Enter new workspace name",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
		{
			key = "p",
			mods = "CMD",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	}
end

return M

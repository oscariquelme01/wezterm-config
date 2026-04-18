local wezterm = require("wezterm")

local M = {}

function M.apply(config)
	local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
	bar.apply_to_config(config, {
		max_width = 32,
		padding = {
			left = 2,
			right = 2,
		},
		separator = {
			space = 1,
			left_icon = wezterm.nerdfonts.fa_long_arrow_right,
			right_icon = wezterm.nerdfonts.fa_long_arrow_left,
			field_icon = wezterm.nerdfonts.indent_line,
		},
		modules = {
			tabs = {
				active_tab_fg = 4, -- index into ansi/brights palette
				inactive_tab_fg = 6,
			},
			workspace = {
				enabled = true,
				icon = wezterm.nerdfonts.cod_window,
				color = 8,
			},
			leader = {
				enabled = true,
				icon = wezterm.nerdfonts.oct_rocket,
				color = 2,
			},
			pane = {
				enabled = true,
				icon = wezterm.nerdfonts.cod_multiple_windows,
				color = 7,
			},
			username = {
				enabled = false,
			},
			hostname = {
				enabled = false,
			},
			clock = {
				enabled = true,
				icon = wezterm.nerdfonts.md_calendar_clock,
				color = 5,
			},
			cwd = {
				enabled = false,
			},
		},
	})
end

return M

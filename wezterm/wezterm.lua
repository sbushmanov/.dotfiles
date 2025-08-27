local wezterm = require("wezterm")
local act = wezterm.action

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

wezterm.on("gui-attached", function(domain)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.5
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

local config = wezterm.config_builder()

-- theme and colors
config.color_scheme = "Catppuccin Macchiato"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

--top bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- fonts
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- config.font = wezterm.font('FiraMono Nerd Font')
-- config.font = wezterm.font('Monaspace Radon')
config.font_size = 12
config.adjust_window_size_when_changing_font_size = true

-- keys
-- config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	-- 	{ key = "'", mods = "CTRL", action = act.ClearScrollback("ScrollbackAndViewport") },
	-- 	{ key = "0", mods = "LEADER", action = act.ShowLauncher },
	-- 	{ key = "o", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-opacity") },
	{ key = "q", mods = "CTRL", action = wezterm.action.QuitApplication },
}

config.window_close_confirmation = "NeverPrompt"

-- mouth
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- run fish interactive as default prog
config.default_prog = {
	"/usr/bin/fish",
	"-l",
}

-- hack to always have only 1 tab whatsoever
config.prefer_to_spawn_tabs = true
config.enable_tab_bar = false

-- cli escape sequence artifacts
-- config.term = "tmux-256color"
config.term = "xterm-256color"
-- config.term = "wezterm"
--
local function is_shell(foreground_process_name)
	local shell_names = { "bash", "zsh", "sh", "ksh", "dash", "wezterm", "fish" }
	local process = string.match(foreground_process_name, "[^/\\]+$") or foreground_process_name
	for _, shell in ipairs(shell_names) do
		if process == shell then
			return true
		end
	end
	return false
end

wezterm.on("open-uri", function(window, pane, uri)
	wezterm.log_info(window)
	wezterm.log_info(pane)
	wezterm.log_info(uri)
	local editor = "nvim"

	if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
		-- We're processing an hyperlink and the uri format should be: file://[HOSTNAME]/PATH[#linenr]
		-- Also the pane is not in an alternate screen (an editor, less, etc)
		local url = wezterm.url.parse(uri)
		if is_shell(pane:get_foreground_process_name()) then
			-- A shell has been detected. Wezterm can check the file type directly
			-- figure out what kind of file we're dealing with
			local success, stdout, _ = wezterm.run_child_process({
				"file",
				"--brief",
				"--mime-type",
				url.file_path,
			})
			if success then
				if stdout:find("directory") then
					pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
					pane:send_text(wezterm.shell_join_args({
						"lsd",
						"-a",
						"--hyperlink",
						"always",
						"--group-directories-first",
					}) .. "\r")
					return false
				end

				if stdout:find("text") then
					if url.fragment then
						pane:send_text(wezterm.shell_join_args({
							editor,
							"+" .. url.fragment,
							url.file_path,
						}) .. "\r")
					else
						pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
					end
					return false
				end
			end
		else
			pane:send_text("echo 'Hello from WezTerm!'\r")

			-- No shell detected, we're probably connected with SSH, use fallback command
			--
			--
			local edit_cmd = url.fragment and editor .. " +" .. url.fragment .. ' "$_f"' or editor .. ' "$_f"'
			local cmd = 'set _f "'
				.. url.file_path
				.. '"; if test -d "$_f"; cd "$_f"; and lsd -a --hyperlink always --group-directories-first; else; '
				.. 'set filetype (file --brief --mime-type "$_f" | cut -d/ -f1); and test "$filetype" = "text"; and '
				.. edit_cmd
				.. "; end; echo"
			pane:send_text(cmd .. "\r")
			---
			---
			return false
		end
	end

	-- without a return value, we allow default actions
end)
config.debug_key_events = true
return config

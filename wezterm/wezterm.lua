local wezterm = require 'wezterm'
local act = wezterm.action

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on('gui-attached', function(domain)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)


wezterm.on('toggle-opacity', function(window, pane)
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
config.color_scheme = 'Catppuccin Macchiato'
config.window_decorations = 'RESIZE'
config.window_background_opacity = .8
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7
}

--top bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- fonts
config.font = wezterm.font('JetBrains Mono')
-- config.font = wezterm.font('Monaspace Radon')
config.font_size = 12
config.adjust_window_size_when_changing_font_size = true


-- keys
config.leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  { key = '\'', mods = 'CTRL',   action = act.ClearScrollback 'ScrollbackAndViewport', },
  { key = 'h',  mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'v',  mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '0',  mods = 'LEADER', action = act.ShowLauncher },
  { key = 'o',  mods = 'LEADER', action = wezterm.action.EmitEvent 'toggle-opacity', },
  { key = 'q',  mods = 'CTRL',   action = wezterm.action.QuitApplication },
}

config.window_close_confirmation = "NeverPrompt"


-- mouth
config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}


-- run fish interactive as default prog
config.default_prog = {
  '/usr/bin/fish',
  '-l',
}

-- hack to always have only 1 tab whatsoever
config.prefer_to_spawn_tabs = true
config.enable_tab_bar = false

-- done building config!
return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- my coolnight colorscheme
config.color_scheme = "catppuccin-mocha"
--config.colors = {
--    foreground = "#CBE0F0",
--    background = "#011423",
--    cursor_bg = "#47FF9C",
--    cursor_border = "#47FF9C",
--    cursor_fg = "#011423",
--    selection_bg = "#033259",
--    selection_fg = "#CBE0F0",
--    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
--    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
--}

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

-- https://wezterm.org/config/keys.html#configuring-key-assignments
-- https://wezterm.org/config/lua/keyassignment/index.html
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'LeftArrow',
    mods = 'SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'RightArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'LeftArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'UpArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'DownArrow',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  { mods='', key="Home", action=wezterm.action{SendString="\001"} },
  { mods='', key="End", action=wezterm.action{SendString="\005"} },
}

-- config.debug_key_events = true

-- https://github.com/wez/wezterm/issues/3299#issuecomment-2145712082
wezterm.on("gui-startup", function(cmd)
  local active = wezterm.gui.screens().active
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:guiwindow():setposition(active.x, active.y)
  window:guiwindow():set_innersize(active.width, active.height)
end)

return config

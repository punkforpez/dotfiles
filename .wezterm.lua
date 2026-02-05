-- Add Wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tab bar
enable_tab_bar = false

-- For example, changing the initial geometry for new windows:
-- Disable for Linux tiling window managers
--config.initial_cols = 80
--config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font_size = 12
config.line_height = 1.1
--config.font = wezterm.font 'Noto Sans Mono'
config.font = wezterm.font 'JetBrains Mono'
-- config.color_scheme = 'nord'
--config.color_scheme = "Everblush"
config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Gruvbox dark, medium (base16)'
config.window_close_confirmation = 'NeverPrompt'

-- Tab Bar customization
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 50

-- Command Palette
config.keys = {
  {
    key = 'p',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
}
config.window_padding = {
  left = 12,
  right = 12,
  top = 2,
  bottom = 2,
}
config.command_palette_font_size = 14

config.max_fps = 144
config.front_end = "OpenGL"

-- Finally, return the configuration to wezterm:
return config

-- Add Wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Tab bar
enable_tab_bar = false

-- For example, changing the initial geometry for new windows:
config.initial_cols = 80
config.initial_rows = 30

-- or, changing the font size and color scheme.
config.font_size = 15
config.font = wezterm.font 'Hack'
config.color_scheme = 'Gruvbox dark, medium (base16)'

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
config.command_palette_font_size = 16


-- Finally, return the configuration to wezterm:
return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 13
config.color_scheme = 'Gruvbox dark, soft (base16)'
config.use_fancy_tab_bar = false
return config


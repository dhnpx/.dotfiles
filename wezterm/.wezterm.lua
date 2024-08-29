local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Fira Code Nerd Font")
--config.font = wezterm.font("Caskaydia Cove Nerd Font")
--config.font = wezterm.font("SauceCodePro Nerd Font")
--config.font = wezterm.font("MesloLGS Nerd Font")
config.color_scheme = "Wez"
config.window_background_opacity = 0.7
config.xcursor_theme = "phinger-cursors-light"
config.enable_wayland = false
config.enable_tab_bar = false

config.audible_bell = "Disabled"

return config

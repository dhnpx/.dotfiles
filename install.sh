#!/bin/sh

mode=$1

rm -rf ~/.config/nvim
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.wezterm.lua

if [ "$mode" = "laptop" ]; then
    ln -sf ~/.dotfiles/hypr/laptop ~/.config/hypr
    ln -sf ~/.dotfiles/hypr/hyprpaper.conf ~/.config/hypr/
else
    ln -sf ~/.dotfiles/hypr ~/.config/hypr
fi


ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/waybar ~/.config/waybar
ln -sf ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua


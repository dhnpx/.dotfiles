#!/bin/sh

rm -rf ~/.config/nvim
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar

ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/hypr ~/.config/hypr
ln -sf ~/.dotfiles/waybar ~/.config/waybar


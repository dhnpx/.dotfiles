#!/bin/sh

mode=$1

rm -rf ~/.config/nvim
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/foot
rm -rf ~/.wezterm.lua
rm -rf ~/.zshrc
rm -rf ~/.spaceshiprc.zsh
rm -rf ~/.config/yazi
rm -rf ~/.config/ghostty
rm -rf ~/.config/wozi

if [ "$mode" = "laptop" ]; then
    ln -sf ~/.dotfiles/hypr/laptop ~/.config/hypr
else
    ln -sf ~/.dotfiles/hypr ~/.config/hypr
fi

ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/waybar ~/.config/waybar
ln -sf ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
ln -sf ~/.dotfiles/foot ~/.config/foot
#ln -sf ~/.dotfiles/Yubico/u2f_keys ~/.config/Yubico/u2f_keys
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
#ln -sf ~/.dotfiles/p10k/.p10k.zsh ~/.p10k.zsh 
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/tmux/tmux_sessionzier ~/bin/tmux_sessionzier
#ln -sf ~/.dotfiles/.spaceshiprc.zsh ~/.spaceshiprc.zsh
ln -sf ~/.dotfiles/yazi ~/.config/yazi
ln -sf ~/.dotfiles/ghostty ~/.config/ghostty
ln -sf ~/.dotfiles/wofi ~/.config/wofi

sudo cp -r ./fonts/MapleMonoNL-NF-unhinted/ /usr/share/fonts/

chmod +x ./network_manager/09-timezone
sudo cp ./network_manager/09-timezone /etc/NetworkManager/dispatcher.d/
sudo chown root /etc/Networkmanager/dispatcher.d/09-timezone

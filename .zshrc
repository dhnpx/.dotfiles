export PATH=$PATH:~/apps/
export ZSH="$HOME/.oh-my-zsh/"

source $ZSH/oh-my-zsh.sh
# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hyoon/.zshrc'
zstyle ':completion::complete:*' use-cache 1

autoload -U compinit
compinit

unsetopt BEEP

setopt correctall
setopt hist_ignore_all_dups
setopt hist_ignore_space

autoload -U promptinit
promptinit
prompt gentoo

ZSH_THEME="robbyrussell"

alias ls="ls --color"



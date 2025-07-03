# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ $TERM != linux ]] then; 
  source ~/.antidote/antidote.zsh
  # ${ZDOTDIR:-~}/.zshrc

  # Set the root name of the plugins files (.txt and .zsh) antidote will use.
  zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

  # Ensure the .zsh_plugins.txt file exists so you can add plugins.
  [[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

  # Lazy-load antidote from its functions directory.
  fpath=(/path/to/antidote/functions $fpath)
  autoload -Uz antidote

  # Generate a new static file whenever .zsh_plugins.txt is updated.
  if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
    antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
  fi

  # Source your static plugins file.
  source ${zsh_plugins}.zsh
fi

if [[ $TERM == linux ]] then;
  autoload promptinit compinit
  compinit
  promptinit 
  prompt gentoo
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000


unsetopt BEEP
setopt correctall
setopt hist_ignore_all_dups
setopt hist_ignore_space

for d in ~/bin/*; do PATH="$PATH:$d"; done
export PATH=$PATH:~/apps/:~/bin/
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export MOZ_ENABLE_WAYLAND=1
export EDITOR=/bin/nvim

#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -lA'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color-auto'
alias ip='ip --color=auto'


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# fnm
FNM_PATH="/home/hyoon/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/hyoon/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

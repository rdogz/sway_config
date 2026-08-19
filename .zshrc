# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit stuff
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k


##############################################################################

# nvm (for Node.js)
#source /usr/share/nvm/init-nvm.sh

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-foward


# load ocmpletions
autoload -U compinit && compinit

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# alias
alias ls='ls --color'
alias la='ls -A'
alias l='ls -CF'
alias h='history'
alias id='identify'
alias vim='nvim'
alias gl='git log --all --graph --decorate'
alias tkill='tmux kill-server'
alias u='sudo pacman -Syu' 
alias summon='sudo pacman -S' 
alias banish='sudo pacman -Rns' 
alias open='xdg-open'
alias edit='inkscape'
alias off='systemctl poweroff'
alias bgm='mpv ~/.music/tokyo-music-walker-after-the-rain.mp3 --loop=inf --volume=30'
alias nvm='source /usr/share/nvm/init-nvm.sh'

# editor
export EDITOR='vim'

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/melinoe/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/two_b/.spicetify

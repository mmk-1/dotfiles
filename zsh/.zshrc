#!/bin/sh 
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History file
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history/.zsh_history
setopt appendhistory

bindkey "^R" history-incremental-search-backward
# Basic tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# source
plug "$HOME/.config/zsh/aliases.zsh"

# Plugins!
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "romkatv/powerlevel10k"

# I don't actually know what this does
# export PATH="$HOME/.local/bin":$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh



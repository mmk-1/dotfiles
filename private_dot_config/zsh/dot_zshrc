# Zap plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# History
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/.zsh_history
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt appendhistory

bindkey "^R" history-incremental-search-backward

# Basic tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
plug "jeffreytse/zsh-vi-mode"

alias ls='ls --color'

# Starship
eval "$(starship init zsh)"

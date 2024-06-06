# instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# causes issues with duplicate terminal output
# export TERM=screen-256color

# latex texlive
export PATH="$HOME/apps/texlive/2024/bin/x86_64-linux:$PATH"

# rust cargo
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/usr/bin:$PATH"

# add custom shell utility scripts directory
export PATH="$HOME/.config/zsh/scripts:$PATH"

ZSH_CUSTOM="$HOME/.config/zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# make GTK apps dark
export GTK_THEME=Adwaita:dark

fpath+="$HOME/.config/zsh/plugins/zsh-completions/src"

#
# plugins
#

source ~/.config/zsh/plugins/auto-notify/auto-notify.plugin.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.zsh
source ~/.config/zsh/plugins/you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#
# plugin configuration
#
autoload -Uz compinit
compinit

# enable you-should-use hardcore mode (forces usage of alias)
export YSU_HARDCORE=1

# export YSU_MESSAGE_FORMAT="$(tput setaf 1)%alias_type: %command -> %alias$(tput sgr0)"

# history substring search bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# options
#

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

HISTSIZE=5000
# HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt extended_glob
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#
# aliases
#
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/zoxide.zsh

# fzf shell integration
eval "$(fzf --zsh)"
enable-fzf-tab

# starship theme
export STARSHIP_CONFIG=~/.config/zsh/themes/starship/starship.toml

eval "$(starship init zsh)"

# get powerlevel10k theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/.config/zsh/.p10k.zsh

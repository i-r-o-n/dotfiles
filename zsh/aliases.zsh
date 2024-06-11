# use zoxide as default to change directories
alias cd="z"
alias c=cd

# ensure ssh uses proper config
alias ssh="ssh -F ~/.config/ssh/config"

# trash files instead of removing them
alias rm='trash-put'

# use eza
alias ls=eza
alias l=ls

alias cl=clear # i use this too much

alias v=nvim
alias "v."="nvim ." # i don't know if this is necessary

# clipboard
alias "copy=xclip" # copy to X clipboard (register *)
alias "copys=xclip -selection clipboard" # copy to system wide clipboard (register +)
alias "put=xclip -o" # output copied content (paste)
alias "puts=xclip -o -selection clipboard" # paste from system wide clipboard (equivalent to `v -selection clipboard`)

# use shorter name for custom script
# alias bak="backup"


#
# git
#
alias g=git
alias gc="git commit -m"
alias gp="git push"
alias gs="git status" # gst also instantiated
alias ga="git add"
alias gl="git pull"
alias gd="git diff"


#
# tmux
#
alias t=tmux

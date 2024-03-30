
alias cd="z"

alias ssh="ssh -F ~/.config/ssh/config"

alias rm='trash-put'

# clipboard
alias "copy=xclip" # copy to X clipboard (register *)
alias "copys=xclip -selection clipboard" # copy to system wide clipboard (register +)
alias "put=xclip -o" # output copied content (paste)
alias "puts=xclip -o -selection clipboard" # paste from system wide clipboard (equivalent to `v -selection clipboard`)

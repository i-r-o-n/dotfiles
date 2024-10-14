# aliases

alias cd = z

alias ssh = ssh -F ~/.config/ssh/config

alias rm = trash-put # consider using rm -t

alias cl = clear

# neovim
alias v  = nvim 
alias v. = nvim .
def sudov [...args] {
  EDITOR=nvim sudoedit ...$args
}

# clipboard
alias copy  = wl-copy
# alias copy  = xclip # copy to X clipboard (register *)
alias copys = xclip -selection clipboard # copy to system wide clipboard (register +)
alias put   = wl-paste
# alias put   = xclip -o # output copied content (paste)
alias puts  = xclip -o -selection clipboard # paste from system wide clipboard (equivalent to `v -selection clipboard`)

# git
alias g  = git
alias gc = git commit -m
alias gp = git push
alias gs = git status # gst also instantiated
alias ga = git add
alias gl = git pull
alias gd = git diff

# tmux
alias t = tmux
alias trs = tmux rename-session 
alias tns = tmux new-session 

# emerge
alias e = emerge --ask

# example from docs
def lsg [] { ls | sort-by type name -i | grid -c | str trim }

# mkinitcpio (don't accidentally break bootloader install)
alias mkinitcpio = ./usr/local/bin/mkinitcpio-wrapper

# in case bash is needed
alias bash = bash --rcfile ~/.bash_standalone_profile

# aliases

alias sudo = doas

alias cd = z
alias zi = __zoxide_zi

alias cat = bat # prefer bat preview

alias ssh = ssh -F ~/.config/ssh/config

alias rm = trash-put # consider using rm -t

alias nf = fastfetch
alias fetch = python ~/app/anifetch/anifetch.py -f ~/app/anifetch/example.mp4 -ff -W 80 -H 80 -c '--symbols wide --fg-only'

alias v  = nvim 
alias v. = nvim .
# def vf [...args] {
#   z ...$args; nvim .
# }


alias h = hx

def sudov [...args] {
  EDITOR=nvim sudoedit ...$args
}

alias e = eza
alias y = yazi

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

# example from docs
# def lsg [] { ls | sort-by type name -i | grid -c | str trim }

# mkinitcpio (don't accidentally break bootloader install)
alias mkinitcpio = ./usr/local/bin/mkinitcpio-wrapper

# in case bash is needed
alias bash = bash --rcfile ~/.bash_standalone_profile

# def ls-spaced [...args] {
#     let has_l_flag = ($args | any {|f| $f =~ '^-.*l.*$' })

#     if $has_l_flag {
#         ^ls ...$args | update mode {|row|
#             $row.mode
#             | str substring 0..2
#             | append ($row.mode | str substring 3..5)
#             | append ($row.mode | str substring 6..9)
#             | str join " "
#         }
#     } else {
#         ^ls ...$args
#     }
# }

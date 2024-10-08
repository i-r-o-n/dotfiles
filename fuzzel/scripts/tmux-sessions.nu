#!/usr/bin/env nu

def create_syncthing_session [] {
    tmux new-session -d -s syncthing
    tmux detach -s syncthing
    tmux send-keys -t syncthing "syncthing" ENTER
}

def create_latex_session [] {
    tmux new-session -d -s latex
    tmux send-keys -t latex "cd ~/docs/latex; v." ENTER
}

def create_learn_haskell_session [] {
    tmux new-session -d -s learn-haskell
    tmux send-keys -t learn-haskell "cd ~/docs/code/learn-haskell; v." ENTER
}

def create_ocaml_session [] {
    tmux new-session -d -s ocaml
    tmux send-keys -t ocaml "cd ~/docs/educ/uw-cse341; v." ENTER
}

def create_config_session [] {
    tmux new-session -d -s config
    tmux send-keys -t config "cd ~/.config; v." ENTER
}

def create_nvim_session [] {
    tmux new-session -d -s nvim
    tmux send-keys -t nvim "cd ~/.config/nvim; .v" ENTER
}

def launch_session [session_name: string] {
    tmux attach-session -t $session_name
}

def create_session [session_name: string] {
    match $session_name {
        "syncthing" => { create_syncthing_session }
        "latex" => { create_latex_session }
        "learn-haskell" => { create_learn_haskell_session }
        "ocaml" => { create_ocaml_session }
        "config" => { create_config_session }
        "nvim" => { create_nvim_session }
        _ => { echo $"Unknown session: ($session_name)" }
    }
}

def main [] {
    let sessions = [
        "syncthing"
        "latex"
        "learn-haskell"
        "ocaml"
        "config"
        "nvim"
    ]

    let selected = (echo $sessions 
      | str join "\n" 
      | fuzzel --config ~/.config/fuzzel/config.ini -d -p " " 
      | str trim)

    if $selected in $sessions {
        create_session $selected
        launch_session $selected
    } else {
        echo "Invalid selection or no selection made."
    }
}

main

#!/usr/bin/env nu

# get windows list
let windows = (hyprctl clients -j | from json | where class != null | each { |window|
    {
        address: $window.address,
        workspace: $window.workspace.id,
        class: $window.class,
        title: $window.title
    }
})

# select a window, hiding address
let selected = ($windows 
    | each { |window| $"($window.workspace) ($window.class) - ($window.title)" } 
    | to text
    | fuzzel --dmenu --config ~/.config/fuzzel/config.ini --prompt "  "
)

# get selected window address
let window_address = ($windows 
    | where { |window| $"($window.workspace) ($window.class) - ($window.title)" == $selected } 
    | get address
    | first
)

# focus selected window
hyprctl dispatch focuswindow $"address:($window_address)"

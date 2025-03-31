export def confirm [
    prompt: string,           # prompt text to display
    default: bool = true      # default response 
] {
    let default_indicator = if $default { "Y/n" } else { "y/N" }
    let response = (input $"($prompt)? [($default_indicator)]: " | str trim)
    
    # return true if empty and default is true, or if starts with y/Y
    if ($response | is-empty) {
        $default
    } else {
        $response | str downcase | str starts-with "y"
    }
}

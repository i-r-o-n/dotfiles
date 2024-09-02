# set NU_OVERLAYS with overlay list, useful for starship prompt
$env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | append {||
  $env.STARSHIP_CONFIG = "~/.config/starship/starship.toml"
  let overlays = overlay list | range 1..
  if not ($overlays | is-empty) {
    $env.NU_OVERLAYS = $overlays | str join ", "
  } else {
    $env.NU_OVERLAYS = null
  }
})

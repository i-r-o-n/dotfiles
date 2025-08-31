#!/usr/bin/env nu

export def configs [] {
  open ~/.config/nushell/configs.nuon
}

export def "config completions" [] {
  configs
  | each {|row|
      {
        value: $row.name
        description: $row.path
      }
    }
}

export def config [
  name: string@"config completions"
] {
  let row = (configs | where name == $name)

  if ($row | is-empty) {
    print $"Unknown config: ($name)"
  } else {
    let path = ($row.0.path)
    ^$env.EDITOR $path
  }
}


export def opam-setup [] {
    let env_vars = (sh -c "eval $(opam env)" | lines | parse "{name}={value}")
    let env_record = ($env_vars | reduce -f {} {|it, acc| $acc | insert $it.name $it.value })
    load-env $env_record
}

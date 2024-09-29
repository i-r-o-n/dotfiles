def get-opam-env []: nothing -> record {
    mut env_record = {}
    
    for entry in (opam env --set-switch | lines | parse "{var}={val}") {
        let var = $entry.var
        let val = $entry.val | str replace -a "'" "" | split row ';' | first
        
        if $var == "PATH" { # opam prepended to path, using path add
            $env_record = ($env_record | insert $var ($val | split row ":" | first))
        } else { # opam new path, update manpath
            $env_record = ($env_record | insert $var $val)
        }
    }

    $env_record
}


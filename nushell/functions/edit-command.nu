def edit-command-in-hx-run [] {
    let tmp = (mktemp)
    $nu.input | save --force $tmp
    hx $tmp
    let cmd = (open $tmp | str join "\n")
    rm $tmp
    if ($cmd | str trim | is-empty) { return }
    nu -c $cmd
}

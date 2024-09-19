def dedupe-history [] {
    let history_path = $"($env.HOME)/.config/nushell/history.txt"
    let backup_path = $"($history_path).bak"

    if not ($history_path | path exists) {
        print $"Error: History file not found at ($history_path)"
        return
    }

    let original_count = (open $history_path | lines | length)

    cp $history_path $backup_path
    let new_count = (
        open $backup_path 
        | lines 
        | uniq 
        | save --force $history_path 
        | lines 
        | length
    )

    let saved_lines = $original_count - $new_count

    rm $backup_path

    print $"Original history file had ($original_count) lines"
    print $"New history file has ($new_count) lines"
    print $"Removed ($saved_lines) duplicate lines"
    print $"Old history file has been overwritten"
}

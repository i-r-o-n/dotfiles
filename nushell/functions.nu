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

def append-to-accept-keywords [package: string, keyword: string = "~amd64"] {
    let keywords_dir = "/etc/portage/package.accept_keywords"
    let files = (ls $keywords_dir | where type == file | get name | path basename)
    
    print $"($files | length) Available files:"
    $files | enumerate | each { |it| print $"\t[($it.index + 1)] ($it.item)" }
    
    print "Enter the number of the file to append to: "
    let selection = (input)
    
    let selection_num = ($selection | into int)
    if $selection_num > 0 and $selection_num <= ($files | length) {
        let selected_file = $files | get ($selection_num - 1)
        let full_path = $"($keywords_dir)/($selected_file)"
        
        echo $"\n($package) ($keyword)" | sudo tee -a $full_path | null
        print $"Appended '($package) ($keyword)' to ($full_path)"
    } else {
        print "Invalid selection"
    }
}

export def append-to-accept-keywords [package: string, keyword: string = "~amd64"] {
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

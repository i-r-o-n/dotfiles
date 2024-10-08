#!/usr/bin/env nu

def main [wd: string] {
    try {

        let project_dir = if ($wd | path basename) == "sections" {
            $wd | path dirname
        } else {
            $wd
        }

        let sections_dir = if ($wd | path basename) == "sections" {
            $wd
        } else if ($wd | path join "sections" | path exists) {
            $wd | path join "sections"
        } else {
            error make {msg: "No 'sections' directory found", label: {text: $wd}}
        }

        let project_file = (
            ls $project_dir 
            | where name =~ '\.tex$'  # filter for .tex files
            | get name 
            | path parse 
            | get stem 
            | first
        )

        if $project_file == null {
            error make {msg: "Project file not found", label: {text: $project_dir}}
        }

        cd $sections_dir

        let next_num = (
            seq 1 100 
            | where {|num| 
                let file_name = ($num | into string) + ".tex"
                # let wildcard_name = ($num | into string) + "*.tex"
                (not ($file_name | path exists)) # and (do { ls $wildcard_name } | length) == 0
            } 
            | first
        )

        let title_completion = "${rootfile}"

        # HACK: use a better way of getting template dir
        open $"($project_dir)/../../../../class/templates/section"
        | str trim
        | str replace -a $title_completion $project_file
        | save -f (($next_num | into string) + ".tex")

        print $"Created new section file: ($next_num).tex"

        # update the main .tex file
        let main_file_path = $project_dir | path join ($project_file + ".tex")
        open $main_file_path    
        | lines 
        | reduce -f [] {|line, acc|
            if $line =~ '\\end{enumerate}' {
                $acc | append $"\t\\item \\subfile{sections/($next_num)}" | append $line
            } else {
                $acc | append $line
            }
        } 
        | str join "\n"
        | save -f $main_file_path

        print $"Updated main file: ($main_file_path)"

    } catch {|err|
        print $"Error: ($err.msg)" | str | ansi strip
        exit 1
    }
}

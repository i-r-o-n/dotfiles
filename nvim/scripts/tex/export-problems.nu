#!/usr/bin/env nu

# NOTE: work in progress
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
            | where name =~ '\.tex$'
            | get name 
            | path parse 
            | get stem 
            | first
        )

        if $project_file == null {
            error make {msg: "Project file not found", label: {text: $project_dir}}
        }

        let output_file = $project_dir | path join ($project_file + "_problems.tex")
        
        let header = $"% problems from ($project_file)\n\n"
        
        let section_files = (
            ls $sections_dir 
            | where name =~ '^\d+\.tex$'
            | sort-by name
            | get name
        )
        
        let compiled_content = (
            $section_files 
            | each {|file|
                let full_path = $sections_dir | path join $file
                let section_num = $file | path parse | get stem

                echo $full_path 
                echo $section_num
                
                let content = open $full_path | str trim
                
                let problem_start = $content | str index-of "\begin{problem}"
                let problem_end = $content | str index-of "\end{problem}" 
                
                if $problem_start != null and $problem_end != null {
                    # 13 chars in '\end{problem}'
                    let problem_content = $content | str substring $problem_start ($problem_end + 13 - $problem_start)
                    
                    $"%($section_num)\n($problem_content)\n\n"
                } else {
                    $"% Section ($section_num) has no problem environment\n\n"
                }
            }
            | str join ""
        )
        
        $header + $compiled_content | save -f $output_file
        
        print $"Compiled problems saved to: ($output_file)"
    } catch {|err|
        print $"Error: ($err.msg)" | str | ansi strip
        exit 1
    }
}

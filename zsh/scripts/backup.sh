#!/bin/sh

show_help() {
	echo "Usage: bkp [-d|--delete] file1 [file2 ...]"
	echo
	echo "Options:"
	echo "  -d, --delete   Move the file instead of copying it."
	echo "  -h, --help     Display this help message."
}

delete_flag=false

while [[ "$1" =~ ^- ]]; do
	case "$1" in
	-d | --delete)
		delete_flag=true
		shift
		;;
	-h | --help)
		show_help
		exit 0
		;;
	*)
		echo "Unknown option: $1"
		show_help
		exit 1
		;;
	esac
done

if [ $# -eq 0 ]; then
	echo "Error: No files specified."
	show_help
	exit 1
fi

for file in "$@"; do
	if [ -e "$file" ]; then
		if [ -e "$file.bak" ]; then
			echo "Warning: '$file.bak' already exists. Overwrite? (y/n)"
			read -r response
			if [ "$response" != "y" ]; then
				echo "Skipping backup of '$file'."
				continue
			fi
		fi

		if $delete_flag; then
			mv "$file" "$file.bak"
			echo "Moved '$file' to '$file.bak'"
		else
			cp -r "$file" "$file.bak"
			echo "Copied '$file' to '$file.bak'"
		fi
	else
		echo "Error: '$file' does not exist."
	fi
done

#!/bin/bash

REPO_PATH=${1:-"."}
unicode_char=$(printf '\u203A')

# Function to get and display the git log
display_git_log() {
    cd "$REPO_PATH" || { echo "Repository path not found!"; exit 1; }

    # Get the git log and format it
    git_log=$(git log --pretty=format:"%h - %an, %ar : %s")

    # Split the git log into lines for interactive selection
    log_entries=()
    while IFS= read -r line; do
        log_entries+=("$line")
    done <<< "$git_log"

    # Display the git log using gum choose
    selected_entry=$(printf "%s\n" "${log_entries[@]}" | gum choose --header "Select a commit" --cursor "${unicode_char} ")

    # Display the selected entry in detail
    if [[ -n "$selected_entry" ]]; then
        commit_hash=$(echo "$selected_entry" | awk '{print $1}')

        files=$(git show --name-only --pretty=format: "$commit_hash")
        files_list=$(echo -e "$files\nExit")

        selected_files=$(printf "%s\n" "$files_list" | gum choose --header "Select a file" --cursor "${unicode_char} ")

        for file in $selected_files; do
            echo "Selected file: $file"
            if [[ "$file" == "Exit" ]]; then
                break
            fi
            file_content=$(git show "$commit_hash:$file")
            echo "File: $file"
            echo "---------------------"
            echo "$file_content" | gum pager --show-line-numbers --soft-wrap
            echo "---------------------"
        done
    fi
}

# Call the function
display_git_log

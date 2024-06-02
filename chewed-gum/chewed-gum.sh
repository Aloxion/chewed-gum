#!/bin/bash

BASE_DIR=$(dirname "$(realpath "$0")")/scripts
echo $BASE_DIR

# Function to display available directories
list_dirs() {
    find "$BASE_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
}

# Function to display available scripts in a directory
list_scripts() {
    local dir="$1"
    find "$BASE_DIR/$dir" -maxdepth 1 -type f -exec basename {} \;
}

# Function to run the selected script
run_script() {
    local dir="$1"
    local script="$2"
    shift 2
    bash "$BASE_DIR/$dir/$script" "$@"
}

# Main function
chewed_gum_main() {
    # List available directories
    dirs=$(list_dirs)
    dirs_list=$(printf "%s\n" "$dirs")
    # Use gum to select a directory
    selected_dir=$(echo "$dirs_list" | gum choose --header "Select a directory")

    # If a directory is selected, list scripts in that directory
    if [[ -n "$selected_dir" ]]; then
        # List available scripts
        scripts=$(list_scripts "$selected_dir")
        scripts_list=$(printf "%s\n" "$scripts")
        # Use gum to select a script
        selected_script=$(echo "$scripts_list" | gum choose --header "Select a script to run")

        # If a script is selected, prompt for arguments and run it
        if [[ -n "$selected_script" ]]; then
            run_script "$selected_dir" "$selected_script" $args
        else
            echo "No script selected."
        fi
    else
        echo "No directory selected."
    fi
}

# Call the main function
chewed_gum_main
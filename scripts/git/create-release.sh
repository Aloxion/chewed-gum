#!/bin/bash

# Function to create a GitHub release
create_github_release() {
    local tag_name="$1"
    local release_notes="$2"

    # Create the GitHub release using gh CLI
    gh release create "$tag_name" --notes "$release_notes"
}

# Function to prompt for user input using gum
prompt_for_input() {
    local prompt="$1"
    gum input --prompt "$prompt"
}

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed or not found in PATH."
    echo "Please install GitHub CLI from https://cli.github.com/ and try again."
    exit 1
fi

# Prompt for tag name
tag_name=$(prompt_for_input "Enter the release tag name (e.g., v1.0.0):")

# Prompt for release notes
release_notes=$(prompt_for_input "Enter the release notes:")

# Call the function to create the GitHub release
create_github_release "$tag_name" "$release_notes"
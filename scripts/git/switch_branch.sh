#!/bin/bash

# Fetch the latest branches
git fetch

# Get a list of branches
BRANCHES=$(git branch --format='%(refname:short)')
unicode_char=$(printf '\u203A')

selected_branch=$(echo "$BRANCHES" | gum choose --header "Select the feature branch" --cursor "${unicode_char} ")

# Checkout the selected branch
git checkout "$selected_branch"

echo "Checked out to branch '$selected_branch'!"

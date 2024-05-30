#!/bin/bash

# Prompt the user for the commit message
commit_message=$(gum input --placeholder "Enter commit message")

# Add changes to git
git add .

# Commit the changes
git commit -m "$commit_message"

# Push the changes
git push

echo "Changes committed and pushed successfully!"
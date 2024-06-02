#!/bin/sh

# Pull request script
# Using Gum

# Get list of branches and select the base branch
BRANCHES=$(git branch --format='%(refname:short)')

# Select the feature branch (the branch you want to merge)
FEATURE_BRANCH=$(echo "$BRANCHES" | gum choose --header "Select the feature branch" --cursor "► ")
if [ -z "$FEATURE_BRANCH" ]; then
    echo "No feature branch selected. Exiting..."
    exit 1
fi
# Select the base branch
BASE_BRANCH=$(echo "$BRANCHES" | gum choose --header "Select the base branch" --cursor "► ")
if [ -z "$BASE_BRANCH" ]; then
    echo "No base branch selected. Exiting..."
    exit 1
fi

# Prompt user for pull request title
PR_TITLE=$(gum input --placeholder "Enter pull request title")
if [ -z "$PR_TITLE" ]; then
    echo "No pull request title provided. Exiting..."
    exit 1
fi
# Prompt user for pull request description
PR_DESCRIPTION=$(gum write --placeholder "Enter pull request description")

# Confirm the details
gum style \
    --foreground 212 --background 235 --border normal \
    --align center --width 50 --margin "1 2" --padding "2 4" \
    "Create a pull request with the following details:

    Base Branch: $BASE_BRANCH
    Feature Branch: $FEATURE_BRANCH
    Title: $PR_TITLE
    Description: $PR_DESCRIPTION"

gum confirm "Create pull request?" && gh pr create --base "$BASE_BRANCH" --head "$FEATURE_BRANCH" --title "$PR_TITLE" --body "$PR_DESCRIPTION" || echo "Aborting Pull request creation. Make sure the branch is pushed, before doing pr" && exit 1
echo "Web view of the pull request"
gh pr view --web
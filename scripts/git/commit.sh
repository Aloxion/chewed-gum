#!/bin/sh

gum confirm "Stage all?" && git add .

TYPE=$(gum choose "feat" "fix" "perf" "docs" "style" "refactor" "test" "build" "bump")
SCOPE=$(gum input --placeholder "scope")

test -n "$SCOPE" && SCOPE="($SCOPE)"

SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change")

gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

gum confirm "Push changes?" && git push
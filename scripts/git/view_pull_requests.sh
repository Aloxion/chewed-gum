PULL_REQUESTS=$(gh pr list)

# Check if there are any pull requests
if [ -z "$PULL_REQUESTS" ]; then
    echo "No pull requests found."
    exit 0
fi

# Display the list of pull requests
echo "$PULL_REQUESTS"
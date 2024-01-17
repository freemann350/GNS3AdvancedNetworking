#!/bin/bash

echo "Press OK when GNS3 is shutdown..."
read
# Get the current date and time in the specified format
commit_date=$(date "+%d-%m-%y_%H:%M:%S")

# Check if a custom commit message is provided as a command-line argument
if [ -n "$1" ]; then
    commit_message="$1"
else
    # Default commit message if no custom message is provided
    commit_message="Automatic commit on $commit_date"
fi

# Perform the commit
git add .
git commit -m "$commit_message"

# Push to the master branch
git push origin master

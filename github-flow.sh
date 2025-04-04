#!/bin/bash

# Ensure script stops on error
set -e

# Ask for the feature branch name
read -p "Enter the name of your feature branch: " BRANCH_NAME

# Create and switch to the new branch
git checkout -b "$BRANCH_NAME"

# Add all changes
git add .

# Commit the changes with a message
read -p "Enter your commit message: " COMMIT_MSG
git commit -m "$COMMIT_MSG"

# Push the branch to GitHub
git push origin "$BRANCH_NAME"

# Create a pull request using GitHub CLI
gh pr create --base main --head "$BRANCH_NAME" --title "$COMMIT_MSG" --body "Automated pull request"

# Notify user
echo "Pull request created! Visit GitHub to review and merge."

# Optionally delete the branch after merging (Uncomment if needed)
# read -p "Do you want to delete the branch after merging? (y/n): " DELETE_BRANCH
# if [[ "$DELETE_BRANCH" == "y" ]]; then
#     git checkout main
#     git pull origin main
#     git branch -d "$BRANCH_NAME"
#     git push origin --delete "$BRANCH_NAME"
# fi


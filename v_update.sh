#!/bin/bash

# Specify the details of the third-party repository and your repository
THIRD_PARTY_REPO="SaurbhPandey/HouseMarketPalce"
YOUR_REPO="karanshukla430/HouseMarketPalce123"
BRANCH_NAME="version_update"

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
DATE_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the new branch name with date and time
BASE_BRANCH="master"
NEW_BRANCH_NAME="${BRANCH_NAME}_${DATE_TIME}"

# Check if the branch already exists
if git rev-parse --verify "$NEW_BRANCH_NAME" >/dev/null 2>&1; then
    echo "Branch '$NEW_BRANCH_NAME' already exists. Skipping."

else
    git checkout master
    git pull origin master
    git checkout -b "$NEW_BRANCH_NAME"
    echo "Created branch '$NEW_BRANCH_NAME'."
    git remote add source https://github.com/SaurbhPandey/HouseMarketPalce.git
    # PREVIOUS_COMMIT=$(git rev-parse HEAD@{1})
    git pull source master
    # Get the commit hashes of the previous commit and current HEAD
    # PREVIOUS_COMMIT=$(git rev-parse HEAD@{1})
    # CURRENT_COMMIT=$(git rev-parse HEAD)

    # Check if changes have been made
    if ! git diff --quiet master; then
        # Changes detected
        # Commit
        git add .
        git commit -m "version update '$DATE_TIME'"
        git push origin $NEW_BRANCH_NAME
        echo "package.json updated and changes pushed to branch '$NEW_BRANCH_NAME'."

        # # Create pull request
        GITHUB_TOKEN="$GITHUB_TOKEN"

        # Set pull request title and description
        PR_TITLE="For Updating Version $DATE_TIME"
        PR_DESCRIPTION="This pull request updates the version."

        # Set your GitHub username and repository name
        USERNAME="karanshukla430"
        REPO_NAME="HouseMarketPalce123"

        # Make the API request to create the pull request
        curl -X POST "https://api.github.com/repos/$USERNAME/$REPO_NAME/pulls" \
            -H "Authorization: Bearer $GITHUB_TOKEN" \
            -H "Content-Type: application/json" \
            -d '{
                "title": "'"$PR_TITLE"'",
                "head": "'"$NEW_BRANCH_NAME"'",
                "base": "'"$BASE_BRANCH"'",
                "body": "'"$PR_DESCRIPTION"'"
            }'
    else
        git checkout master
        git branch -D $NEW_BRANCH_NAME
        echo "No changes detected. Pull request will not be created."
    fi
fi
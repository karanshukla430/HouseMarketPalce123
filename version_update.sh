#!/bin/bash

#git command to create a new branch. If branch with the name exist then it checkout to that branch 

# Define the names of the staging and new branches
staging_branch="master"
version_control="version_control"

# Check if the new branch already exists
if git rev-parse --verify "$version_control" >/dev/null 2>&1; then
  echo "New branch '$version_control' already exists."
  git checkout "$staging_branch"
  git pull origin "$staging_branch"
  git checkout "$version_control"
  git pull origin "$staging_branch"
else
  echo "Creating and checking out new branch '$version_control' based on '$staging_branch'..."
  git checkout "$staging_branch"
  git pull origin "$staging_branch"
  git checkout -b "$version_control" "$staging_branch"
fi


# List of dependencies to change
# dependencies=("uuid" "web-vitals" "react")
npm install -g npm-check-updates
echo "ncu installed=================="
# Loop through the dependencies and change them
# for dependency in "${dependencies[@]}"; do
#   ncu -u "$dependency"
#   if [ $? -eq 0 ]; then
#     echo "Changed $dependency to latest version"
#   else
#     echo "Failed to change $dependency"
#   fi
# npm install

ncu -u js-library-detector
npm install
# Run npm install and redirect stderr to npm_install_error.log
npm install 2> npm_install_error.log

# Check if npm install encountered an error
# if [ $? -ne 0 ]; then
#   echo "npm install encountered an error. Check npm_install_error.log for details."
#   # Optionally, you can add additional error handling here if needed
# else
  # echo "npm install completed successfully. Proceeding with commit."
  # # Add files to the staging area
  # git add .

  # # Commit changes
  # git commit -m "Updated dependencies"

  # # Push changes to the remote repository
  # git push origin <branch-name>

# git add .

# # Get the current UTC time and store it in a variable
# utc_time=$(date -u +'%Y-%m-%d %H:%M:%S UTC')

# # Create a new commit with the UTC time in the commit message
# git commit -am "Version update - UTC time: $utc_time"

# git push origin "$version_control"

# fi

# Stage all changes
git add .

# Get the current UTC time and store it in a variable
utc_time=$(date -u +'%Y-%m-%d %H:%M:%S UTC')

# Create a new commit with the UTC time in the commit message
git commit -am "Version update - UTC time: $utc_time"

git push origin "$version_control"


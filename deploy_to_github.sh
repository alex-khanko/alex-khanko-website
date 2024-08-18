#!/bin/bash
set -e

# Variables
DIST_DIR="dist"
GITHUB_REPO="https://$GITHUB_TOKEN@github.com/alex-khanko/alex-khanko.github.io.git"
BRANCH="main"
GIT_USER_NAME="Aliaksei Khanko"
GIT_USER_EMAIL="alex.khanko@gmail.com"

# Ensure we are in the build directory
cd $DIST_DIR

# Initialize a new Git repository
git init

# Set Git user
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# Add the remote GitHub repository
git remote add origin $GITHUB_REPO

# Check out the target branch
git checkout -b $BRANCH

# Add and commit all files
git add .
git commit -m "Deploy built files to GitHub"

# Force push to the target branch
git push --force origin $BRANCH

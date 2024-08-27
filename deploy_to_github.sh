#!/bin/bash
set -e

# Variables
DIST_DIR="public"
GITHUB_REPO="https://$GITHUB_TOKEN@github.com/alex-khanko/alex-khanko.github.io.git"
BRANCH="main"
GIT_USER_NAME="Aliaksei Khanko"
GIT_USER_EMAIL="alex.khanko@gmail.com"

# Ensure we are in the build directory
cd $DIST_DIR

# Remove .git
rm -rf .git

# Initialize a new Git repository
git init

# Set Git user
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

git checkout -b $BRANCH

git remote add origin $GITHUB_REPO

# Add and commit all files
git add .
git commit -m "Deploy built files to GitHub"

# Force push to the target branch
git push --force origin $BRANCH

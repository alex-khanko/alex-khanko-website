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

# Initialize a new Git repository
git init

# Set Git user
git config user.name "$GIT_USER_NAME"
git config user.email "$GIT_USER_EMAIL"

# Check if the branch already exists
if git show-ref --verify --quiet refs/heads/$BRANCH; then
  git checkout $BRANCH
else
  git checkout -b $BRANCH
fi

# Check if the remote 'origin' already exists, if not, add it
if git remote | grep origin >/dev/null; then
  git remote remove origin
fi

git remote add origin $GITHUB_REPO

if git diff --quiet && git diff --staged --quiet; then
  echo "No changes to commit. Exiting."
  exit 0
fi

# Add and commit all files
git add .
git commit -m "Deploy built files to GitHub"

# Force push to the target branch
git push --force origin $BRANCH

#!/bin/bash

rm -rf public

#####

rm -rf content

# Add blog content
git clone https://github.com/alex-khanko/alex-khanko-blog content

#####

#!/bin/bash

POSTS_DIR="content/post"

# Find all files and move them to the root 'posts' directory
find "$POSTS_DIR" -type f -name "*" -exec mv {} "$POSTS_DIR" \;

# Remove all empty directories within 'posts'
find "$POSTS_DIR" -type d -empty -delete

#####

git submodule foreach git pull origin master

#!/bin/bash
# Simple script to auto add, commit, and push to a GitHub repo
# Author: Regin Ian Pioquinto

# Exit if any command fails
set -e

# Check if we're inside a git repo
if [ ! -d .git ]; then
    echo "❌ This directory is not a Git repository."
    exit 1
fi

# Default commit message (with timestamp)
COMMIT_MSG="Auto update: $(date '+%Y-%m-%d %H:%M:%S')"

# Allow custom commit message if provided
if [ "$1" != "" ]; then
    COMMIT_MSG="$1"
fi

# Stage all changes
echo "🔄 Adding all files..."
git add -A

# Commit changes
echo "📝 Committing changes..."
git commit -m "$COMMIT_MSG" || echo "⚠️ Nothing to commit."

# Push changes to the current branch
echo "🚀 Pushing to remote repository..."
git push origin "$(git branch --show-current)"

echo "✅ Done! Your files are now pushed to GitHub."

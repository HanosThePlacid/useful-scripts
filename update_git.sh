#!/bin/bash
REPO_PATH="/path/to/repo"

cd "$REPO_PATH" || { echo "Repository not found!"; exit 1; }

echo "Pulling latest changes..."
git pull

echo "Checking status..."
git status

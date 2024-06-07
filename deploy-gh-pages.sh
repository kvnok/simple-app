#!/bin/bash

# Build the Docker image
docker build -t simple-app .

# Create a temporary container to extract the built files
docker create --name extract simple-app

# Copy the built files from the container to a local directory
docker cp extract:/usr/src/app/dist .

# Remove the temporary container
docker rm -f extract

# Initialize a new Git repository in the `dist` directory
cd dist
git init

# Configure Git
git config user.name "Kevin Kroon"
git config user.email "kkroon@student.codam.nl"

# Commit all the files
git add .
git commit -m "Deploy to GitHub Pages"

# Push to the `gh-pages` branch of your GitHub repository
git push -f git@github.com:kvnok/simple-app.git master:gh-pages

# Clean up
cd ..
rm -rf dist

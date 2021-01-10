#!/usr/bin/env bash

# Get Arguments
BRANCH=$1
SERVICE=$2

# Run Commands
git checkout $BRANCH && \
git reset --hard && \
git pull && \
npm install && \
npm run build && \
pm2 restart $SERVICE && \
echo "*** Deployment Completed: $SERVICE ***"
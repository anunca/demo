#!/bin/bash

PROJECT_DIRECTORY=$1

if [ ! -d $PROJECT_DIRECTORY ]
then
    echo -e "$PROJECT_DIRECTORY is not a directory\n"
    exit
fi

cd $PROJECT_DIRECTORY

if [ ! -d '.git' ]
then
    echo -e "$PROJECT_DIRECTORY is not a git repository\n"
    exit
fi

REMOTE_ORIGIN=$(git config --get remote.origin.url)

if [ -z "$REMOTE_ORIGIN" ]
then
    echo -e "remote origin is empty\n"
    exit
fi

function git_remove_history {

    echo -e "removing history from remote origin: $REMOTE_ORIGIN\n"

    rm -rf .git
    git init
    git add .
    git commit -m"initial commit"
    git remote add origin $REMOTE_ORIGIN
    git remote -v
    git push -u --force origin master
}

git_remove_history
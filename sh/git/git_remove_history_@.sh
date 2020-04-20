#!/bin/bash

PROJECT_DIRECTORY=$1

if [ ! -d $PROJECT_DIRECTORY/.git ];
then
  echo -e "$PROJECT_DIRECTORY is not a directory\n"
  exit 1
fi

cd $PROJECT_DIRECTORY

GIT_REMOTE=$(git remote -v|awk '{print $2}'|head -1)

rm -rf .git
git init .
git add .
git commit -m"initial commit"
git remote add origin $GIT_REMOTE
git push -u --force origin master
#!/bin/bash

for PROJECT_DIRECTORY in $(ls) ;
do
    if [ -d $PROJECT_DIRECTORY/.git ] ;
    then
        echo $PROJECT_DIRECTORY
        && cd $PROJECT_DIRECTORY
        && bash /usr/local/bin/git_remove_history.sh .
        && git branch
        && git status
        && cd ..
    else
        echo -e "$PROJECT_DIRECTORY is not a directory\n"
    fi
done
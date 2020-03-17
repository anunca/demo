#!/bin/bash

IFS=$'\n'

#for i in $(find -name *.jpg);do mv -v "$i" "$i.old" && convert -trim "$i.old" "$i" && rm -v "$i.old";done
for i in $(find -name *.jpg)
do
    mv -v "$i" "$i.old" &&
    convert -trim "$i.old" "$i" && rm -v "$i.old"
done
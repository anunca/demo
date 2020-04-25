#!/bin/bash

for P in *;
do
  mkdir ${P%.pdf} &&
  mv "$P" "${P%.pdf}" &&
  cd "${P%.pdf}" &&
  cd ..;
done

for D in *;
do
  cd $D &&
  echo $D &&
  pdfimages -j *.pdf image &&
  cd ..;
done

#
for p in *.pdf; do echo $p && mkdir "${p%.pdf}" && mv "$p" "${p%.pdf}"; done
for d in *; do echo $d && cd "$d" && pdfimages -j *.pdf image && rm *.pdf && cd ..; done

for a in *.cbr; do mv "$a" "${a%cbr}rar"; done
for a in *.rar; do unrar l "$a" ; done
for a in *.rar; do echo $a && mkdir "${a% -*}" && mv "$a" "${a% -*}"; done

for a in *; do echo $a && mv "$a" "${a% -*}"; done
for a in *; do echo $a && cd "$a" && unrar e *.rar && rm *.rar && cd ..; done

for a in *; do echo $a && cd "$a" && unrar e *.rar && rm *.rar && cd ..; done
#!/bin/bash

echo "Pulling vimSettings repo..."
git pull

echo "Replacing ~/.vimrc with vimSettings/vimrc..."
cp ./vimrc ~/.vimrc

#echo "exporting PS1..."
#export PS1="[\u@\h \w]\\$ \[$(tput sgr0)\]"

echo "done"

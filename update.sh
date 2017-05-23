#!/bin/bash

echo "Pulling vimSettings repo..."
git pull

echo "Replacing ~/.vimrc with vimSettings/.vimrc..."
cp ./.vimrc ~/vimrc

echo "done"

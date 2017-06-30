#!/bin/bash

# Pull repository
while true
do
    read -p "Pull repository? (y/n) " input
    case $input in
        "y"|"Y"*) echo "Pulling repository..."
                 git pull
                 break;;
        "n"|"N") break;;
    esac
done

# Update ~/.vimrc
while true
do
    read -p "Overwrite local .vimrc file? Current version will be backed up to ~/.depricated.vimrc (y or n) " input
    case $input in
        "y"|"Y") echo "Overwriting ~/.vimrc"
                 mv ~/.vimrc ~/.depricated.vimrc
                 cp vimrc ~/.vimrc
                 break;;
        "n"|"N") break;;
        *)       echo "Please enter a valid input";;
    esac
done

# Update ~/.bashrc
while true
do
    read -p "Overwrite local .bashrc file? Current version will be backed up to ~/.depricated.bashrc (y or n) " input
    case $input in
        "y"|"Y") echo "Overwriting local .bashrc..."
                 mv ~/.bashrc ~/.depricated.bashrc
                 cp bashrc ~/.bashrc
                 break;;
        "n"|"N") break;;
        *)       echo "Please enter a valid input";;
    esac
done

#!/bin/bash -e

# This script install vundle and symlinks in your home direcory pointing to
# this vim settings folder.

mkdir -p ~/.vim/bundle

# install vundle
if [ -d ~/.vim/bundle/vundle ]
then
    echo "Found bundle/vundle folder, removing..."
    rm -fr ~/.vim/bundle/vundle
    echo "OK"
fi

echo "Cloning vundle plugin into bundle/vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "OK"

# if vimrc does not exist, create symlink
if [ ! -f ~/.vimrc ]
then
    echo "Creating .vimrc symlink..."
    ln -s ~/.vim/vimrc ~/.vimrc
    echo "OK"
else
    echo "Found .vimrc file, skipping symlink creation."
fi

if [ ! -f ~/.gvimrc ]
then
    echo "Creating .gvimrc symlink..."
    ln -s ~/.vim/gvimrc ~/.gvimrc
    echo "OK"
else
    echo "Found .gvimrc file, skipping symlink creation."
fi

echo "Starting vim with BundleInstall to install all plugins..."
vim +BundleInstall +qall

#!/bin/bash

NEOVIM_DIR=$HOME/.config/nvim

if [ ! -d $NEOVIM_DIR ]; then
    mkdir -p $NEOVIM_DIR
fi

ln -s $(pwd)/vimrc $NEOVIM_DIR/init.vim
ln -s $(pwd)/vimrc ~/.neovimrc
ln -s $(pwd)/ideavimrc ~/.ideavimrc
ln -s $(pwd)/xvimrc ~/.xvimrc
ln -s $(pwd)/UltiSnips ~/.vim/UltiSnips

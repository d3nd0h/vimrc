#!/bin/bash

NEOVIM_DIR=$HOME/.config/nvim
VIM_DIR=$HOME/.vim

ln -s $VIM_DIR $NEOVIM_DIR
ln -s $(pwd)/vimrc $NEOVIM_DIR/init.vim
ln -s $(pwd)/vimrc ~/.neovimrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/ideavimrc ~/.ideavimrc
ln -s $(pwd)/xvimrc ~/.xvimrc
ln -s $(pwd)/UltiSnips ~/.vim/UltiSnips

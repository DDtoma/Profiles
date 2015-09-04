#!/bin/bash

URL="https://github.com/robbyrussell/oh-my-zsh"
source_path="$HOME/Profiles/zsh"

git clone ${URL} $HOME/.oh-my-zsh
ln -s ${source_path}/.zshrc $HOME
unset source_path
unset URL

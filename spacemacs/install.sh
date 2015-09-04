#!/bin/bash

URL="https://github.com/syl20bnr/spacemacs.git"
source_path="$HOME/Profiles/spacemacs"

git clone ${URL} $HOME/.emacs.d
ln -s ${source_path}/.spacemacs $HOME
unset source_path
unset URL

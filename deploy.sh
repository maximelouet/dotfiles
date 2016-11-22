#!/bin/sh

DDIR=/data/dotfiles

echo "zsh + prezto..."
# zsh and zprezto
rm -f ~/.zshrc ~/.bashrc ~/.mybashrc ~/.zpreztorc ~/.zcompdump ~/.zprezto
rm -rf ~/.zprezto
ln -s $DDIR/zprezto ~/.zprezto
ln -s $DDIR/zshrc ~/.zshrc
ln -s $DDIR/zpreztorc ~/.zpreztorc

echo "vim"
# vim
rm -f ~/.vimrc
rm -f ~/.vim
rm -rf ~/.vim
ln -s $DDIR/vim ~/.vim
ln -s $DDIR/vimrc ~/.vimrc

echo "i3"
# i3
rm -f ~/.i3
rm -rf ~/.i3
ln -s $DDIR/i3 ~/.i3

echo "feh"
# feh
rm -rf ~/.fehbg
ln -s $DDIR/fehbg ~/.fehbg

echo "git"
# git
rm -rf ~/.gitconfig
ln -s $DDIR/gitconfig ~/.gitconfig

echo "emacs"
# emacs
rm -rf ~/.emacs
ln -s $DDIR/emacs ~/.emacs

echo "screen"
# screen
rm -f ~/.screenrc
ln -s $DDIR/screenrc ~/.screenrc

echo "gtk"
# gtk
rm -f ~/.gtkrc-2.0
ln -s $DDIR/gtkrc-2.0 ~/.gtkrc-2.0

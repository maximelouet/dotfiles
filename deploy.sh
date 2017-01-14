#!/bin/zsh

defaultSDIR=$(pwd) # dotfiles source
defaultDDIR=~ # dotfiles destination

RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'

echo "Saumon dotfiles deploy script"

remove=(
  bashrc
  mybashrc
  zcompdump
)

files=(
  zshrc
  zsh_aliases
  zpreztorc
  vim
  vimrc
  fehbg
  gitconfig
  emacs
  screenrc
  tmux.conf
)

noheadless=(
  i3
  gtkrc-2.0
  config/termite
  config/dunst
  config/compton.conf
  Xresources
  xinitrc
)


## Prompt for settings

echo -ne "\nSource directory (${GREEN}$defaultSDIR${RESET}) "
read SDIR
if [ ${#SDIR} -lt 1 ]; then
  SDIR=$defaultSDIR
fi

echo -ne "Destination directory (${GREEN}$defaultDDIR${RESET}) "
read DDIR
if [ ${#DDIR} -lt 1 ]; then
  DDIR=$defaultDDIR
fi

defaultBDIR=$DDIR/OLD_dotfiles # backup directory for current dotfiles
echo -ne "Backup directory (${GREEN}$defaultBDIR${RESET}) "
read BDIR
if [ ${#BDIR} -lt 1 ]; then
  BDIR=$defaultBDIR
fi

echo -n "Is this a headless server? (y/N) "
read headless
if [ ${#headless} -gt 0 ]; then
  echo
  case $headless in
    [Yyo]* ) headless=1;;
    [Nn]*  ) headless=0;;
    *      ) echo "Wtf?"; exit 42;;
  esac
else
  headless=0
fi


## Settings recap and confirm

echo -e "\nCurrent settings:"
echo -e "\tSource:\t\t$SDIR\n\tDestination:\t$DDIR\n\tBackup:\t\t$BDIR"
echo -ne "\tHeadless: "
if [ $headless -eq 1 ]; then
  echo "yes"
else
  echo "no"
fi

echo -n "Is this correct ? (Y/n) "
read yn
echo

if [ ${#yn} -gt 0 ]; then
  case $yn in
    [Yyo]* ) echo;;
    [Nn]*  ) echo "Aborted."; exit 1;;
    *      ) echo "Wtf?"; exit 42;;
  esac
fi

echo -n "Create /data symlink? This is mandatory for many dotfiles. (Y/n) "
read data
echo
if [ ${#data} -lt 1 ]; then
  echo "sudo ln -s $DDIR /data"; sudo ln -s $DDIR /data;echo;
else
  case $data in
    [Yyo]* ) echo;echo "sudo ln -s $DDIR /data"; sudo ln -s $DDIR /data;echo;;
    [Nn]*  ) echo;;
    *      ) echo "Wtf?"; exit 42;;
  esac
fi


## Move all current dotfiles into the backup directory
echo -e "\nSTEP 1: moving current dotfiles into backup directory..."
mkdir $BDIR
for f in $remove
do
  echo "mv $DDIR/.$f $BDIR/"
  mv $DDIR/.$f $BDIR/
done
for f in $files
do
  echo "mv $DDIR/.$f $BDIR/"
  mv $DDIR/.$f $BDIR/
done

## Clone prezto
echo -e "\n\nSTEP 2: cloning prezto for zsh..."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

## Copy new dotfiles
echo -e "\n\nSTEP 3: copying dotfiles..."
for f in $files
do
  echo "ln -s $SDIR/$f $DDIR/.$f"
  ln -s $SDIR/$f $DDIR/.$f
done
if [ $headless -eq 0 ]; then
  for f in $noheadless
  do
    echo "ln -s $SDIR/$f $DDIR/.$f"
    ln -s $SDIR/$f $DDIR/.$f
  done
fi

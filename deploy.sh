#!/bin/zsh

# exit in case of error
set -e

defaultSDIR=$(pwd) # dotfiles source
defaultDDIR=~ # dotfiles destination
dataSymlink="/data"

RED='\033[0;31m'
GREEN='\033[0;32m'
DIM='\e[2m'
RESET='\033[0m'

echo "${RESET}Welcome to the Saumon dotfiles deploy script!"

remove=(
  bashrc
  mybashrc
  zcompdump
  zprezto
)

files=(
  zshrc
  zsh_aliases
  zpreztorc
  config/nvim
  fehbg
  gitconfig
  emacs
  screenrc
  tmux.conf
  taskrc
  yaourtrc
  npmrc
)

noheadless=(
  config/i3
  gtkrc-2.0
  Xresources
  xinitrc
  config/termite
  config/dunst
  config/compton.conf
  config/udiskie
  config/user-dirs.dirs
  config/user-dirs.locale
  config/cava
  config/clipster
)

createdirs=(
  local/share/nvim/undodir
  local/share/nvim/swapfiles
)


## Prompt for settings

echo -ne "\nSource directory (${GREEN}$defaultSDIR${RESET}): "
read SDIR
if [ ${#SDIR} -lt 1 ]; then
  SDIR=$defaultSDIR
fi

echo -ne "Destination directory (${GREEN}$defaultDDIR${RESET}): "
read DDIR
if [ ${#DDIR} -lt 1 ]; then
  DDIR=$defaultDDIR
fi

defaultBDIR=$DDIR/OLD_dotfiles # backup directory for current dotfiles
echo -ne "Backup directory (${GREEN}$defaultBDIR${RESET}): "
read BDIR
if [ ${#BDIR} -lt 1 ]; then
  BDIR=$defaultBDIR
fi
if [ -e "$BDIR" ]; then
  echo -ne "${RED}Warning${RESET}: this directory already exists. Proceed and delete it ? (Y/n): "
  read proceed
  if [ ${#proceed} -gt 0 ]; then
    echo
    case $proceed in
      [Yyo]* ) echo "rm -rf $BDIR"; rm -rf "$BDIR";;
      *      ) echo "Rip"; exit 42;;
    esac
  else
    echo "rm -rf $BDIR"
    rm -rf "$BDIR"
  fi
fi

echo -n "Is this a headless server? (y/N): "
read headless
if [ ${#headless} -gt 0 ]; then
  case $headless in
    [Yyo]* ) headless=1;;
    [Nn]*  ) headless=0;;
    *      ) echo -e "\n${RED}Wtf?${RESET}"; exit 42;;
  esac
else
  headless=0
fi


## Settings recap and confirm

echo -e "\nCurrent settings:"
echo -e "\tSource:\t\t$SDIR\n\tDestination:\t$DDIR\n\tBackup:\t\t$BDIR"
echo -ne "\tHeadless:\t"
if [ $headless -eq 1 ]; then
  echo "yes"
else
  echo "no"
fi

echo -ne "\nIs this correct ? (Y/n): "
read yn
echo

if [ ${#yn} -gt 0 ]; then
  case $yn in
    [Yyo]* ) echo;;
    [Nn]*  ) echo -e "${RED}Aborted.${RESET}"; exit 1;;
    *      ) echo -e "${RED}Wtf?${RESET}"; exit 42;;
  esac
fi

if [ -e "$dataSymlink" -a -h "$dataSymlink" ]; then
  echo "Note: symlink $dataSymlink already exists."
elif [ -e "$dataSymlink" ]; then
  echo "Warning: file $dataSymlink exists but is not a symlink."
else
  echo -n "Symlink $dataSymlink does not exist."
  echo -n " Create it now? This is mandatory for many dotfiles. (Y/n): "
  read data
  echo
  if [ ${#data} -lt 1 ]; then
    echo "sudo ln -s $DDIR /data"; sudo ln -s $DDIR /data;echo;
  else
    case $data in
      [Yyo]* ) echo -e "\nsudo ln -s $DDIR /data"; sudo ln -s $DDIR /data;echo;;
      [Nn]*  ) echo;;
      *      ) echo -e "${RED}Wtf?${RESET}"; exit 42;;
    esac
  fi
fi

sleep 1

## Move current dotfiles that will be overwritten into the backup directory
echo -e "\n${GREEN}STEP 1: moving current dotfiles into backup directory...${RESET}"
echo "mkdir -p $BDIR"
mkdir -p $BDIR
for f in $remove $files; do
  if [ -e "$DDIR/.$f" ]; then
    echo "mv -f $DDIR/.$f $BDIR/"
    mv -f $DDIR/.$f $BDIR/
  fi
done
if [ $headless -eq 0 ]; then
  for f in $noheadless; do
    if [ -e "$DDIR/.$f" ]; then
      echo "mv -f $DDIR/.$f $BDIR/"
      mv -f $DDIR/.$f $BDIR/
    fi
  done
fi

sleep 1

## Clone prezto
echo -e "\n\n${GREEN}STEP 2: cloning prezto for zsh...${RESET}"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sleep 1

## Set saumon theme
echo -e "\n\n${GREEN}STEP 3: copying saumon theme...${RESET}"
echo "ln -sf $SDIR/saumon.zsh-theme $DDIR/.zprezto/modules/prompt/functions/prompt_saumon_setup"
ln -sf $SDIR/saumon.zsh-theme $DDIR/.zprezto/modules/prompt/functions/prompt_saumon_setup

sleep 1

## Create needed directories
echo -e "\n\n${GREEN}STEP 4: creating some needed directories...${RESET}"
for d in $createdirs
do
  echo "mkdir -p $DDIR/.$d"
  mkdir -p $DDIR/.$d
done

sleep 1

## Copy new dotfiles
echo -e "\n\n${GREEN}STEP 5: copying dotfiles...${RESET}"
for f in $files
do
  echo "ln -sf $SDIR/$f $DDIR/.$f"
  ln -sf $SDIR/$f $DDIR/.$f
done
if [ $headless -eq 0 ]; then
  for f in $noheadless
  do
    echo "ln -sf $SDIR/$f $DDIR/.$f"
    ln -sf $SDIR/$f $DDIR/.$f
  done
fi

sleep 1

## Install Vim Plug
echo -e "\n\n${GREEN}STEP 6: installing vim-plug...${RESET}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

sleep 1

echo -e "\n\n${GREEN}Done!${RESET}"

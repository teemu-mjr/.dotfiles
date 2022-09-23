#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m" # No Color

# .config folder
for file in $(pwd)/.config/*
do
  f="${file##*/}"
  if [[ -e ~/.config/"$f" ]]
  then
    if [[ -L ~/.config/"$f" ]]
    then
      echo -e "${GREEN}$f already linked!${NC}"
    else
      echo -e "${RED}$f exists!${NC}"
    fi

  else
    read -p "Want to link $f (y/n)? " -n 1 -r
    echo
    if [[  $REPLY =~ ^[Yy]$ ]]
    then
      ln -s $file ~/.config/$f
      echo -e "${GREEN}linked $f${NC}"
    fi
  fi
done

# homedir files
for f in ~/.dotfiles/* .[^.]*;
do
  if [[ -f $f ]] && [[ $f != *.sh ]] && [[ $f != .gitignore ]] && [[ $f != .gitmodules ]]
    then
      if [[ -f ~/"$f" ]]
      then
        if [[ -L ~/"$f" ]]
        then
          echo -e "${GREEN}$f already linked!${NC}"
        else
          echo -e "${RED}$f exists!${NC}"
        fi

      else
        read -p "Want to link $f (y/n)? " -n 1 -r
        echo
        if [[  $REPLY =~ ^[Yy]$ ]]
        then
          ln -s ~/.dotfiles/$f ~/$f
          echo -e "${GREEN}linked $f${NC}"
        fi
      fi
    fi
done

# packer install
if [[ ! -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]
then
  read -p "Install nvim packer (y/n)? " -n 1 -r
  echo
  if [[ $RELY =~ ^[Yy] ]]
  then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  fi
else
  echo "Packer is installed!"
fi

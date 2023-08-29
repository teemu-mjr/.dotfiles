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
    if [[ $1 != --noconfirm ]]
    then
      read -p "Want to link $f (y/n)? " -n 1 -r
      echo
    fi
    if [[ $1 == --noconfirm || $REPLY =~ ^[Yy]$ ]]
    then
      ln -s $file ~/.config/$f
      echo -e "${GREEN}linked $f${NC}"
    fi
  fi
done

# homedir files
for f in ~/.dotfiles/* .[^.]*;
do
  if [[ $f != .config ]] && [[ $f != .git ]] && [[ $f != *scripts ]] && [[ $f != *install.sh ]] && [[ $f != .gitignore ]]
    then
      if [[ -f ~/"$f" ]] || [[ -d ~/"$f" ]]
      then
        if [[ -L ~/"$f" ]]
        then
          echo -e "${GREEN}$f already linked!${NC}"
        else
          echo -e "${RED}$f exists!${NC}"
        fi

      else
        if [[ $1 != --noconfirm ]]
        then
          read -p "Want to link $f (y/n)? " -n 1 -r
          echo
        fi
        if [[ $1 == --noconfirm || $REPLY =~ ^[Yy]$ ]]
        then
          ln -s ~/.dotfiles/$f ~/$f
          echo -e "${GREEN}linked $f${NC}"
        fi
      fi
    fi
done

# scripts folder
for file in $(pwd)/scripts/*
do
  f="${file##*/}"
  if [[ -e /usr/local/bin/"$f" ]]
  then
    if [[ -L /usr/local/bin/"$f" ]]
    then
      echo -e "${GREEN}$f already linked!${NC}"
    else
      echo -e "${RED}$f exists!${NC}"
    fi

  else
    if [[ $1 != --noconfirm ]]
    then
      read -p "Want to link $f (y/n)? " -n 1 -r
      echo
    fi
    if [[ $1 == --noconfirm || $REPLY =~ ^[Yy]$ ]]
    then
      sudo ln -s $file /usr/local/bin/$f
      echo -e "${GREEN}linked $f${NC}"
    fi
  fi
done

#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

if [[ ! -e ~/.dotfiles.back ]]
then
  mkdir ~/.dotfiles.back
  echo "Created dir ~/.dotfiles.back"
fi

for f in ~/.dotfiles/* .[^.]*; do
  if [[ $f != *.sh ]] && [[ $f != *.git ]]
    then
      if [[ -e ~/"$f" ]]
      then
        echo -e "${RED}$f exists!${NC}"

        read -p "Want to replace $f (y/n)? " -n 1 -r
        if [[  $REPLY =~ ^[Yy]$ ]]
        then
          mv ~/"$f" ~/.dotfiles.back/"$f.$RANDOM"
          echo "Moved $f to .dotfiles.back"

          ln -s ~/.dotfiles/$f ~/$f
          echo "linked $f"
        fi

        else
          read -p "Want to link $f (y/n)? " -n 1 -r
          echo
          if [[  $REPLY =~ ^[Yy]$ ]]
          then
            ln -s ~/.dotfiles/$f ~/$f
            echo "linked $f"
            echo "\n"
          fi
        fi
    echo -e "\n"
    fi
done

read -p "Install nvim packer (y/n)? " -n 1 -r
echo
if [[ $RELY =~ ^[Yy] ]]
then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

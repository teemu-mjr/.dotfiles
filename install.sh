#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color

# link dotfiles to root
for f in ~/.dotfiles/* .[^.]*; do
    if [[ $f != *.sh ]] && [[ $f != *.git ]] && [[ $f != *astro_user ]]
    then
        if [[ -e ~/"$f" ]]
        then
            echo -e "${RED}$f exists!${NC}"
        else
            ln -s ~/.dotfiles/$f ~/$f
            echo "linked $f"
        fi
    fi
done

##### INSTALL #####

read -p "Install oh-my-posh (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[Yy]$ ]]
then
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    sudo chmod +x /usr/local/bin/oh-my-posh
fi

read -p "Install nodejs (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[Yy]$ ]]
then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

read -p "Install tsserver (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[Yy]$ ]]
then
    npm install -g typescript-language-server typescript
fi

read -p "Install neovim (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[  $REPLY =~ ^[Yy]$ ]]
then
    # install neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    sudo mv nvim.appimage /usr/local/bin/nvim
    chmod u+x /usr/local/bin/nvim
fi

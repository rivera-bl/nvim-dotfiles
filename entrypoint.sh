#!/bin/sh

# set environment
export PATH="$HOME/.local:$PATH"
sudo sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

# install packer plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

tail -f /dev/null

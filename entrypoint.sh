#!/bin/bash

# set environment
export PATH="$HOME/.local:$PATH"

# install language servers
curl -o /tmp/terraform-ls.zip https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_386.zip
sudo unzip /tmp/terraform-ls.zip -d /usr/local/bin

# install packer plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && sh

#!/bin/sh

# set environment
export PATH="$HOME/.local:$PATH"
sudo sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

# install tools
sudo apk add --no-cache terraform

# install zsh plugins
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions

# install language servers
curl -o /tmp/terraform-ls.zip https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_386.zip
sudo unzip /tmp/terraform-ls.zip -d /usr/local/bin

# install packer plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && zsh

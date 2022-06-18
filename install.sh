#!/bin/sh
apk add --no-cache \
        neovim tmux zsh zsh-vcs zsh-syntax-highlighting zsh-autosuggestions fzf \
        git curl \
        cmake make build-base libstdc++ perl \
        bash ninja yarn npm \
        terraform docker \
        sudo

# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# docker
addgroup vagrant docker
rc-update add docker

# awscli

# terraform lsp
curl https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_386.zip > /tmp/terraform-ls.zip 
unzip -o /tmp/terraform-ls.zip -d /usr/local/bin

sed -i -e "/^vagrant/s/bin\/bash/bin\/zsh/" /etc/passwd

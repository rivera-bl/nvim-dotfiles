FROM alpine:3.16

# coc-snippets needs python3..
ENV USER=vim

# basic pkgs,treesitter deps
# ls -> lua:bash,ninja - yamlls:yarn,npm - json:npm
RUN apk add --no-cache \
            neovim tmux \
            git curl \
            cmake make build-base libstdc++ \
            bash ninja yarn npm \
            sudo && \
            adduser -D $USER && \
            echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
            chmod 0440 /etc/sudoers.d/$USER && \
            mkdir -p /home/$USER/.config && chown -R $USER:$USER /home/$USER/.config

COPY --chown=$USER:$USER . /home/vim/.config/nvim/ 

USER $USER

# TODO: get lua to work, it works when installing manually but not through lsp-installer
# TODO: export the $HOME/.local PATH

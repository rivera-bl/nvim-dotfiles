FROM alpine:3.16

# coc-snippets needs python3..
ENV USER=vim
ENV EXT="coc-yaml coc-snippets coc-docker coc-json coc-css coc-prettier coc-eslint coc-emoji"
ENV EXT_DIR=/home/$USER/.config/coc/extensions

# basic pkgs,treesitter deps,coc deps,user
RUN apk add --no-cache \
            neovim tmux \
            git curl \
            cmake make build-base libstdc++ \
            npm nodejs yarn python3 py3-pip\
            sudo && \
            adduser -D $USER && \
            echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
            chmod 0440 /etc/sudoers.d/$USER && \
            mkdir -p $EXT_DIR && chown -R $USER:$USER /home/$USER/.config 

COPY --chown=$USER:$USER . /home/vim/.config/nvim/ 

USER $USER

# install extensions needed for autocompletion
# TODO: try nvim native LSP
RUN yarn --cwd $EXT_DIR add $EXT && pip install pynvim

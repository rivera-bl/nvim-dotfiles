FROM alpine:3.16

ENV USER=vim

RUN apk add --no-cache \
            neovim tmux zsh zsh-vcs zsh-syntax-highlighting \
            git curl \
            cmake make build-base libstdc++ \
            bash ninja yarn npm \
            sudo && \
            adduser -D $USER && \
            echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
            chmod 0440 /etc/sudoers.d/$USER && \
            mkdir -p /home/$USER/.config && chown -R $USER:$USER /home/$USER/.config

WORKDIR /home/$USER

COPY --chown=$USER:$USER . .config/

USER $USER

ENTRYPOINT [".config/entrypoint.sh"]

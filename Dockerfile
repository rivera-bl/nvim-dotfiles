FROM alpine:3.16

ENV USER=vim

RUN apk add neovim tmux \
            git curl \
            cmake make build-base libstdc++ \
            npm nodejs yarn \
            sudo && \
            addgroup -S $USER && adduser -S $USER -G $USER && \
            echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/$USER && \
            adduser $USER wheel

COPY --chown=vim:vim . /home/vim/.config/nvim/ 
RUN chown -R $USER:$USER /home/$USER/.config/

USER vim
WORKDIR /home/vim/.config/nvim/ 

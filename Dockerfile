FROM alpine:3.16

ENV USER=vim

RUN apk add --no-cache \
            neovim tmux zsh fzf zsh-vcs zsh-syntax-highlighting zsh-autosuggestions \
            git curl xclip xauth \
            cmake make build-base libstdc++ perl \
            bash ninja yarn npm \
            terraform openssh lazygit \
            sudo && \
            adduser -D $USER && \
            echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER && \
            chmod 0440 /etc/sudoers.d/$USER && \
            mkdir -p /home/$USER/.config && chown -R $USER:$USER /home/$USER/.config

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && rm kubectl

RUN curl -o /tmp/terraform-ls.zip https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_386.zip && \
    unzip /tmp/terraform-ls.zip -d /usr/local/bin

ARG GLIBC_VERSION=2.34-r0
ARG AWSCLI_VERSION=2.7.9

# install glibc compatibility for alpine
# https://stackoverflow.com/questions/60298619/awscli-version-2-on-alpine-linux
# TODO: use as multi stage build
RUN apk --no-cache add \
        binutils \
        curl \
    && curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk \
    && apk add --no-cache \
        glibc-${GLIBC_VERSION}.apk \
        glibc-bin-${GLIBC_VERSION}.apk \
        glibc-i18n-${GLIBC_VERSION}.apk \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWSCLI_VERSION}.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/current/dist/aws_completer \
        /usr/local/aws-cli/v2/current/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/current/dist/awscli/examples \
        glibc-*.apk \
    && find /usr/local/aws-cli/v2/current/dist/awscli/botocore/data -name examples-1.json -delete \
    && apk --no-cache del \
        binutils \
        curl \
        groff \
    && rm -rf /var/cache/apk/*

# docker
RUN apk add --update docker openrc && \
    rc-update add docker boot && \
    addgroup $USER docker

WORKDIR /home/$USER

COPY --chown=$USER:$USER . .config/

USER $USER

EXPOSE 22

ENTRYPOINT [".config/entrypoint.sh"]

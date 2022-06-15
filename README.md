# VAGRANT

vagrant up
vagrant ssh
vagrant destroy
vagrant box list
vagrant box remove

* Running our dev environment as a container on windows on top of wsl hasn't been so comfortable, feels heavy and clunky, so we are trying with a vm now

# BUILDING AS A DOCKER CONTAINER

alpine:1.16
only with neovim installed the image is of 25mb

## USAGE

* LOCAL

1. docker build -t neovim-test .
2. docker run --name neovim-test -ti --rm neovim-test
3. export PATH="$HOME/.local:$PATH"
3. nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
4. nvim

* AUTOMATED

- Made an action that builds and pushes the image to Dockerhub
- Get it with: docker pull riverablo/neovim:latest

## NOTES

- To install telescope-fzf-native we need to intall `CMake, make, and GCC`
- Got to a working Image with native nvim-lspconfig and nvim-cmp with the yamlls kubernetes schema.
  - The size is of 300MB. With coc.nvim it was 472MB

## TODO

- [x] setup the pipeline in github actions for building the container and pushing to dockerhub
- [x] add the repository contents to the image and they work good
- [x] excluir del checkout o del COPY el .git folder
- [x] solve how to add coc-extensions
- [x] minimize image size
    - did what we can
- [x] add vim user to sudoers
- [x] add tmux
- [x] add tmux config
- [x] install packer plugins as part of the workflow, entrypoint?
    - nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"
- [x] try nvim LSP to get rid of coc.nvim
    - have to create a kubernetes folder to get k8 suggestions
- [x] add zsh shell
- [x] add set -o vi
- [x] alias para vi=nvim
- [x] create a repo for our dev env ide, with zsh, tmux and nvim
- [ ] build fzf from source

- [x] create docker compose to mount volumes
- [ ] solve posible performance issues by running on docker
    - lsp feels slow to start
- [ ] get lua to work, it works when installing manually but not through lsp-installer
- [ ] get colors?

## BUILDING AS A DOCKER CONTAINER

alpine:1.16
only with neovim installed the image is of 25mb

## USAGE

* LOCAL

1. docker build -t neovim-test .
2. docker run --name neovim-test -ti --rm neovim-test sh
3. nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"
4. nvim

* AUTOMATED

- Made an action that builds and pushes the image to Dockerhub
- Get it with: docker pull riverablo/neovim:latest

## NOTES

- To install telescope-fzf-native we need to intall `CMake, make, and GCC`

## TODO

- [x] setup the pipeline in github actions for building the container and pushing to dockerhub
- [x] add the repository contents to the image and they work good
- [x] excluir del checkout o del COPY el .git folder
- [x] solve how to add coc-extensions
- [x] minimize image size
    - did what we can
- [x] add vim user to sudoers
- [x] add tmux
- [ ] add tmux config
- [ ] create docker compose to mount volumes

- [ ] install packer plugins as part of the workflow, entrypoint?
    - nvim -c "autocmd User PackerComplete quitall" -c "PackerSync"
- [ ] try nvim LSP to get rid of coc.nvim
    - have to create a kubernetes folder to get k8 suggestions
- [ ] add zsh shell
- [ ] add set -o vi
- [ ] alias para vi=nvim
- [ ] create a repo for our dev env ide, with zsh, tmux and nvim

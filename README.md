# History

* Despite having built a vm with Vagrant, I've realized that, until I begin to use Nixos, the simplest way to replicate my dev environment in a windows machine, is using a docker container. Virtualbox interface is clunky, using ssh in Windows requires Putty, and Cygwin is not linux. WSL2 which was the closest solution to running Linux on windows, has problems for port-forwarding when using Cisco anyconnect VPN. Finally docker desktop drops you into the console of your container in one click, and port forwarding with DinD should be easy.
* Finally, ctrl-space doesn't work on windows. So we can't use our default mapping for fish-like suggestions on zsh, and autocomplete trigger on neovim. This shows how messy it is to create a development environment even when it is vaguely connected to the windows ecosystem. The only bulletproof solution I can think of is to create a nixos machine an run in virtualization.

# DOCKER

alpine:1.16
only with neovim installed the image is of 25mb

## USAGE

* LOCAL

1. docker build -t neovim-test .
2. docker run --name neovim-test -ti -v "/var/run/docker.sock:/var/run/docker.sock:rw" --rm neovim-test
3. export PATH="$HOME/.local:$PATH"
3. nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
4. nvim

* AUTOMATED

- Made an action that builds and pushes the image to Dockerhub
- Get it with: docker pull riverablo/neovim:latest

docker run --name editor \
           -v "/var/run/docker.sock:/var/run/docker.sock:rw" \
           -v "editor:/home/vim/.config" \
           -v "C:/Users/cma0564/posregional-dev:/home/vim/posregional-dev" \
           -p 22:22 \
           riverablo/neovim:latest

## NOTES

- To install telescope-fzf-native we need to intall `CMake, make, and GCC`
- Got to a working Image with native nvim-lspconfig and nvim-cmp with the yamlls kubernetes schema.
  - The size is of 300MB. With coc.nvim it was 472MB

https://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-to-run-graphics-applications-remotely

## TODO

- [ ] use docker multi stage builds to minimize the size of the image, start with the awscli build
- [ ] build fzf from source
- [ ] solve posible performance issues by running on docker
    - lsp feels slow to start

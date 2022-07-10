# ABSTRACT

* Despite having built a vm with Vagrant, I've realized that, until I begin to use Nixos, the simplest way to replicate my dev environment in a windows machine, is using a docker container. Virtualbox interface is clunky, using ssh in Windows requires Putty, and Cygwin is not linux. WSL2 which was the closest solution to running Linux on windows, has problems for port-forwarding when using Cisco anyconnect VPN. Finally docker desktop drops you into the console of your container in one click, and port forwarding with DinD should be easy.
* Finally, ctrl-space doesn't work on windows. So we can't use our default mapping for fish-like suggestions on zsh, and autocomplete trigger on neovim. This shows how messy it is to create a development environment even when it is vaguely connected to the windows ecosystem. The only bulletproof solution I can think of is to create a nixos machine an run in virtualization.

# VAGRANT

* Running our dev environment as a container on windows on top of wsl hasn't been so comfortable, feels heavy and clunky, so we are trying with a vm now

## BASE COMMANDS

vagrant provision   -> exec the provisioners
vagrant up          -> gets the base box running and provisions
vagrant ssh         -> connects to the box
vagrant destroy
vagrant box list
vagrant box remove

* If the build of the box fails, run `provision` instead of `up`
* vagrant provision --provision-with shell
* du -h ~/.vagrant.d/boxes

## EXPORT

* Useful commands if the `package` fails
vboxmanage list vms
vboxmanage unregistervm <vm-name> –delete
pkill -f /usr/lib/virtualbox/VBoxHeadless
vagrant global-status --prune

* Export as a vm (this poweroffs the machine so we have to run vagrant up again if we want to ssh to it)
`vagrant package $(va status --machine-readable | head -n 1 | awk -F ',' '{print $2}') --output <vm-name>.tar.gz`

## COPY/PASTE

* In order to copy to clipboard from host to server, and viceversa, through an ssh connection:

host and server has to have installed `xauth` and `xclip`

host machine has to have  in `~/.ssh/config`
```
ForwardX11Trusted yes
ForwardX11 yes
```

server machine has to have in `/etc/ssh/sshd_config`
```
X11Forwarding yes
```

https://unix.stackexchange.com/questions/12755/how-to-forward-x-over-ssh-to-run-graphics-applications-remotely

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

## TODO

- [ ] creat a nixos machine with vagrant

- [x] build vagrant box from alpine box
- [x] install
    - [x] xclip (or similar)

- [x] setup main programs on docker alpine (awscli, kubectl)
- [x] enable services on docker alpine
- [x] enable usage of docker socket on docker alpine
- [x] setup command to mount volumes when running docker alpine
- [ ] manage folder structure of programs,docker,vagrant
- [ ] use docker multi stage builds to minimize the size of the image, start with the awscli build
- [x] install openssh in docker and test its usage

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

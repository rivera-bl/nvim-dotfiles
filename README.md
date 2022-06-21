# PACKER

* We are going to use Packer to build the base box of Vagrant

packer init -> installs the `required_plugins`

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

- [x] build vagrant box from alpine box
- [x] install
    - [x] xclip (or similar)
- [ ] install 256 colors terminal
- [ ] change keyboard language
- [ ] swap esc keys

- [ ] manage folder structure of programs,docker,vagrant
- [ ] share folder from host on vagrant
- [ ] check how to run this box fast and consistently on windows
    - [ ] write a bootstrap script

- [ ] vagrant box built with packer (hcl)
  - [ ] check cannot find guest additions
  - [ ] virtualbox start automatically as part of the build process?
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

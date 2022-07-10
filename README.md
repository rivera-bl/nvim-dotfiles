# ABSTRACT

* Despite having built a vm with Vagrant, I've realized that, until I begin to use Nixos, the simplest way to replicate my dev environment in a windows machine, is using a docker container. Virtualbox interface is clunky, using ssh in Windows requires Putty, and Cygwin is not linux. WSL2 which was the closest solution to running Linux on windows, has problems for port-forwarding when using Cisco anyconnect VPN. Finally docker desktop drops you into the console of your container in one click, and port forwarding with DinD should be easy.
* Finally, ctrl-space doesn't work on windows. So we can't use our default mapping for fish-like suggestions on zsh, and autocomplete trigger on neovim. This shows how messy it is to create a development environment even when it is vaguely connected to the windows ecosystem. The only bulletproof solution I can think of is to create a nixos machine an run in virtualization.

# Quickstart

```
vagrant up
vagrant ssh
```

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

## TODO

- [ ] use docker multi stage builds to minimize the size of the image, start with the awscli build
- [ ] build fzf from source
- [ ] solve posible performance issues by running on docker
    - lsp feels slow to start

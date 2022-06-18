Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine316"
  config.vm.box_version = "4.0.2"
  config.vm.hostname = "editor"
  # name that vagrants uses to define the box, replaces 'default'
  config.vm.define "editor"

  config.vm.provider :virtualbox do |vb|
      vb.name = "editor"
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "file", source: "nvim", destination: "$HOME/.config/nvim"
  config.vm.provision "file", source: "tmux", destination: "$HOME/.config/tmux"
  config.vm.provision "file", source: "zsh", destination: "$HOME/.config/zsh"
  config.vm.provision "file", source: "fzf", destination: "$HOME/.config/fzf"

  config.vm.provision "shell", path: "install.sh"

  # # not working, gotta run it manually once in the box
  # config.vm.provision "shell",
  #   inline: "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' ; true"
end

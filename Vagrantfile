Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine316"
  config.vm.box_version = "4.0.2"
  config.vm.hostname = "editor"
  # name that vagrants uses to define the box, replaces 'default'
  config.vm.define "editor"

  if Vagrant.has_plugin?("vagrant-vbguest") then
        config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |vb|
      vb.name = "editor"
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "file", source: "nvim", destination: "$HOME/.config/nvim"
  config.vm.provision "file", source: "tmux", destination: "$HOME/.config/tmux"
  config.vm.provision "file", source: "zsh", destination: "$HOME/.config/zsh"
  config.vm.provision "file", source: "fzf", destination: "$HOME/.config/fzf"
  config.vm.provision "file", source: "st", destination: "$HOME/.config/st"

  config.vm.provision "shell", path: "install.sh"

  # config.vm.provision "shell", inline: "setxkbmap latam"

  # # not working, gotta run it manually once in the box
  # config.vm.provision "shell",
  #   inline: "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' ; true"
end

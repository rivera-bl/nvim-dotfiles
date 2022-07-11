# console-driven DE

## Neovim

## What works

We can use a single lua config file in `configuration.nix`

```
programs.neovim.enable = true;
programs.neovim.configure = {
  customRC= "
  luafile ~/init.lua
  ";
};
```

### Issues

- Apparently `"lua require('init')"` doesn't work due to something related with the [lua 
    runtime][1].

- When configuring nvim in `configuration.nix` with `XDG_CONFIG_HOME` files, it doesn't 
    run the same nvim of `programs.neovim.viAlias`, because with `nvim` it gets the 
    configuration of XDG_CONFIG_HOME, but not with `vi`. While when configuring 
    from `programs.neovim.configure` only `vi` gets the configuration. 
    - apparently theres a difference between nix aliases and shell aliases?

- If putting all lua config files inside of a single `init.lua` we can't keep this
    functionality (thanks to this we can install `headless`)

```lua
-- so nvim doesnt break on first start up before PackerInstall
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
```

## TODO

- [ ] do install/configuration with: plugins -> nix, config -> lua
  - [ ] watch this [setup example][4] and implement it without nix2vim
      - [ ] copy his indenline configs
  - [ ] install plugins via nix code?
      - what happens to lazy loading when not using packer?
      - how is the plugin `setup()` writen?
  - [ ] settings and mappings managed by `.lua` files to do fast changes

## Resources

[1]: https://nixos.wiki/wiki/Neovim
[2]: https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
[3]: https://www.reddit.com/r/NixOS/comments/ucgxv8/neovim_unstable/i6awssm/
[4]: https://www.youtube.com/watch?v=iwsoF9ISfaw
[5]: https://github.com/DieracDelta/vimconf_talk/tree/0_initial_flake
[6]: https://github.com/malob/nixpkgs/blob/master/home/neovim.nix#L38

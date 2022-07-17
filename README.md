# console-driven DE

## Neovim

Build Neovim with plugins using nix flakes, but pass the settings/mappings as luafile

## Plugins

### Exploring <nixpkgs> source & documentation

- The source code can be the best documentation, much of the functions and the pkgs usage are documented. Here is a list of files that I find useful to customize plugins for the `neovim` pkg.

#### nixpkgs/doc/languages-frameworks/vim.section.md

- This file contains:
    - How to add your own plugins
    - How to manage `treesitter`
    - Explanation of how the `.nix` code for plugins is generated
    - Notes on how to add vim plugins to `nixpkgs`

- The recommended way of managing the plugins is with `Vim packages`. See `:help packages`.

#### pkgs/applications/editors/vim/plugins/generated.nix

- Here we can get the list of vim plugins available in `nix`
- The pkg name is the name we have to reference in `packages.plugins.start [ ];`

#### nixpkgs/pkgs/top-level/all-packages.nix

```nix
vimPlugins = recurseIntoAttrs (callPackage ../applications/editors/vim/plugins {
  llvmPackages = llvmPackages_6;
  luaPackages = lua51Packages;
});
```

#### nixpkgs/pkgs/development/tools/parsing/tree-sitter/grammars

- Inside of this folder we can find all grammars available for `treesitter`

### myPlugins

- Check `plugins.nix`

- Plugins missing from nix:
  - williamboman/nvim-lsp-installer
  - ton/vim-bufsurf

## What works

- Can use a lua config file in `configuration.nix`

```nix
programs.neovim.enable = true;
programs.neovim.configure = {
  customRC= "
  luafile ~/init.lua
  ";
};
```

- Can also use multiple lua files

```nix
...
  customRC = ''
    lua << EOF
      ${builtins.readFile ./lua/settings.lua}
      ${builtins.readFile ./lua/mappings.lua}
    EOF
  '';
```

- It isn't necessary to use an Overlay, since the `neovim` pkg has `override` available

## Usage

### Container

```
nix build .#image
docker load < result
docker run -ti --rm nvim-flake
```

## Examples

### Vimconf

[Nice example][5]

- Contains a full pledged solution step by step
  - But uses `prev: final:` instead of `final: prev` like the [documentation][7]

### yaymukund's

- Nice [example][10] using multiple lua files with `neovim.override` instead of overlays

### Others

- Claims to be a [simple flake][9] to build neovim, we just add the plugins and the init.vim

### Issues

- Apparently `"lua require('init')"` doesn't work due to something related with the [lua 
    runtime][1].

```lua
-- so nvim doesnt break on first start up before PackerInstall
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end
```

- not loading `lua/telescope_lua.lua` functions when called from `mappings.lua`
  - it only loads those from `telescope.builtin`
  - ugly fix by moving the functions to the `mappings.lua` file

- When configuring nvim in `configuration.nix` with `XDG_CONFIG_HOME` files, it doesn't 
    run the same nvim of `programs.neovim.viAlias`, because with `nvim` it gets the 
    configuration of XDG_CONFIG_HOME, but not with `vi`. While when configuring 
    from `programs.neovim.configure` only `vi` gets the configuration. 
    - apparently theres a difference between nix aliases and shell aliases?

- The `nixos-22.05` branch has the `v0.7.0` while `master` has the `v0.7.2` which is the latest stable release

#### nvim-lsp-installer

- Was getting this error when trying to build the `nvim-lsp-installer` plugin
```
error: builder for '/nix/store/alc9ngf1hdn2j8lnlrsgh40krn8w67xd-vimplugin-nvim-lsp-installer-v0.1.drv' failed with exit code 2;
       last 10 log lines:
       > unpacking source archive /nix/store/wjgw6wdpd0j6lamcxj8x8c9k8gagjc1c-source
       > source root is source
       > patching sources
       > configuring
       > no configure script, doing nothing
       > building
       > build flags: SHELL=/nix/store/iffl6dlplhv22i2xy7n1w51a5r631kmi-bash-5.1-p16/bin/bash
       > git clone --depth 1 https://github.com/nvim-lua/plenary.nvim dependencies/pack/vendor/start/plenary.nvim
       > /nix/store/iffl6dlplhv22i2xy7n1w51a5r631kmi-bash-5.1-p16/bin/bash: line 1: git: command not found
       > make: *** [Makefile:5: dependencies] Error 127
```
- Solved it by adding 
```
dontBuild = true;
dontCheck = true;
```
- Nonetheless its pointless to install the LSs this way, besided I was getting a bunch of error still when `nvim-lsp-installer` started to do the automatic installs


## TODO

- [x] install vimplugins available on nixpkgs and place them on a different file
  - [x] install treesitter languages
  - [x] build BufSurf plugin from source like [this][11]
  - [ ] solve lsp servers since nvim-lsp-installer plugin is not available
      - [x] may try to add the plugin like with BufSurf
         - but whats the point if I won't have them bundled with neovim, should I tho?
  - [x] solve telescope functions load
    - [ ] format mappings calls using functions and loops
  - [ ] manage plugins with flakes so we can pin the versions
- [ ] add all the configuration files
  - [ ] ?function to read recursively all the config files
- [ ] structure README's,
  - one for each package and one for the main project
- [ ] track our built package on the system wide configuration of nixos

- [x] add a buildImage
- [ ] ?add a nix shell to test
- [ ] ?how to manage snippets
- [x] ?where to get the full list of arguments that the pkgs.vimPlugins provides

## Resources

[1]: https://nixos.wiki/wiki/Neovim
[2]: https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
[3]: https://www.reddit.com/r/NixOS/comments/ucgxv8/neovim_unstable/i6awssm/
[4]: https://www.youtube.com/watch?v=iwsoF9ISfaw
[5]: https://github.com/DieracDelta/vimconf_talk/tree/0_initial_flake
[6]: https://github.com/malob/nixpkgs/blob/master/home/neovim.nix#L38
[7]: https://nixos.wiki/wiki/Overlays
[8]: https://ryantm.github.io/nixpkgs/using/overlays/
[9]: https://github.com/Quoteme/neovim-flake
[10]: https://git.sr.ht/~yaymukund/dotfiles/tree/main/item/common/neovim
[11]: https://framagit.org/vegaelle/nix-nvim/-/blob/main/plugins.nix

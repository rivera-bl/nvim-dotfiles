{
  description = "Neovim Flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages = {
        defaultPackage = with pkgs;
          neovim.override {
            vimAlias = true;
            viAlias = true;
            configure = {
              packages.my-plugins = with pkgs.vimPlugins; {
                start = [
                  nvim-telescope
                  nvim-lspconfig
                ];
                opt = [];
              };

              customRC = ''
                lua << EOF
                  ${builtins.readFile} ./lua/settings.lua
                EOF
              '';
            };
          };
      };
    });
}

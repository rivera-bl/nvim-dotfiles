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
      packages.default = with pkgs;
        neovim.override {
          vimAlias = true;
          viAlias = true;
          configure = {
            packages.myPlugins = with pkgs.vimPlugins; {
              start = (import ./plugins.nix pkgs).myPlugins;
              opt = [];
            };

            customRC = ''
              lua << EOF
                ${builtins.readFile ./lua/settings.lua}
                ${builtins.readFile ./lua/mappings.lua}
              EOF
            '';
          };
        };

      packages.image = pkgs.dockerTools.buildLayeredImage {
        name = "nvim-flake";
        tag = "latest";
        contents = [self.packages.${system}.default];

        config = {
          Cmd = ["/bin/nvim"];
          WorkingDir = "/";
        };
      };

      ## nixosModule = {config, ...}: {
      ##   environment.variables.EDITOR = "nvim";
      ##   environment.shellAliases = {more = "nvim -";};
      ##   environment.systemPackages = [self.defaultPackage."${system}"];
      ## };
    });
}

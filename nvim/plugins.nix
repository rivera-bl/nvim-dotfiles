{
  pkgs,
  lib,
  ...
}: {
  myPlugins = with pkgs.vimPlugins; [
    # completion:
    nvim-cmp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-nvim-lsp
    cmp_luasnip
    # snippets:
    luasnip
    vim-snippets
    # lsp:
    nvim-lspconfig
    # highlight:
    vim-markdown
    vim-terraform
    nvim-colorizer-lua
    # fuzzy search
    popup-nvim
    plenary-nvim
    telescope-nvim
    telescope-fzf-native-nvim
    # looks:
    nvim-web-devicons
    lualine-nvim
    colorbuddy-nvim #?
    # functions:
    tabular
    vim-wordmotion
    vim-commentary
    vim-eunuch
    vim-obsession
    auto-pairs
    # external:
    zeavim-vim
    lazygit-nvim
    vim-tmux-navigator
    vimux
    vim-bufsurf
    # misc:
    which-key-nvim
    indent-blankline-nvim

    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          tree-sitter-nix
          tree-sitter-bash
          tree-sitter-json
          tree-sitter-yaml
          tree-sitter-go
          tree-sitter-regex
          tree-sitter-dockerfile
          tree-sitter-python
        ]
    ))
  ];
  {
  vim-bufsurf = pkgs.vimUtils.buildVimPlugin rec {
    pname = "vim-bufsurf";
    version = "v0.3";
    src = pkgs.fetchFromGitHub {
      owner = "ton";
      repo = "vim-bufsurf";
      rev = "e6dbc7ad66c7e436e5eb20d304464e378bd7f28c";
      sha256 = "1nmpvnqlw4y2g1ki33nbj74vdnaxnaqshqv3238zxgvps44y3mw5";
    };
    meta.homepage = "https://github.com/ton/vim-bufsurf";
  };
}

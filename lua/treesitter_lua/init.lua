require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "json",
    "yaml",
    "python",
    "go",
    "regex",
  }
}

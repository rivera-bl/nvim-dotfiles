-- :TSInstallInfo lists all the languages available
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
    "dockerfile",
  }
}

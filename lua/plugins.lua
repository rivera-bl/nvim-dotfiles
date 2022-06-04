-- Auto install packer.nvim if not exists
local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd('packadd packer.nvim')
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require("packer").startup(function()
  -- highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "neovim/nvim-lspconfig"
  use "pangloss/vim-javascript"
  use "plasticboy/vim-markdown"
  use "jvirtanen/vim-hcl"
  use "pearofducks/ansible-vim"
  -- shorts
  use "mattn/emmet-vim"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use 'chaoren/vim-wordmotion'              -- treat caps as word delimitiers, and others
  use "jiangmiao/auto-pairs"
  use "KabbAmine/zeavim.vim"
  use "nvim-lua/completion-nvim"
  use "godlygeek/tabular"                   -- line up formatting based on a char, like junegunn/vim-easy-align
  -- telescope
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- devicons
  use "kyazdani42/nvim-web-devicons"        -- telescope devicons
  use 'ryanoasis/vim-devicons'              -- startify devicons
  -- themes
  use 'folke/tokyonight.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'hoob3rt/lualine.nvim'
  use "mhinz/vim-startify"
  -- tmux
  use 'christoomey/vim-tmux-navigator'
  use 'preservim/vimux'
  -- lazygit
  use 'kdheepak/lazygit.nvim'
  -- sessions
  use 'tpope/vim-obsession'
  use { 'ton/vim-bufsurf' }
  -- delete
  use "vimwiki/vimwiki"
end)

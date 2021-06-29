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
  use "mattn/emmet-vim"
  use "tpope/vim-commentary"
  use "vim-airline/vim-airline"
  use "vimwiki/vimwiki"
  use "pangloss/vim-javascript"
  use "plasticboy/vim-markdown"
  use "Yggdroot/indentLine"
  use "jvirtanen/vim-hcl"
  use "pearofducks/ansible-vim"
  use "KabbAmine/zeavim.vim"
  use "jkramer/vim-checkbox"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "neovim/nvim-lspconfig"
  -- use "tjdevries/nlua.nvim"
  use "nvim-lua/completion-nvim"
  use "jiangmiao/auto-pairs"
  use "mhinz/vim-startify"
  use "kyazdani42/nvim-web-devicons"
end)

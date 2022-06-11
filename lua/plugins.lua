-- Auto install packer.nvim if not exists
local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- packer as a floating window
require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- completion
  use { 'hrsh7th/nvim-cmp' } -- completion
  use { 'hrsh7th/cmp-buffer' } -- sources
  use { 'hrsh7th/cmp-path' } -- sources
  use { 'hrsh7th/cmp-cmdline' } -- sources
  use { 'hrsh7th/cmp-nvim-lsp' } --  sources
  use { 'saadparwaiz1/cmp_luasnip' } -- sources
  -- snippets
  use { 'L3MON4D3/LuaSnip' } -- snippet engine
  use { 'honza/vim-snippets' } -- snippets
  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }

  -- use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
  use { 'hashivim/vim-terraform' }
  use { 'andrewstuart/vim-kubernetes' }
  use { 'nvim-treesitter/nvim-treesitter' }
  use "pangloss/vim-javascript"
  use "pearofducks/ansible-vim"
  -- shorts
  use "mattn/emmet-vim"
  -- use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-eunuch"
  use 'chaoren/vim-wordmotion'              -- treat caps as word delimitiers, and others
  use "jiangmiao/auto-pairs"
  use "KabbAmine/zeavim.vim"
  use "godlygeek/tabular"                   -- line up formatting based on a char, like junegunn/vim-easy-align
  -- telescope
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use { "nvim-telescope/telescope.nvim" }
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
  -- markdown
  use "plasticboy/vim-markdown"
  -- use "vim-pandoc/vim-pandoc" 
  -- use "vim-pandoc/vim-pandoc-syntax"
  -- "buffers"
  use { 'ton/vim-bufsurf' }
  use { 'folke/which-key.nvim' }
end)


local fn = vim.fn
local execute = vim.api.nvim_command

require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('plugins')

require('mappings')

-- source $HOME/.config/nvim/plug-conf/emmet.vim
-- source $HOME/.config/nvim/plug-conf/vimwiki.vim
-- source $HOME/.config/nvim/plug-conf/bracey.vim
-- source $HOME/.config/nvim/plug-conf/nerdtree.vim
-- source $HOME/.config/nvim/plug-conf/ansible.vim
-- source $HOME/.config/nvim/plug-conf/zeavim.vim

-- vim.g.ayucolor = "dark"
-- vim.cmd('colorscheme ayu')

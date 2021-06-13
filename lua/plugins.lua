-- vim.cmd('packadd packer.nvim')
-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" 

return require("packer").startup(function()
    use "mattn/emmet-vim"
    use "tpope/vim-commentary"
    use "vim-airline/vim-airline"
    use "vimwiki/vimwiki"
    use "pangloss/vim-javascript"
    use "plasticboy/vim-markdown"
    use "ayu-theme/ayu-vim"
    use "Yggdroot/indentLine"
    use "jvirtanen/vim-hcl"
    use "pearofducks/ansible-vim"
    use "KabbAmine/zeavim.vim"
    use "jkramer/vim-checkbox"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
end)

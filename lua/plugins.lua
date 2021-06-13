vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" 

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    use {"mattn/emmet-vim", opt = true}
    use {"tpope/vim-commentary", opt = true}
    use {"vim-airline/vim-airline", opt = true}
    use {"vimwiki/vimwiki", opt = true}
    use {"pangloss/vim-javascript", opt = true}
    use {"plasticboy/vim-markdown", opt = true}
    use {"ayu-theme/ayu-vim", opt = true}
    use {"Yggdroot/indentLine", opt = true}
    use {"jvirtanen/vim-hcl", opt = true}
    use {"pearofducks/ansible-vim", opt = true}
    use {"KabbAmine/zeavim.vim", opt = true}
    use {"jkramer/vim-checkbox", opt = true}
    use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    use {"nvim-telescope/telescope.nvim", opt = true}
end)

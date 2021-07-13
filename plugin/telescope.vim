" lua require("telescope_lua")

" " update any changes in telescope_lua in the current buffer
" nnoremap <leader>v <cmd> lua package.loaded.telescope_lua = nil <CR>:source ~/.config/nvim/init.lua <CR>

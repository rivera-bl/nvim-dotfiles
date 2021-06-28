lua require("telescope_lua")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_commits<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" search dev folder
nnoremap <leader>fd <cmd>lua require('telescope_lua').search_dev()<CR>

" update any changes in telescope_lua in the current buffer
nnoremap <leader>v <cmd> lua package.loaded.telescope_lua = nil <CR>:source ~/.config/nvim/init.lua <CR>

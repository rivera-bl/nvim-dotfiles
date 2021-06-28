lua require("telescope_lua")

nnoremap <leader>fgg  <cmd>Telescope git_files<CR>
nnoremap <leader>fgc <cmd>Telescope git_commits<CR>
nnoremap <leader>fb  <cmd>Telescope buffers<CR>

" search dev folder
nnoremap <leader>ff <cmd>lua require('telescope_lua').search_dev()<CR>

" update any changes in telescope_lua in the current buffer
nnoremap <leader>v <cmd> lua package.loaded.telescope_lua = nil <CR>:source ~/.config/nvim/init.lua <CR>

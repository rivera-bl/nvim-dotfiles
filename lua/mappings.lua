vim.g.mapleader = ","

vim.api.nvim_set_keymap('n',   '<leader>s', ':w<CR>'           	    	  , {noremap = true}) -- Write
vim.api.nvim_set_keymap('n',   '<leader>q', ':q<CR>'			  , {noremap = true}) -- Quit

-- Don't enter Insert mode before inserting multiple lines
vim.api.nvim_set_keymap('n',   'o', 'o<esc>i'			   , {noremap = true})
vim.api.nvim_set_keymap('n',   'O', 'O<esc>i'			   , {noremap = true})

-- Clear the search Highlight with ESC
vim.api.nvim_set_keymap('n',   '<esc>'    , ':noh<return><esc>', {noremap = true, silent = true})

-- Easy moving between splits
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Easy moving between buffers (alternate files)
vim.api.nvim_set_keymap('n', '<C-o>', '<C-^>' ,  {noremap = true, silent = true})

-- Reload .Xresources
vim.api.nvim_set_keymap('n', '<C-x>', ':w! | !xrdb .Xresources <CR><CR>', {silent = true})

-- Add Datetime
vim.api.nvim_set_keymap('n', '<C-d>', 'i<C-R>=strftime("%m-%d-%Y")<CR><Esc>', {silent = true})

-- For replacing every word of the last search
vim.api.nvim_set_keymap('n', '<leader>r', ':%s//', {})

-- Inserts a line break
-- nnoremap <leader>g a<CR><Esc>O
-- Open file on browser
-- nmap <leader>b :w! \| !xdg-open %<CR><CR>
-- " Open NERDTree. t open in new tab, s open in vsplit
-- nnoremap <leader>t :NERDTreeToggle<CR>
-- nnoremap <leader>n :NERDTreeFocus<CR>

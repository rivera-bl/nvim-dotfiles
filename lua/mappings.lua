local config = '$HOME/.config/nvim/init.lua'

vim.g.mapleader = ","

vim.api.nvim_set_keymap('n',   '<leader>s', ':w<CR>'           	    	  , {noremap = true}) -- Write
vim.api.nvim_set_keymap('n',   '<leader>q', ':q<CR>'			  , {noremap = true}) -- Quit
vim.api.nvim_set_keymap('n',   '<leader>v', ':source ' .. config .. '<CR>', {noremap = true}) -- Source

-- Don't enter Insert mode before inserting multiple lines
vim.api.nvim_set_keymap('n',   'o', 'o<esc>i'			   , {noremap = true})
vim.api.nvim_set_keymap('n',   'O', 'O<esc>i'			   , {noremap = true})

-- Clear the search Highlight with ESC
vim.api.nvim_set_keymap( 'n',   '<esc>'    , ':noh<return><esc>', {noremap = true, silent = true})



-- "Reload .Xresources
-- nmap <C-x> :w! \| !xrdb .Xresources %<CR><CR>
-- "Add Datetime
-- nmap <leader>d i<C-R>=strftime("%m-%d-%Y")<CR><Esc>
-- " Inserts a line break
-- nnoremap <leader>g a<CR><Esc>O
-- "Easy moving between splits
-- nnoremap <s-j> <C-w>h
-- nnoremap <s-k> <C-w>l
-- " Tab Management 
-- nnoremap <S-k> :tabnext<CR>
-- nnoremap <S-j> :tabprev<CR>

-- BINDINGS
-- Open file on browser
-- nmap cleader>b :w! \| !xdg-open %<CR><CR>
-- " Open NERDTree. t open in new tab, s open in vsplit
-- nnoremap <leader>t :NERDTreeToggle<CR>
-- nnoremap <leader>n :NERDTreeFocus<CR>
-- "Start FZF
-- " CTRL-T, CTRL-X or CTRL-V open file in new tab, horizontal splits, or in vertical splits respectively
-- nmap <leader>f :FZF /home/rvv/dev/ <CR>
-- 
-- 
-- " for replacing every word of the last search
-- nmap <leader>e :%s//
-- 
-- " Runs the command depending on its filetype
-- autocmd FileType python     nnoremap <buffer> <leader>r :w! \| !python %<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>r :! node %<CR>
-- autocmd FileType go         nnoremap <buffer> <leader>r :GoRun %<CR>
-- 
-- " use <tab> for trigger completion and navigate to the next complete item
-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~ '\s'
-- endfunction
-- 
-- inoremap <silent><expr> <Tab>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<Tab>" :
--       \ coc#refresh()

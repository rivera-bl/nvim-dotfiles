vim.g.mapleader = ","

vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true}) -- Quit

-----------------------------
-- SPLITS
-----------------------------

-- Navigation between splits
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Relocate splits
vim.api.nvim_set_keymap('n', '<C-w>jj', ':wincmd J<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>kk', ':wincmd K<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>hh', ':wincmd H<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>ll', ':wincmd L<CR>', {noremap = true, silent = true})

-----------------------------
-- BUFFERS
-----------------------------

vim.api.nvim_set_keymap('n', '<C-q>'    , ':set confirm | bufdo bw | Startify<CR>', {noremap = true, silent = true}) -- Delete all opened buffers
vim.api.nvim_set_keymap('n', '<leader>a', ':silent! b#<CR>'   , {noremap = true, silent = true}) -- Cycle through last 2 buffers
vim.api.nvim_set_keymap('n', '<leader>d', ':bp | set confirm | bw #<CR>'      , {noremap = true, silent = true}) -- Delete current buffer
vim.api.nvim_set_keymap('n', '<tab>'    , ':bn<CR>'           , {noremap = true, silent = true}) -- Go to next buffer
vim.api.nvim_set_keymap('n', '<S-tab>'  , ':bp<CR>'           , {noremap = true, silent = true}) -- Go to prev buffer

-----------------------------
-- TERMINAL
-----------------------------

-- TODO: fix this mess
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm<CR>', {})  -- toggle terminal
vim.api.nvim_set_keymap('n', '<leader>tj', '<cmd>lua _term_horizontal_toggle()<CR>', {noremap = true, silent = true}) -- toggle horizontal
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>lua _term_vertical_toggle()<CR>'  , {noremap = true, silent = true}) -- toggle vertical
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua _term_float_toggle()<CR>'     , {noremap = true, silent = true}) -- toggle float
vim.cmd([[tnoremap <C-k> <C-\><C-n><C-w>k]])                      -- focus upper split
vim.cmd([[tnoremap <C-h> <C-\><C-n><C-w>h]])                      -- focus left split
vim.cmd([[tnoremap <leader>q <C-d>]])                             -- remove

-----------------------------
-- MISC
-----------------------------

-- Slightly faster indentation
vim.api.nvim_set_keymap('n',   '>', '>>', {noremap = true})
vim.api.nvim_set_keymap('n',   '<', '<<', {noremap = true})

-- Don't enter Insert mode before inserting multiple lines
vim.api.nvim_set_keymap('n',   'o', 'o<esc>i', {noremap = true})
vim.api.nvim_set_keymap('n',   'O', 'O<esc>i', {noremap = true})

-- Clear the search Highlight with ESC
vim.api.nvim_set_keymap('n',   '<esc>'    , ':noh<return><esc>', {noremap = true, silent = true})

-- TODO: Reload .Xresources on save
vim.api.nvim_set_keymap('n', '<C-x>', ':w! | !xrdb .Xresources <CR><CR>', {silent = true})

-- Add Datetime
vim.api.nvim_set_keymap('n', '<C-d>', 'i<C-R>=strftime("%m-%d-%Y")<CR><Esc>', {silent = true})

-- Replace every word of the last search
vim.api.nvim_set_keymap('n', '<leader>r', ':%s//', {})

-- Save the 'wd path' to clipboard
vim.cmd('command! PWD redir @+ | pwd | redir END')

-- Don't yank the string to the unnamed register when using 'c' or 'C' in normal or visual mode
vim.cmd([[noremap c "_c]])
vim.cmd([[noremap C "_C]])

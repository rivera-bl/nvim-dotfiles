vim.g.mapleader = ","

vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true}) -- Quit

-----------------------------
-- SPLITS
-----------------------------

-- Navigation between splits
vim.api.nvim_set_keymap('n', '<S-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-l>', '<C-w>l', {noremap = true, silent = true})

-- Relocate splits (k and h are kinda excesive, could better use those keys)
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd J<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd K<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd H<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd L<CR>', {noremap = true, silent = true})

-----------------------------
-- BUFFERS
-----------------------------

-- vim.api.nvim_set_keymap('n', '<C-q>'    , ':w! | bufdo bw<CR>', {noremap = true, silent = true}) -- Delete all opened buffers
vim.api.nvim_set_keymap('n', '<C-q>'    , ':bufdo bw | Startify<CR>', {noremap = true, silent = true}) -- Delete all opened buffers
vim.api.nvim_set_keymap('n', '<leader>a', ':silent! b#<CR>'   , {noremap = true, silent = true}) -- Cycle through last 2 buffers
vim.api.nvim_set_keymap('n', '<leader>d', ':w! | bw<CR>'      , {noremap = true, silent = true}) -- Delete current buffer
vim.api.nvim_set_keymap('n', '<tab>'    , ':bn<CR>'           , {noremap = true, silent = true}) -- Go to next buffer

-----------------------------
-- TERMINAL
-----------------------------

vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm<CR>', {})  -- toggle
vim.cmd([[tnoremap <C-k> <C-\><C-n><C-w>k]])                      -- focus upper split
vim.cmd([[tnoremap <leader>q <C-d>]])                             -- remove

-----------------------------
-- MISC
-----------------------------

-- Don't enter Insert mode before inserting multiple lines
vim.api.nvim_set_keymap('n',   'o', 'o<esc>i'			   , {noremap = true})
vim.api.nvim_set_keymap('n',   'O', 'O<esc>i'			   , {noremap = true})

-- Clear the search Highlight with ESC
vim.api.nvim_set_keymap('n',   '<esc>'    , ':noh<return><esc>', {noremap = true, silent = true})

-- Reload .Xresources
vim.api.nvim_set_keymap('n', '<C-x>', ':w! | !xrdb .Xresources <CR><CR>', {silent = true})

-- Add Datetime
vim.api.nvim_set_keymap('n', '<C-d>', 'i<C-R>=strftime("%m-%d-%Y")<CR><Esc>', {silent = true})

-- Replace every word of the last search
vim.api.nvim_set_keymap('n', '<leader>r', ':%s//', {})

-- Don't yank the string to the unnamed register when using 'c' or 'C' in normal or visual mode
vim.cmd([[noremap c "_c]])
vim.cmd([[noremap C "_C]])

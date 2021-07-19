vim.g.mapleader = ","

vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true}) -- Write
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true}) -- Quit

-----------------------------
-- SPLITS
-----------------------------

-- Navigation
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- Relocate
vim.api.nvim_set_keymap('n', '<C-w>jj', ':wincmd J<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>kk', ':wincmd K<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>hh', ':wincmd H<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-w>ll', ':wincmd L<CR>', {noremap = true, silent = true})

-----------------------------
-- BUFFERS
-----------------------------

vim.api.nvim_set_keymap('n', '<C-q>'    , ':set confirm | bufdo bw | Startify<CR>', {noremap = true, silent = true}) -- Delete all opened buffers
vim.api.nvim_set_keymap('n', '<leader>a', ':silent! w | b#<CR>'                   , {noremap = true, silent = true}) -- Cycle through last 2 buffers
vim.api.nvim_set_keymap('n', '<leader>d', ':b# | set confirm | bw #<CR>'          , {noremap = true, silent = true}) -- Delete current buffer
-- should use Telescope buffers instead
-- vim.api.nvim_set_keymap('n', '<S-k>'    , ':bn<CR>'                               , {noremap = true, silent = true}) -- Go to next buffer
-- vim.api.nvim_set_keymap('n', '<S-j>'    , ':bp<CR>'                               , {noremap = true, silent = true}) -- Go to prev buffer

-----------------------------
-- TERMINAL
-----------------------------

vim.api.nvim_set_keymap('c', '<C-j>', '<down>'    , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-k>', '<up>'      , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-h>', '<left>'    , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-l>', '<right>'   , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-b>', '<C-left>'  , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-e>', '<C-right>' , {noremap = true})
vim.api.nvim_set_keymap('c', '<C-n>', '<C-f>'     , {noremap = true})

-----------------------------
-- VIMUX
-----------------------------

vim.api.nvim_set_keymap('n', '<leader>tt', ':VimuxPromptCommand<CR><BS>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tg', ':VimuxTogglePane<CR>'       , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tr', ':VimuxRunLastCommand<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tq', ':VimuxCloseRunner<CR>'      , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ti', ':VimuxInterruptRunner<CR>'  , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tz', ':VimuxZoomRunner<CR>'       , {noremap = true})

-----------------------------
-- TELESCOPE
-----------------------------

vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>'  , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fgf', ':Telescope git_files<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fgs', ':Telescope git_status<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fgc', ':Telescope git_commits<CR>' , {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>fd', ':lua require("telescope_lua").search_dev()<CR>'   , {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fv', ':lua require("telescope_lua").search_config()<CR>', {noremap = true})

-----------------------------
-- MISC
-----------------------------

-- Edit file in split in the same directory of current buffer
vim.api.nvim_set_keymap('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', {noremap = true})

-- Save the 'wd path' to clipboard
vim.cmd('command! PWD redir @+ | pwd | redir END')

-- Toggle netrw
vim.api.nvim_set_keymap('n', '<leader>n', ':Lexplore<CR>', {noremap = true, silent = true})

-- Open Startify
vim.api.nvim_set_keymap('n', '<leader>hh', ':Startify<CR>'          , {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>hl', ':vsplit | Startify<CR>' , {noremap = true, silent = true})

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

-- Don't yank the string to the unnamed register when using 'c' or 'C' in normal or visual mode
vim.cmd([[noremap c "_c]])
vim.cmd([[noremap C "_C]])

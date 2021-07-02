-- o  = global
-- wo = local to window
-- bo = local to buffer

-- theme
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.o.termguicolors = true

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
-- TODO: make transparent
-- vim.wo.colorcolumn = '90'

vim.g.shell         = 'zsh'
vim.o.clipboard     = 'unnamedplus'
vim.o.mouse         = 'a'
vim.o.hidden        = true
-- vim.o.cmdheight     = 2
vim.o.wildmode      = 'longest:full,full'     -- bash like shell autocompletion

-- the two bellow highlight the current line number
vim.wo.number       = true 		      -- shows linenumbers
vim.wo.rnu          = true 	        -- shows linenumbers and relative

vim.wo.scrolloff    = 10
vim.o.showmode      = false
vim.o.ruler         = false
vim.wo.cursorline   = true

vim.o.splitright    = true
vim.o.splitbelow    = true
vim.o.gdefault      = true		      -- by default match every ocurrence in a line

vim.bo.smartindent  = true
vim.wo.breakindent  = true          -- continue indenting on next line
vim.wo.linebreak    = true          -- break a line by word not by character
vim.opt.expandtab   = true          -- converts tabs to spaces
vim.opt.tabstop     = 2             -- insert 2 spaces for a tab
vim.opt.shiftwidth  = 2             -- number of space characters for tabs
vim.opt.softtabstop = -1            -- treat tabs as tabs and not spaces when editing

-- Disables automatic commenting on newline:
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Calcurse notes with markdown
vim.cmd('autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown')
vim.cmd('autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown')

-- cursorline only in Insert Mode
vim.cmd('autocmd InsertLeave,InsertEnter * set cul!')       

-- Shows cursorline only in focused window
vim.cmd([[
  augroup CursorLine
      au!
      au VimEnter * setlocal cursorline
      au WinEnter * setlocal cursorline
      au BufWinEnter * setlocal cursorline
      au WinLeave * setlocal nocursorline
  augroup END
]])

-- Load Telescope find_files when opening a dir with vim 
-- vim.cmd('autocmd FileType netrw Telescope find_files')

-- o  = global
-- wo = local to window
-- bo = local to buffer

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
-- TODO: make the highlighting a transparent line
vim.cmd('hi CursorLine term=bold cterm=bold guibg=Grey40')  -- cursorline highlight bold
-- TODO: fix that it switches when opening telescope
vim.cmd('autocmd InsertLeave,InsertEnter * set cul!')       -- cursorline only in Insert Mode

vim.g.shell         = 'zsh'
vim.o.clipboard     = 'unnamedplus'
vim.o.mouse         = 'a'

-- the two bellow highlight the current line number
vim.wo.number       = true 		    -- shows linenumbers
vim.wo.rnu          = true 	        -- shows linenumbers and relative

vim.wo.scrolloff    = 10
vim.o.showmode      = false
vim.o.ruler         = false
vim.wo.cursorline   = true

vim.o.splitright    = true
vim.o.splitbelow    = true
vim.o.gdefault      = true		    -- by default match every ocurrence in a line

vim.bo.smartindent  = true
vim.wo.breakindent  = true          -- continue indenting on next line
vim.wo.linebreak    = true          -- break a line by word not by character
vim.opt.expandtab   = true          -- converts tabs to spaces
vim.opt.tabstop     = 2             -- insert 2 spaces for a tab                                       
vim.opt.shiftwidth  = 2             -- change the number of space characters inserted for indentation
vim.opt.softtabstop = -1            -- treat tabs as tabs and not spaces when editing

-- "Disables automatic commenting on newline:
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- commented cause it's red
-- vim.wo.colorcolumn = '90'

-- "Calcurse notes with markdown
-- autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
-- autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

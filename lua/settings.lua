-- o  = global
-- wo = local to window
-- bo = local to buffer

-- theme
vim.cmd[[colorscheme moonlight]]              -- modified bg (#1d2225), comments (#565f89)
vim.g.moonlight_italic_comments = true
vim.g.moonlight_borders         = true
vim.g.moonlight_contrast        = false

vim.cmd('syntax on')
vim.cmd('filetype plugin on')
vim.cmd('set nofoldenable')

vim.g.shell         = 'zsh'
vim.o.clipboard     = 'unnamedplus'
vim.o.mouse         = 'a'
vim.o.wildmode      = 'longest:full,full'     -- shell autocompletion
vim.o.hidden        = true
vim.o.termguicolors = true

-- the two bellow highlight the current line number
vim.wo.number       = true 		      -- shows linenumbers
vim.wo.rnu          = true 	        -- shows linenumbers and relative

vim.o.scrolloff     = 10
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

-- Hides tilde chars on endofbuffer
vim.cmd("set fillchars=fold:\\ ,vert:\\│,eob:\\ ,msgsep:‾")

-- Disables automatic commenting on newline:
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Calcurse notes with markdown
vim.cmd('autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown')
vim.cmd('autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown')

-- cursorline only in Insert Mode
vim.cmd('autocmd InsertLeave,InsertEnter * set cul!')       
vim.cmd('hi CursorLine guibg=#252e33')

-- Maintain same size of splits when resizing the window
vim.cmd('autocmd VimResized * wincmd =')

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

-- Startify Unmap q key and others
vim.cmd([[autocmd User Startified for key in ['q','s','t','v'] | silent execute 'nunmap <buffer>' key | endfor]])

-- Source tmux config after saving
vim.cmd('autocmd BufWritePost tmux.conf silent !tmux source %')

-- Create .pdf out of current .md file
vim.cmd('autocmd BufWritePost ~/dev/jekyll/codeblog/_posts/*.md silent !mkdir -p /tmp/blog-preview && pandoc %:p -o /tmp/blog-preview/tmp.pdf &')
-- column
-- vim.wo.colorcolumn = '100'
-- vim.cmd('hi ColorColumn guibg=#252e33')

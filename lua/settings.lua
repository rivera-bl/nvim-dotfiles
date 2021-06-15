vim.cmd('syntax on')

vim.g.shell = 'zsh'
vim.o.clipboard = 'unnamedplus'
vim.bo.smartindent = true
vim.o.mouse = "a"
-- the two bellow highlight the current line number
vim.wo.number = true -- this alone shows linenumbers
vim.wo.relativenumber = true -- this alone shows linenumbers and relative
vim.wo.scrolloff = 10
vim.o.showmode = false
vim.o.ruler = false
vim.cmd('filetype plugin on')

-- syntax enable
-- set colorcolumn=80
-- set smartcase
-- set smartindent
-- set breakindent
-- set shiftwidth=4
-- set list
-- set listchars=tab:\|\
-- set tabstop=4 softtabstop=4
-- set expandtab
-- set incsearch
-- set linebreak
-- set nocompatible
-- set viminfo=""
-- set splitright              "Opens vertical split on the right
-- set splitbelow              "Opens horizontal split below
-- set gdefault                "By default match every ocurrence in a line
-- set foldmethod=manual       "Fold manually zf, open/close za, jump zj/k
-- " set foldnestmax=2
-- " set foldlevelstart=1
-- " set foldclose=all
-- " set foldopen=all
-- 
-- " let g:coc_global_extensions = [
-- "     \ 'coc-tsserver',
-- "     \ 'coc-eslint',
-- "     \ ]
-- 
-- let g:go_auto_sameids = 0
-- let g:go_auto_info = 0
-- 
-- "Disables automatic commenting on newline:
-- autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- "Calcurse notes with markdown
-- autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
-- autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown
-- " automatically wraps text at column 92 for markdown files
-- " au FileType markdown, when windows too small it fucks up the vim-airline tho 
-- "     \ setlocal textwidth=0 wrapmargin=0 wrap columns=92 colorcolumn=95
-- 
-- " Save manual folds on file close
-- " augroup remember_folds
-- "   autocmd!
-- "   au BufWinLeave ?* mkview 1
-- "   au BufWinEnter ?* silent! loadview 1
-- " augroup END

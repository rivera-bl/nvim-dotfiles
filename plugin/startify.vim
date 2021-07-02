" sessions are saved in .local/share/nvim/sesion

let g:indentLine_enabled            = 0
let g:startify_enable_special       = 0 "don't show <empty buffer> and <quit>
let g:startify_files_number         = 4
let g:startify_change_to_vcs_root   = 1
let g:startify_update_oldfiles      = 1 "update recent files on the fly not on exit

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent']            },
          \ { 'type': 'bookmarks', 'header': ['   Bookmark']      },
          \ { 'type': 'sessions',  'header': ['   Session']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'vi': '~/.config/nvim' },
            \ { 'ar': '~/.ansible/roles' },
            \ { 'tf': '~/dev/terraform' },
            \ { 'pk': '~/dev/packer' },
            \ { 'od': '~/dev/odilo' },
            \ { 'bl': '~/dev/jekyll/codeblog/_posts' },
            \ { 'td': '~/dev/.todo' },
            \ ]

let g:startify_custom_header = [
          \ '      /\__\          ___        /\__\     ',
          \ '     /:/  /         /\  \      /::|  |    ',
          \ '    /:/  /          \:\  \    /:|:|  |    ',
          \ '   /:/__/  ___      /::\__\  /:/|:|__|__  ', 
          \ '   |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ',
          \ '   |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ',
          \ '   |:|__/:/  /  \::/__/           /:/  /  ',
          \ '    \::::/__/    \:\__\          /:/  /   ',
          \ '     ~~~~         \/__/         /:/  /    ',
          \ '                                \/__/     ',
          \]

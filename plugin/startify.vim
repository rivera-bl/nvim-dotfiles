" sessions are saved in .local/share/nvim/sesion

let g:indentLine_enabled = 0

let g:startify_bookmarks = [
            \ { 'vi': '~/.config/nvim' },
            \ { 'ar': '~/.ansible/roles' },
            \ { 'tf': '~/dev/terraform' },
            \ { 'pk': '~/dev/packer' },
            \ { 'od': '~/dev/odilo' },
            \ { 'bl': '~/dev/jekyll/codeblog/_posts' },
            \ ]

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmark']      },
          \ { 'type': 'files',     'header': ['   Recent']            },
          \ { 'type': 'sessions',  'header': ['   Session']       },
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

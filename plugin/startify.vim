" sessions are saved in .local/share/nvim/sesion

let g:indentLine_enabled            = 0
let g:startify_enable_special       = 0 "don't show <empty buffer> and <quit>
let g:startify_files_number         = 6
let g:startify_change_to_vcs_root   = 1
let g:startify_update_oldfiles      = 1 "update recent files on the fly not on exit
let g:startify_relative_path        = 1 "don't show ~/ on recent files
let g:webdevicons_enable_startify   = 1 

" add vim-devicons to file path
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_skiplist = [
          \ '.*startify\.txt$',
          \ '.*\.gitignore$',
          \ '^/tmp/calcurse-note.*',
          \]

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Session']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmark']      },
          \ { 'type': 'files',     'header': ['   Recent']            },
          \ ]

let g:startify_bookmarks = [
            \ { 'vi': '~/.config/nvim' },
            \ { 'ar': '~/.ansible/roles' },
            \ { 'tf': '~/dev/terraform' },
            \ { 'pk': '~/dev/packer' },
            \ { 'od': '~/dev/odilo' },
            \ { 'bl': '~/dev/jekyll/codeblog/_posts' },
            \ { 'td': '~/dev/.todo.md' },
            \ { 'ql': '~/dev/python/proj/sonrisasql' },
            \ ]

" " Isometric
" let g:startify_custom_header = [
"           \ '      /\__\          ___        /\__\     ',
"           \ '     /:/  /         /\  \      /::|  |    ',
"           \ '    /:/  /          \:\  \    /:|:|  |    ',
"           \ '   /:/__/  ___      /::\__\  /:/|:|__|__  ', 
"           \ '   |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ',
"           \ '   |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ',
"           \ '   |:|__/:/  /  \::/__/           /:/  /  ',
"           \ '    \::::/__/    \:\__\          /:/  /   ',
"           \ '     ~~~~         \/__/         /:/  /    ',
"           \ '                                \/__/     ',
"           \]

" let g:startify_custom_header = [
"           \ '                              ___       ',
"           \ '       ___       ___         /__/\      ',
"           \ '      /__/\     /  /\       |  |::\     ',
"           \ '      \  \:\   /  /:/       |  |:|:\    ',
"           \ '       \  \:\ /__/::\     __|__|:|\:\   ',
"           \ '   ___  \__\:\\__\/\:\__ /__/::::| \:\  ',
"           \ '  /__/\ |  |:|   \  \:\/\\  \:\~~\__\/  ',
"           \ '  \  \:\|  |:|    \__\::/ \  \:\        ',
"           \ '   \  \:\__|:|    /__/:/   \  \:\       ',
"           \ '    \__\::::/     \__\/     \  \:\      ',
"           \ '        ----                 \__\/      ',
"           \]

let g:startify_custom_header = [
          \ '                        %%#                       ',
          \ '     /%%%%%%%%%%%%%%%% *****##  %%%%%%%%%%%%%%%%/ ',
          \ '     @//@%%%%%%%%%//// *******# @//%%%%%%%%%%%%/  ',
          \ '        @%%%%%%%%%// ********** @@%%%%%%%%%%//    ',
          \ '        @%%%%%%%%%// ******** @@%%%%%%%%%%//      ',
          \ '        @%%%%%%%%%// ***** @@/%%%%%%%%%%/         ',
          \ '        @%%%%%%%%%// *** @@%%%%%%%%%%// ##        ',
          \ '      % @%%%%%%%%%//  @@/%%%%%%%%%%/  *****##     ',
          \ '    %%* @%%%%%%%%%//@@%%%%%%%%%%// **********##   ',
          \ ' ,,**** @%%%%%%%%%/@%%%%%%%%%%/  ***************,,',
          \ '    ,,* @%%%%%%%%%%%%%%%%%%// ***************,,   ',
          \ '      , @%%%%%%%%%%%%%%%% %%%**************,,     ',
          \ '        @%%%%%%%%%%%%%%/ ***************,,        ',
          \ '        @%%%%%%%%%%%//  %%% *  %%%%  %%%%%%%%%%   ',
          \ '        @%%%%%%%%%/ ***%%% ** %%%**, %%     %%    ',
          \ '        @%%%%%%// ****%%% ***%%% ,, %%%    %%     ',
          \ '        @%%%%/     ,, %%  ** %%    %%%    %%%     ',
          \ '                     ,,*****,,                    ',
          \ '                        ,,,                       ',
          \]

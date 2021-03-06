scriptencoding utf-8

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_readonly_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_split_rule='rightbelow'
" Restore file when opening vimfiler
let g:vimfiler_restore_alternate_file = 1

let g:vimfiler_time_format = '%d/%m/%y %H:%M'
"
let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']

" call custom vimfiler settings when creating buffer
au! FileType vimfiler call s:my_vimfiler_settings()

function! s:my_vimfiler_settings()
    setlocal nobuflisted
    setlocal nolist
    setlocal listchars=

    " Use enter to toggle tree + open files
    nmap <buffer><expr> <Cr> vimfiler#smart_cursor_map(
                \ "\<Plug>(vimfiler_expand_tree)",
                \ "\<Plug>(vimfiler_edit_file)")

    " Only close buffer, not whole window
    nmap q <buffer> <Plug>(vimfiler_close)
endfunction

command! -nargs=* VimFiler :silent! packadd vimfiler.vim | VimFiler
command! -nargs=* VimFilerExplorer :silent! packadd vimfiler.vim | VimFilerExplorer

nnoremap <silent> <leader>f :VimFilerExplorer -find -parent<CR>


let g:tern_show_signature_in_pum=1
let g:tern_path = functions#trim(system('which tern'))
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue',
      \ ]
if g:tern_path !=# 'tern not found'
  let g:deoplete#sources#ternjs#tern_bin = g:tern_path
endif



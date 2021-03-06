if has('termguicolors')
  set termguicolors
end

augroup MyCustomColors
  autocmd!
  autocmd ColorScheme * hi! Tabline cterm=NONE gui=NONE
        \| hi! TablineFill cterm=NONE gui=NONE
        \| hi! TablineSel cterm=reverse gui=reverse
        \| hi! Comment cterm=italic gui=italic
        \| hi! link Conceal NonText
        \| hi! clear SignColumn

  autocmd ColorScheme plain execute printf('hi! LineNr gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('VisualNOS'),'bg', 'gui'), synIDattr(hlID('VisualNOS'),'bg', 'cterm'))

  autocmd ColorScheme codedark,plain hi! link StartifyHeader Normal
        \| hi! link StartifyFile Directory
        \| hi! link StartifyPath LineNr
        \| hi! link StartifySlash StartifyPath
        \| hi! link StartifyBracket StartifyPath
        \| hi! link StartifyNumber Title
        \| hi! link Error ErrorMsg
        \| hi! link ALEError ErrorMsg
        \| hi! link ALEErrorSign ErrorMsg
        \| hi! link ALEWarning DiffChange
        \| hi! link ALEWarningSign DiffChange

  " StatusLine
  autocmd ColorScheme * execute printf('hi! User4 gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('NonText'),'fg', 'gui'), synIDattr(hlID('NonText'),'fg', 'cterm'))
        \| execute 'hi! User5 ctermfg=red guifg=red'
        \| execute 'hi! User7 ctermfg=cyan guifg=cyan'
        \| execute printf('hi! StatusLine gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('Identifier'),'fg', 'gui'), synIDattr(hlID('Identifier'),'fg', 'cterm'))
        \| execute printf('hi! StatusLineNC gui=italic cterm=italic guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('NonText'),'fg', 'gui'), synIDattr(hlID('NonText'),'fg', 'cterm'))

  autocmd ColorScheme gruvbox execute printf('hi! User4 gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('GruvboxBg2'),'fg', 'gui'), synIDattr(hlID('GruvboxBg2'),'fg', 'cterm'))
        \| execute printf('hi! StatusLineNC gui=italic cterm=italic guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', synIDattr(hlID('GruvboxBg2'),'fg', 'gui'), synIDattr(hlID('GruvboxBg2'),'fg', 'cterm'))
augroup END

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_italicize_comments=1
let g:one_allow_italics = 1

let s:hour = strftime('%H')
let s:month = strftime('%m')
let s:summerNight = (s:month >= 4 && s:month < 10) && (s:hour <= 21 && s:hour > 7)
let s:winterNight = s:hour <= 18 && s:hour > 8
set background=dark

if s:summerNight || s:winterNight
  try
    colorscheme plain
  catch
  endtry
else
  try
    colorscheme plain
  catch
  endtry
endif

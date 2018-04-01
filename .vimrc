set number

" set tabs to have 4 spaces
set ts=4 sw=4 sts=4 et

" auto indent
set autoindent

" set cursorline

set smartindent
set expandtab
set showmatch


set background=dark
set cindent
set cursorline

" Non invasive highlight
hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE

" Auto complete brackets 
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


let python_hightlight_all = 1



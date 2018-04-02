set number

" set tabs to have 4 spaces
set ts=4 sw=4 sts=4 et

" auto indent
set autoindent
let mapleader = ","
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" set cursorline

set expandtab
set showmatch
" Smart indent!
set breakindent
set background=dark
set cindent
set cursorline
set hlsearch
" Non invasive highlight
hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE

" Auto complete brackets 
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       execute 'normal! g`"zvzz' |
        \ endif
augroup END

" When useing search, the screen would always center on the current word
nnoremap n nzzzv
nnoremap N Nzzzv
let python_hightlight_all = 1



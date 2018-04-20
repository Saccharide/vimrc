
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @title            .vimrc
" @description      Personal vimrc file
" @author           sachharide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set ts=4 sw=4 sts=4 et
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent configs
set autoindent
set breakindent
set cindent
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader configs
let mapleader = ","
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Non invasive cursor highlight
set showmatch
set cursorline
set hlsearch
hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto complete brackets 
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       execute 'normal! g`"zvzz' |
        \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The screen would always center on the current word
nnoremap n nzzzv
nnoremap N Nzzzv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make comment italic
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap j to k
" Maybe this is not a good idea, but it seems more inutive
" nnoremap j k
" nnoremap k j

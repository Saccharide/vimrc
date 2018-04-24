

execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @title            .vimrc
" @description      Personal vimrc file
" @author           sachharide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set relative and absolute number
set number rnu 

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set ts=4 sw=4 sts=4 et
set expandtab
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent configs
set autoindent
set breakindent
set cindent
" filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader configs
let mapleader = ","
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Non invasive cursor highlight
set showmatch
set cursorline
set hlsearch

" Fixed the value of ctermbg, xterm256color take a 3 digit value
hi CursorLine cterm=NONE ctermbg=238 ctermfg=NONE

" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

highlight Normal ctermbg=black

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
nmap     G Gzz
nmap     } }zz
nmap     } {zz

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAINING 
no <up> <Nop> 
no <down> <Nop> 
no <left> <Nop> 
no <right> <Nop> 

ino <up> <Nop> 
ino <down> <Nop> 
ino <left> <Nop> 
ino <right> <Nop> 


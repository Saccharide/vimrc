

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
" Mapping <ctrl> h,j,k,l to move between panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no one types jj, so you can use it to exit insert!
inoremap jj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapped to easily move around normal view
nnoremap ; :
nnoremap : ;

nnoremap : <End>
nnoremap ` <Home>h 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Centers the screen whenever I jump to another line
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

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


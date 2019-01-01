""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @title            .vimrc
" @description      Personal vimrc file
" @author           Saccharide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment Setup
execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible
set background=dark
set title
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatical save before running a command
set autowrite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set relative and absolute number
set number rnu 
set ruler 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set ts=4 sw=4 sts=4 et
set expandtab
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent configs
" Maintain exisiting indentation
set autoindent
set smartindent
" set breakindent
" Maintain indentation for warpped line
set cindent
" filetype indent on
" FIXES auto dedent when commenting with smartindent
inoremap # X#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader configs
let mapleader = ","
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Non invasive cursor highlight
set showmatch
set cursorline
set hlsearch
" Incremental search
set incsearch 

" Fixed the value of ctermbg, xterm256color take a 3 digit value
hi CursorLine cterm=NONE ctermbg=238 ctermfg=NONE

" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

" highlight Normal ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto complete brackets 
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       execute 'normal! g`"zvzz' |
        \ endif
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The screen would always center on the current word
nnoremap n nzz
nnoremap N Nzz
nmap     G Gzz
nmap     } }zz
nmap     } {zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make comment italic
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping <ctrl> h,j,k,l to move between panels
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Splits below and split right instead of the default
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No one types jj, so you can use it to exit insert!
inoremap jj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map j and k to move to next visual line
noremap j gj
noremap k gk

noremap Y y$
" Select current line! (only characters)
nnoremap vv ^vg_
" gi already moves to last place you exited insert mode
" so we'll map gI to move to last change
nnoremap gI `.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IT WILL CENTER THE SCREEN WHENEVER I MAKE A JUMP!
function! s:Center_JUMP(key)
    return a:key . (v:count > 1 ? 'zz' : '')
endfunction

noremap <silent> <expr> j <sid>Center_JUMP('gj')
noremap <silent> <expr> k <sid>Center_JUMP('gk')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapped to easily move around normal view
nnoremap ; :
nnoremap : $

" Substitute
" nnoremap <C-s> :%s
" nnoremap : <End>
noremap ` ^h 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Centers the screen whenever I jump to another line
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAINING 
no <up> <Nop> 
no <down> <Nop> 
no <left> <Nop> 
no <right> <Nop> 

" In insert mode, map arrow keys to no op, training 
" ino <up> <Nop> 
" ino <down> <Nop> 
" ino <left> <Nop> 
" ino <right> <Nop> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Count Function

let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction

function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction

" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).

set updatetime=1000

augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

" Set statusline, shown here a piece at a time
highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%1*			" Switch to User1 color highlight
set statusline+=%<%F		" file name, cut if needed at start
set statusline+=%M			" modified flag
set statusline+=%y			" file type
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Toggle paste
set pastetoggle=<F2>

" Set Toggle spell check
map <F4> :setlocal spell! spelllang=en_us<CR>

" Set Toggle textwidth
let g:toggleText=0
nnoremap <F3> :call SetTextwidth()<CR>

function! SetTextwidth()
     if g:toggleText == 0
         set textwidth=75
         let g:toggleText=75
         echo g:toggleText
     else
         set textwidth=0
         let g:toggleText=0
         echo g:toggleText
     endif
endfunction

set t_u7=
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @title            .vimrc
" @description      Personal vimrc file
" @author           Saccharide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment Setup
execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000
let g:airline#extensions#clock#auto = 0
function! AirlineInit()
      let g:airline_section_z = airline#section#create(['clock', g:airline_symbols.space, g:airline_section_z])
  endfunction
autocmd User AirlineAfterInit call AirlineInit()
set nocompatible
set background=dark
colorscheme saccharide
let g:airline#extensions#tabline#enabled = 1
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically save before running a command
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
" Maintain existing indentation
set autoindent
set smartindent
" set breakindent
" Maintain indentation for warped line
set cindent
" filetype indent on
" FIXES auto dedent when commenting with smartindent
inoremap # X#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Case insensitive search, smart case will automatically switch to
" case sensitive search when a capitalized letter is in the search
" Smartcase is only active when ignore case is set... 
set ignorecase
set smartcase
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader configs
let mapleader = ","
noremap <silent> <Leader>c :noh<cr>:call clearmatches()<cr>
nnoremap <Leader>q ciw``<Esc>P
nnoremap <Leader>s *N
nnoremap <Leader>w ciW``<Esc>P
noremap <Leader><space> :w<CR>

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
" Auto complete brackets  -- REPLACE THIS WITH AUTO PAIRS! THAT IS MUCH BETTER. no waiting
" inoremap {<cr> {<cr>}<c-o><s-o>
" inoremap [<cr> [<cr>]<c-o><s-o>
" inoremap (<cr> (<cr>)<c-o><s-o>


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

nnoremap * *N
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
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

"map J <C-W>j
map K <C-W>k
map H <C-W>h
map L <C-W>l

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
" noremap $ A
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

noremap <silent> <expr> j <sid>Center_JUMP('j')
noremap <silent> <expr> k <sid>Center_JUMP('k')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapped to easily move around normal view
nnoremap ; :
" nnoremap : $

" Substitute
" nnoremap <C-s> :%s
" nnoremap : <End>
" noremap ` ^h 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Centers the screen whenever I jump to another line
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TRAINING 
no <up> gk
no <down> gj
" no <left> <Nop> 
" no <right> <Nop> 

" In insert mode, map arrow keys to no op, training 
ino <up> <C-o>gk
ino <down> <C-o>gj
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
nnoremap <F4> :set spell! spelllang=en_us<CR>

" Set Toggle textwidth
" This allows auto line warp, pretty neat
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto completes a tag using closetag plugin

let b:closetag_html_style=1
source ~/.vim/bundle/closetag/closetag.vim

" function s:CompleteTags()
"   inoremap <buffer> > ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR>
"   inoremap <buffer> ><Leader> >
"   inoremap <buffer> ><CR> ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR><CR><Tab><CR><Up><C-O>$
" endfunction
" autocmd BufRead,BufNewFile *.html,*.js,*.xml call s:CompleteTags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable filetype detection:
filetype on
filetype plugin on
"filetype indent on " file type based indentation COMMENT THIS OUT, it CAUSES LAGS when entering a newline

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END
" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Makes misspelled words visible on the same line!
hi SpellBad cterm=underline

" Indentation shortcuts in normal mode :P
nnoremap <silent> <Tab><Tab> >>
nnoremap <silent> `` <<

" Tabs!!!!
nnoremap <silent> <Leader><Tab> :tabnew<CR>
nnoremap <silent> <Tab>q :tabclose<CR>
nnoremap <silent> <Tab>o :tabonly<CR>
nnoremap <silent> <Tab>s :tabs<CR>
nnoremap <silent> <Tab>l :tabnext<CR>
nnoremap <silent> <Tab>h :tabprevious<CR>
nnoremap <silent> <Tab><Right> :tabnext<CR>
nnoremap <silent> <Tab><Left> :tabprevious<CR>
nnoremap <silent> <Tab>1 :tabnext 1<CR>
nnoremap <silent> <Tab>2 :tabnext 2<CR>
nnoremap <silent> <Tab>3 :tabnext 3<CR>
nnoremap <silent> <Tab>4 :tabnext 4<CR>
nnoremap <silent> <Tab>5 :tabnext 5<CR>
nnoremap <silent> <Tab>6 :tabnext 6<CR>
nnoremap <silent> <Tab>7 :tabnext 7<CR>
nnoremap <silent> <Tab>8 :tabnext 8<CR>
nnoremap <silent> <Tab>9 :tabnext 9<CR>


" Gets rid of 'Thanks for flying vim message'
let &titleold=getcwd()

" Set syntax highlighting for solidity
augroup sol_ft
  au!
  autocmd BufNewFile,BufRead *.sol   set syntax=javascript
augroup END


""" Persistent Undo !
set undofile
set undodir=$HOME/.vimtmp
set undolevels=9999
set history=9999

""" Scroll the page util 3 lines left
set scrolloff=3

""" Set default yank/paste to system clipboard
set clipboard=unnamedplus

""" Aliasing yank to use system clipbaord manually, require to have +clipbobard, `sudo apt install vim-gtk`
" noremap <Leader>y "+y
" noremap <Leader>p "+p

set lazyredraw
set showcmd
set wildmenu

""" Link Windows clipboard when using WSL
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

" Map Control + B to be auto complete prev, had to do this to remove conflict for tmux
inoremap <C-B> <C-P>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  

let g:python_highlight_all = 1


" Black python fixer, use f12 to run black
nnoremap <F12> :Black<CR>
" Uncomment the line below to run black whenever we save the file
" autocmd BufWritePre *.py execute ':Black'

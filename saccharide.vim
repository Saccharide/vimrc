" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2013 May 24

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "saccharide"
hi Normal		guifg=cyan	guibg=black
hi NonText		guifg=yellow guibg=#303030
hi comment		guifg=green
hi constant		guifg=cyan	gui=bold
hi identifier	guifg=cyan	gui=NONE
hi statement	guifg=lightblue	gui=NONE
hi preproc		guifg=Pink2
hi type			guifg=seagreen	gui=bold
hi special		guifg=yellow
hi ErrorMsg		guifg=Black	guibg=Red
hi WarningMsg	guifg=Black	guibg=Green
hi Error		guibg=Red
hi Todo			guifg=Black	guibg=orange
hi Cursor		guibg=#60a060 guifg=#00ff00
hi Search		guibg=darkgray guifg=black gui=bold 
hi IncSearch	gui=NONE guibg=steelblue
hi LineNr		guifg=darkgrey
hi title		guifg=darkgrey
hi ShowMarksHL ctermfg=cyan ctermbg=lightblue cterm=bold guifg=yellow guibg=black  gui=bold
hi StatusLineNC	gui=NONE guifg=lightblue guibg=darkblue
hi StatusLine	gui=bold	guifg=cyan	guibg=blue
hi label		guifg=gold2
hi operator		guifg=orange
hi clear Visual
hi Visual		term=reverse cterm=reverse gui=reverse
hi DiffChange   guibg=darkgreen
hi DiffText		guibg=olivedrab
hi DiffAdd		guibg=slateblue
hi DiffDelete   guibg=coral
hi Folded		guibg=gray30
hi FoldColumn	guibg=gray30 guifg=white
hi cIf0			guifg=gray
hi diffOnly	guifg=red gui=bold



" My addons 
hi String term=underline  cterm=bold ctermfg=magenta  guifg=#ffa0a0
hi Number guifg=#AE81FF ctermfg=141
hi LineNr guifg=#FFFFFF ctermfg=15 guibg=#000000 ctermbg=0 gui=underline
hi special term=bold  cterm=bold ctermfg=red  guifg=Orange
" Really nice blue, # in markdown and code block
hi special ctermfg=12 guifg=#0000ff

" title in markdown
hi Title term=bold  cterm=bold  ctermfg=201 gui=bold  guifg=Magenta

" Statement red and * red in md
hi Statement guifg=#C01414 ctermfg=1 gui=none

hi Function guifg=#A6E22E ctermfg=118 ctermfg=154
" hi Function guifg=#C01414 ctermfg=1 gui=none
"ctermfg=darkcyan
"hi Visual		ctermfg=7		ctermbg=238		cterm=none		guifg=#f6f3e8	guibg=#444444	gui=none
"hi Normal		ctermfg=254		ctermbg=234		cterm=none		guifg=#f6f3e8	guibg=#242424	gui=none

hi VisualNOS    ctermfg=251     ctermbg=236     cterm=none      guifg=#c3c6ca   guibg=#303030   gui=none

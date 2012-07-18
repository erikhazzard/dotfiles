"-------------------------------------------    
set nocompatible
syntax on

"Mouse
set mouse=a
set selectmode=mouse
set et
set sw=4

"Tabs
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
set hls

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"========================================
"UI
"------------------
"Color
set background=dark
"set background=light
colorscheme ir_black
"colorscheme solarized

"Highlights
set cursorline
set incsearch
set linespace=0

"Line numbers
set number
highlight lineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=DarkCyan gui=NONE guibg=NONE
set numberwidth=4

"Status stuff
set laststatus=2

set ruler
set title

"Status displays
set showmode
set showcmd
set showmatch

"Highlight
match ErrorMsg '\%>80v.\+'


"========================================

"========================================
"Indents
set smartindent
set autoindent
filetype indent on
au FileType python source ~/.vim/syntax/python.vim
au FileType css source ~/.vim/syntax/css.vim
au FileType javascript source ~/.vim/syntax/javascript.vim

"Folding
"set foldmethod=indent
"set foldcolumn=2

" Space will toggle folds
nnoremap <space> za

" Set page up pagedown for k /j
nnoremap <C-j> <PageDown>
nnoremap <C-k> <PageUp>

"nnoremap <F6> .!pbcopy<CR><CR>
nmap <F6> :.w !pbcopy<CR><CR>    

"Dictionary lists
set dictionary+=/usr/share/dict/words
"Spellcheck
if version >= 700
	set spl=en spell
	set nospell
endif

"Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste
func! Paste_on_off()
   if g:paste_mode == 0
	  set paste
	  let g:paste_mode = 1
   else
	  set nopaste
	  let g:paste_mode = 0
   endif
   return
endfunc
"}}}
" Paste Mode!  Dang! <F10>
nnoremap <silent> <F5> :call Paste_on_off()<CR>
set pastetoggle=<F5>

"========================================
"Tag list
"------------------
"Map F4 to open tag list
map <F4> :TlistToggle<cr>

"Taglist configuration
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0

"Builds tags libs for the current working directory
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"========================================

"========================================
"Conque Term
"------------------
"Map F2 to open tag list
map <F2> :ConqueTermVSplit bash<cr>
"========================================

"========================================
"File tree
"------------------
"Map F3 to open tag list
map <F3> :NERDTree<cr>
"========================================


"========================================
"If I forget to use sudo vim x, this will save it using sudo
"cmap w!! %!sudo tee > /dev/null %

"Tab completion (for filenames and whatnot)
set wildmenu
set wildmode=list:longest,full

"Remove _ from keyword list
set iskeyword-=_

"========================================
"Save Backups to a Different Location
"   (These directories must be manually created)
""------------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
"set directory=.,$TEMP
"========================================

behave xterm
filetype plugin on
filetype plugin indent on
let g:tex_flavor='latex'

set clipboard=unnamed

"========================================
"Pathogen
call pathogen#infect()

"========================================
"Auto commands
"autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Remember last position in file

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

"========================================
"Coffee script stuff
"Set spaces
au BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab
"Fold by indentation
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

au BufNewFile,BufRead *.less let &filetype='css'
au BufNewFile,BufRead *.server let &filetype='javascript'

"CoffeeScript
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow 5 | redraw!

"Handlebars
au BufRead,BufNewFile *.handlebars,*.hbs set ft=handlebars
"========================================
"Javascript stuff
"   Fold markers
au FileType javascript setlocal foldmethod=marker
au FileType javascript setlocal foldmarker={,}

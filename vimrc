"donot compatible with vi to makesure plugin
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set encoding=utf-8
"let &t_ut=''

"tab settings
"auto input tab as space
set expandtab
"tab width
set tabstop=4
"auto indent space
set shiftwidth=4
"complex.. but can be used to delete 4 tabspace
set softtabstop=4
"make backspace can delete to pre line
set backspace=indent,eol,start
"show invisible char
set list
set listchars=tab:▸\ ,trail:▫
"set auto scroll text
set scrolloff=5
"turn off the auto breakline when over 78 chars
set tw=0
"always show status bar
set laststatus=2
"run cmd at the file dir
set autochdir
"move cursor to last edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set leader key(function key)
let mapleader=' '
"synax highlight
syntax on

"show line number
set number
"show relative number(dely on cur line)
set norelativenumber
"show a line on cur line
set nocursorline
"auto wrap the line
set wrap
"show latest ran cmd
set showcmd
"show cmd list when typing cmd
set wildmenu

"highlight the match word
set hlsearch
"cancel the hlsearch when reopen the file
"exec "nohlsearch"
"show not hole match word
set incsearch
"show search word which is not matched case
set ignorecase
"decide show case search with searching source
set smartcase

"make cursor move faster
noremap J 5j
noremap K 5k
noremap H 7h
noremap L 7l
"cancel hlsearch
noremap <LEADER><CR> :nohlsearch<CR>

"move to line head and tail
noremap <C-h> 0
noremap <C-l> $

"save file
map s <nop>
map S :w<CR>
"quit vim
map Q :q<CR>
"apply vimrc
map R :source $MYVIMRC<CR>
"use cmd
map ; :

"split screen
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
"move in split screens
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
"resize split screen
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"tab ops
map tj :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


"vim-plug*******************************
call plug#begin()

"Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
"The NERDTree is a file system explorer for the Vim editor.
Plug 'preservim/nerdtree'


call plug#end()
"***************************************

"PLUGIN SETTINGS

" ===
" === vim-airline
" ===
"let g:airline_section_b = '%{strftime("%c")}'
"let g_airline_seciton_y = 'BN: %{bufnr("%")}'

" ===
" === nerdtree
" ===
"map tt :NERDTreeToggle<CR>
noremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeHidden = 0

"let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapActiveNode = "i"
"let NERDTreeMapOpenInTab = "o"
"let NERDTreeMapCloseDir = "n"
"let NERDTreeMapChangeRoot = "y"
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapPreview = ""

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
"aautocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif



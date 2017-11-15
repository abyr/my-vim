" .vimrc


" plugins

call plug#begin('~/.vim/plugged')
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'corntrace/bufexplorer'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'marijnh/tern_for_vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ScrollColors'
Plug 'vim-scripts/vimwiki'
Plug 'w0rp/ale'
Plug 'reedes/vim-pencil'
call plug#end()


" settings

set nocompatible

if filereadable(expand("~/.vimrc.before"))
	source ~/.vimrc.before
endif

colorscheme slate

filetype off
filetype plugin indent on
filetype plugin on
syntax on
set ofu=syntaxcomplete#Complete

set noswapfile
set nobackup
set nowb

set nu
set backspace=indent,eol,start
set shortmess=a
set softtabstop=2
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set linebreak
set et
set wrap
set ai
set cin
set ruler
set showmatch
set hlsearch
set incsearch
set nohlsearch
set ignorecase
set lz
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set encoding=utf8
set showcmd
set mouse=a
set mousemodel=popup
set guioptions-=T
set guioptions-=m
set novisualbell

" remove unwanted whitespaces
autocmd BufWritePre * :%s/\s\+$//e

au BufReadPost *.mustache set syntax=html
" Fix <Enter> for comment
set fo+=cr

" status line format
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*

" hotkeys

imap jj <Esc>
imap kk <Esc> :w<cr>
imap kj <Esc> :wq<cr>
nmap kd <Esc> :q!<cr>

nmap <C-h> :bnext<CR>

nmap <C-l> :NERDTreeFind<cr>
nmap <C-i> :ALEToggle<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" nmap <C-i> :SyntasticToggleMode<cr>
" F3 - File browser
nmap <F3> :NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>
" buffers
" F5 - show buffers
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>
" F6 - prev buff
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i
" F7 - next buff
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i
" F9 - exit
set wildmenu
set wcm=<Tab>
menu Exit.quit :quit<CR>
menu Exit.quit! :quit!<CR>
menu Exit.save :exit<CR>
menu Exit.bdelete :bdelete<CR>
menu Exit.bdelete! :bdelete!<CR>
map <F9> :emenu Exit.<Tab>
" switch window
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" resize horzontal split window
nmap <silent> <C-S-Down> <C-W>-<C-W>-
nmap <silent> <C-S-Up> <C-W>+<C-W>+
" resize vertical split window
nmap <silent> <C-S-Left> <C-W>><C-W>>
nmap <silent> <C-S-Right> <C-W><<C-W><


" plugins settings

let g:ale_linters = {'javascript': ['eslint']}

if exists("g:ctrl_user_command")
	unlet g:ctrlp_user_command
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set wildignore+=*.pyc*,*.sql*
set wildignore+=*/node_modules/*
set wildignore+=*js-build/*
set wildignore+=*log*,*.sh*
set wildignore+=*.py*
set wildignore+=*.css*
let g:ctrlp_clear_cache_on_exit=0
set complete=""
set complete+=.
set complete+=k
set complete+=b
set completeopt-=preview
set completeopt+=longest
set suffixesadd+=.js

let g:notes_directories = ['~/Dropbox/Shared Notes']

" TOC
" theming
" plugins
" settings
" hotkeys
" plugins_settings
" vimwiki_settings
" neovim

" theming
" set background=dark
colorscheme PaperColor

" plugins
call plug#begin('~/.vim/plugged')
" local
" Plug '~/Workspace/org-b-foundation/vim-b-syntax-highlighting'
" Plug 'abyr/sline'
" colors
Plug 'vim-scripts/ScrollColors'
Plug 'nlknguyen/papercolor-theme'
" browser
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" ide
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
" langs
Plug 'editorconfig/editorconfig-vim'
Plug 'maksimr/vim-jsbeautify'
" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
" organiser
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-speeddating'
call plug#end()

" settings
set nocompatible

if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
endif

filetype off
filetype plugin indent on
filetype plugin on
syntax on
set ofu=syntaxcomplete#Complete

set noswapfile
set nobackup
set nowb

set nu
set rnu
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
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.html.twig set syntax=html
au BufRead,BufNewFile *.less set syntax=css
" autocmd BufNewFile,BufRead *.b setfiletype b

" Fix <Enter> for comment
set fo+=cr

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" hotkeys
" Ctrl+V to paste the clipboard in normal and insert modes
" Ctrl+c to copy to clipboard in visual mode.
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

nmap <C-P> :FZF<CR>

" Arrow keys remapping
" switch prev/next buffer
noremap <Left> :echo 'Not available. Use h instead'<CR>
noremap <Right> :echo 'Not available. Use l instead'<CR>
noremap <Up> :echo 'Not available. Use k instead'<CR>
noremap <Down> :echo 'Not available. Use j instead'<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" back to normal
imap jj <Esc>
" save and back to normal
imap kk <Esc> :w<cr>

nmap <C-l> :NERDTreeFind<cr>
" F6 <--> F7

" F3 - File browser
nmap <F3> :NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>

" tags
nnoremap <silent> <F4> :TlistToggle<CR>

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

nmap <C-_> :Commentary<CR>
nmap <C-i> :SyntasticToggleMode<CR>

" writing prose
map <F8> :Goyo <bar> :Limelight!! <bar> :TogglePencil <CR>
nmap <C-\> :setlocal spell! <cr>

" F9 - exit
set wildmenu
set wcm=<Tab>
menu Exit.quit :quit<CR>
menu Exit.quit! :quit!<CR>
menu Exit.save :exit<CR>
menu Exit.bdelete :bdelete<CR>
menu Exit.bdelete! :bdelete!<CR>
map <F9> :emenu Exit.<Tab>


" plugins_settings
" autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 40

let g:fzf_command_prefix = 'Fzf'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
set wildignore+=*.pyc*,*.sql*
set wildignore+=*/node_modules/*
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

let g:limelight_conceal_ctermfg = 241

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers=['eslint']

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m   " file:line:column:message
  let g:ackprg = 'ag --vimgrep'
endif

" vimwiki_settings
let g:vimwiki_list = [
	\ {'path': '~/vimwiki/default', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/ofsc', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/business', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/prose', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/pages', 'syntax': 'default', 'ext': 'wiki',
          \ 'template_path': '~/vimwiki/templates/',
          \ 'template_default': 'def_template',
          \ 'template_ext': '.tpl'}]

" let g:vimwiki_folding=""


" neovim
if has('nvim')
    " set termguicolors
endif

"

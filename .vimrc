" .vimrc

"set background=dark
"colorscheme hybrid
set background=light
colorscheme PaperColor

" plugins

call plug#begin('~/.vim/plugged')
" colors
Plug 'vim-scripts/ScrollColors'
Plug 'w0ng/vim-hybrid'
Plug 'nlknguyen/papercolor-theme'
" browser
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'ap/vim-buftabline'
Plug 'ervandew/supertab'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" ide
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-commentary'
" langs
Plug 'editorconfig/editorconfig-vim'
" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
" organiser
Plug 'vimwiki/vimwiki'
call plug#end()

" settings

let use_ale = 0
let use_syntastic = 0

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

" Fix <Enter> for comment
set fo+=cr

" status line format
" http://tdaly.co.uk/projects/vim-statusline-generator/
set laststatus=2

set statusline=                          " left align
set statusline+=%2*\                     " blank char
set statusline+=%2*\%{StatuslineMode()}
set statusline+=%2*\                     " blank char
set statusline+=%1*\ <<
set statusline+=%1*\ %f                  " short filename
set statusline+=%1*\ >>

set statusline+=%1#warningmsg#
set statusline+=%1*

set statusline+=%=                       " right align
set statusline+=%*
set statusline+=%3*\%h%m%r               " file flags (help, read-only, modified)
set statusline+=%4*\%{b:gitbranch}       " include git branch
set statusline+=%3*\%.25F                " long filename (trimmed to 25 chars)
set statusline+=%3*\::
set statusline+=%3*\%l/%L\\|             " line count
set statusline+=%3*\%y                   " file type
set statusline+=%333*\                     " blank char
set statusline+=%P                       " percent of file

hi User1 ctermbg=black ctermfg=grey guibg=black guifg=grey
hi User2 ctermbg=green ctermfg=black guibg=green guifg=black
hi User3 ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  endif
endfunction

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    lcd %:p:h
    let l:gitrevparse=system("git rev-parse --abbrev-ref HEAD")
    lcd -
    if l:gitrevparse!~"fatal: not a git repository"
      let b:gitbranch="(".substitute(l:gitrevparse, '\n', '', 'g').") "
    endif
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END


" hotkeys

imap jj <Esc>
imap kk <Esc> :w<cr>
imap kj <Esc> :wq<cr>
nmap \ff <Esc> :ALEFix<cr>

nmap <C-h> :bnext<CR>
nmap <S-h> :bprevious<CR>
nmap <C-l> :NERDTreeFind<cr>

" F3 - File browser
nmap <F3> :NERDTreeToggle<cr>
imap <F3> <esc>:NERDTreeToggle<cr>


" tags
nnoremap <silent> <F4> :TlistToggle<CR>
" nmap <F8> :TagbarToggle<CR>

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
" switch window
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" resize horizontal split window
nmap <silent> <C-S-Down> <C-W>-<C-W>-
nmap <silent> <C-S-Up> <C-W>+<C-W>+
" resize vertical split window
nmap <silent> <C-S-Left> <C-W>><C-W>>
nmap <silent> <C-S-Right> <C-W><<C-W><


" plugins settings

let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 40

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

let g:vimwiki_list = [
	\ {'path': '~/vimwiki/default', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/ofsc', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/business', 'syntax': 'markdown', 'ext': '.md'},
  \ {'path': '~/vimwiki/prose', 'syntax': 'markdown', 'ext': '.md'}]

" let g:vimwiki_folding=""

"

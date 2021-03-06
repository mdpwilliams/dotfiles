call plug#begin('~/.vim/plugged')
" General
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-lion'
Plug 'scrooloose/nerdtree'
Plug 'wellle/targets.vim'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'keith/investigate.vim'

" Development
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Language
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-liquid'

" Color
Plug '~/.vim/plugged/dracula_pro'
call plug#end()

" get <Del> to work properly
set backspace=indent,eol,start

" Correct scrolling behaviour
if has('mouse')
  set mouse=a
endif

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Custom Settings
set showcmd
set showmatch " Highlight matching [{()}]
set smartindent
set tabstop=2 " Number of visual spaces per tab
set softtabstop=2 " Number of spaces in tab when editting
set shiftwidth=2
set expandtab
set number relativenumber
set clipboard=unnamed " use the system clipboard
set ignorecase
set smartcase
set linebreak " Break lines on words
set breakindent " Indent wrapped lines
set showbreak=↳ " Show ↳ in broken lines
set splitright " Split to the right
set splitbelow " and below the current buffer
set cmdheight=1
set signcolumn=yes
set updatetime=100
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

let mapleader= ","
" map space to forward search and ctrl-space to reverse search
map <space> /
map <C-space> ?

" Custom aliases
nmap <leader>w :w<CR>
nmap <leader><CR> :so ~/.vimrc<CR>

" Clever movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Whitespace on save
function! StripTrailingWhitespace()
  normal mZ
  let l:chars = col("$")
  %s/\s\+$//e
  if (line("'Z") != line(".")) || (l:chars != col("$"))
    echo "Trailing whitespace stripped\n"
  endif
  normal `Z
endfunction

autocmd BufWritePre * call StripTrailingWhitespace()

" signify settings
let g:signify_sign_change = '~'

" coc settings
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Airline settings
let g:airline_theme = 'dracula_pro'
let g:airline_exclude_preview = 0
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" Airline extensions
let g:airline#extensions#tabline#enabled = 0

let g:airline#extensions#branch#format = 2

let g:airline#extensions#coc#enabled = 1
let g:airline_section_b = airline#section#create([ 'hunks' ])
let g:airline_section_c = airline#section#create([ 'file' ])
let g:airline_section_z = airline#section#create([ 'linenr', 'maxlinenr' ])

" Investigate/Dash settings
let g:investigate_use_dash = 1
nnoremap <leader>K :call investigate#Investigate('n')<CR>
vnoremap <leader>K :call investigate#Investigate('v')<CR>

"sn
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" NERDTree settings
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" fzf completion
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_COMMAND='ag -g "" -p ~/.ignore'
let $FZF_DEFAULT_OPTS = '--reverse'

nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Ag<Space>

" emmet settings
" nmap <leader>e :Em:E

" Make sure swap, backup, and undo files don't clutter up my directories
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

" set colour theme
syntax on
set bg=dark
set t_Co=256 " (if needed) use 256-colour setting
set termguicolors
if &term =~ '256color'
    set t_ut=
endif

let g:dracula_colorterm = 0
colorscheme dracula_pro

" set noshowmode
" set noruler

syntax on

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
set hidden

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
set cmdheight=2
set signcolumn=yes
set updatetime=300
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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" tab trigger completion with coc-snippets addition
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" keymaps
" navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)

" codeActions
nmap <leader>ac <Plug>(coc-code-action)
nmap <leader>qf <Plug>(coc-fix-current)

" extensions
let g:coc_global_extensions = [
      \   'coc-tsserver',
      \   'coc-highlight',
      \   'coc-markdownlint',
      \   'coc-git',
      \   'coc-json',
      \   'coc-html',
      \   'coc-css',
      \   'coc-eslint',
      \   'coc-prettier',
      \   'coc-snippets',
      \   'coc-yank',
      \ ]

" Snippet settings
let g:coc_snippet_next = '<tab>'

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
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10

let g:airline#extensions#coc#enabled = 1

let g:airline#extensions#fugitiveline#enabled = 1

let g:airline#extensions#fzf#enabled = 1

" git hunks
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#hunks#coc_git = 1

let g:airline#extensions#nerdtree_statusline = 1

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

let g:airline#extensions#tabline#enabled = 0

" NERDTree settings
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" fzf completion
" installation
" packadd! fzf
" packadd! fzf.vim
" set rtp+=/usr/local/opt/fzf

" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" let $FZF_DEFAULT_COMMAND='ag -g "" -p ~/.ignore'
" let $FZF_DEFAULT_OPTS = '--reverse'

" fzf remaps
" nnoremap <C-p> :Files<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>f :Ag

" telescope remaps
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope grep_string<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" vim-fugitive settings
nnoremap <leader>g :Git

" Make sure swap, backup, and undo files don't clutter up my directories
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

" set colour theme
" set t_Co=256 " (if needed) use 256-colour setting
set termguicolors " Not sure if needed I think this is what's causing issue with syntax
set bg=dark

packadd! dracula_pro

let g:dracula_colorterm = 0
let g:dracula_italic = 1
let g:dracula_bold = 1
colorscheme dracula_pro

set noshowmode
set noruler

" indent character showcase
set list
set lcs=tab:»_,trail:·

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Modify airline after section modification
let g:airline_section_y = airline#section#create_right([])
let g:airline_section_z = airline#section#create_right([])

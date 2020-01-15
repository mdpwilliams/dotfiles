set nocompatible
filetype off
set foldlevel=-1
set foldmethod=syntax
set nofoldenable

set runtimepath+=~/.vim_runtime

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Colour
Plugin 'reedes/vim-colors-pencil'

" General
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tommcdo/vim-lion'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Development
Plugin 'mattn/emmet-vim'

" Language
Plugin 'dense-analysis/ale'

call vundle#end()
filetype plugin indent on
syntax enable

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
" source ~/.vim_runtime/vimrcs/extended.vim

" get <Del> to work properly
set backspace=indent,eol,start

" Correct scrolling behaviour
if has('mouse')
  set mouse=a
endif

" get <c-p> to work for CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" enable for extensions
let g:ctrlp_extensions=['tag', 'buffertag']

" get CtrlP to take advantage of ag's ignore
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.DS_Store|\.git$\|\.hg$\|\.svn$|node_modules'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']
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
set signcolumn=yes

" Gitgutter settings
let g:gitgutter_git_executable='/usr/local/bin/git'
let g:gitgutter_diff_args="-w" " Tell gitgutter to ignore whitespace differences
set updatetime=250

" Airline settings
let g:airline_theme = 'dark'
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Lion (Alignment) Settings
let g:lion_squeeze_spaces = 1 

" NERDTree settings
nmap <leader>e :NERDTreeToggleVCS<cr>

" emmet settings
" nmap <leader>

" ctags setup
set tags=tags
nnoremap <leader>r :CtrlPBufTag<cr>
nnoremap <leader>t :CtrlPTag<cr>

" Make sure swap, backup, and undo files don't clutter up my directories
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

" set colour theme
set t_Co=256 " (if needed) use 256-colour setting
set background=dark
colorscheme pencil

set noshowmode
set noruler

set nocompatible
filetype off

set runtimepath+=~/.vim_runtime

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'dracula/vim'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on
syntax enable

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" Set Hotkey for NERDTree
map <silent> <C-n> :NERDTree<CR>

" get <Del> to work properly
set backspace=indent,eol,start

" get <c-p> to work for CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
" get CtrlP to take advantage of ag's ignore
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.DS_Store|\.git$\|\.hg$\|\.svn$|node_modules'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Custom Settings
set cursorline " Highlight current line
set showcmd
set showmatch " Highlight matching [{()}]
set smartindent
set tabstop=2 " Number of visual spaces per tab
set softtabstop=2 " Number of spaces in tab when editting
set shiftwidth=2
set expandtab
set number relativenumber
set clipboard=unnamed " use the system clipboard

" Airline settings
let g:airline_left_sep = ' Δ '
let g:airline_right_sep = ' ♠ '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''

" update time for git-gutter
set updatetime=250

" set Colour Scheme
color dracula

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set noshowmode
set noruler

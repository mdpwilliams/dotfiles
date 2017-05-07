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
Plugin 'bling/vim-airline'
Plugin 'valloric/youcompleteme'

call vundle#end()
filetype plugin indent on
syntax enable

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

" get <Del> to work properly
set backspace=indent,eol,start

set tabstop=2
set shiftwidth=2
set expandtab
set number

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

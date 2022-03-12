let mapleader= ","

" map space to forward search and ctrl-space to reverse search
map <space> / " FIXME: how often is this used?
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



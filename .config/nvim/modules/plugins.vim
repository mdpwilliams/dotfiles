lua require('plugins')

" LSP config
set completeopt=menu,menuone,noselect

" set shortmess+=c

" nvim-tree settings
map <leader>nn :NvimTreeToggle<cr>
map <leader>nf :NvimTreeFindFile<cr>

" telescope.nvim settings
" remaps
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>Telescope grep_string<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" vim-fugitive settings
nnoremap <leader>g :Git


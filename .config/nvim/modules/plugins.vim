lua require('plugins')

" LSP config
set completeopt=menu,menuone,noselect

" coc.nvim settings
" extensions
" let g:coc_global_extensions = [
"       \   'coc-tsserver',
"       \   'coc-json',
"       \   'coc-html',
"       \   'coc-css',
"       \   'coc-eslint',
"       \   'coc-prettier',
"       \   'coc-snippets',
"       \   'coc-yank',
"       \ ]

" coc-snippets settings
" let g:coc_snippet_next = '<tab>'

set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" tab trigger completion with coc-snippets addition
" inoremap <silent><expr> <Tab>
"   \ pumvisible() ? coc#_select_confirm() :
"   \ coc#expandableOrJumpable() ? "\<C-r>coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
"   \ <SID>check_back_space() ? "\<Tab>" :
"   \ coc#refresh()
" inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" keymaps
" navigation
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-reference)

" codeActions
" nmap <leader>ac <Plug>(coc-code-action)
" nmap <leader>qf <Plug>(coc-fix-current)

" vim-airline settings
" let g:airline_theme = 'dracula_pro'
" let g:airline_exclude_preview = 0
" let g:airline_mode_map = {
"     \ '__'     : '-',
"     \ 'c'      : 'C',
"     \ 'i'      : 'I',
"     \ 'ic'     : 'I',
"     \ 'ix'     : 'I',
"     \ 'n'      : 'N',
"     \ 'multi'  : 'M',
"     \ 'ni'     : 'N',
"     \ 'no'     : 'N',
"     \ 'R'      : 'R',
"     \ 'Rv'     : 'R',
"     \ 's'      : 'S',
"     \ 'S'      : 'S',
"     \ ''     : 'S',
"     \ 't'      : 'T',
"     \ 'v'      : 'V',
"     \ 'V'      : 'V',
"     \ ''     : 'V',
"     \ }

" " Airline extensions
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#branch#displayed_head_limit = 10

" let g:airline#extensions#coc#enabled = 1

" let g:airline#extensions#fugitiveline#enabled = 1

" let g:airline#extensions#fzf#enabled = 1

" git hunks
" let g:airline#extensions#hunks#enabled = 1
" let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
" let g:airline#extensions#hunks#coc_git = 1

" let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

" let g:airline#extensions#tabline#enabled = 0

" " Modify airline after section modification
" let g:airline_section_y = airline#section#create_right([])
" let g:airline_section_z = airline#section#create_right([])

" nvim-tree settings
let g:nvim_tree_show_icons = {
      \ 'git': 0,
      \ 'folders': 1,
      \ 'files': 1,
      \ 'folder_arrows': 0,
      \ }
map <leader>nn :NvimTreeToggle<cr>
map <leader>nf :NvimTreeFindFile<cr>

" telescope.nvim settings
" remaps
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope grep_string<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gs <cmd>Telescope git_status<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" vim-fugitive settings
nnoremap <leader>g :Git


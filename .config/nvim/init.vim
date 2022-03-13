" set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after
" let &packpath=&runtimepath
" source $HOME/.vimrc

" Custom settings
set showmatch " Show matching brackets
set tabstop=2 " Number of spaces per tab
set softtabstop=2 " Number of spaces per tab when editting
set shiftwidth=2 " Number of spaces per tab when shifting
set expandtab " Expand tabs to spaces
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
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k

set noshowmode
set noruler

" indent character showcase
set list
set lcs=tab:»_,trail:·

source $HOME/.config/nvim/modules/keybindings.vim

source $HOME/.config/nvim/modules/colours.vim

source $HOME/.config/nvim/modules/plugins.vim

" Correct scrolling behaviour
if has('mouse')
  set mouse=a
endif

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


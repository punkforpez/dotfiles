" Appearance
set background=dark
syntax on
set t_Co=256
set filetype=on
set wildmenu		" Show autocomplete
set number

" | set number relativenumber
" set cursorline
set ruler
set tabstop=4
set nobackup
set showmatch		" Show matching brackets
set hlsearch		" Highlight search results
set mouse-=a

" gruvbox colors
" source ~/.vim/gruvbox.vim
"

" Enable Lua Highlighting
if has("autocmd")
  augroup lua_ft
    autocmd!
    autocmd BufRead,BufNewFile *.lua set filetype=lua
  augroup END
endif

" Everforest colors
""source ~/.vim/colors/everforest.vim
source ~/.vim/colors/gruvbox.vim

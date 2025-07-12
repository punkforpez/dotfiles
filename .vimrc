" Appearance
set background=dark
syntax on
set t_Co=256
set filetype=on
set wildmenu		" Show autocomplete
set number

""set number relativenumber
set cursorline
set ruler
set tabstop=4
set nobackup
set showmatch		" Show matching brackets
set hlsearch		" Highlight search results
set mouse-=a
set hidden

" Aliases
map <M-h> :bnext<CR>  " Next buffer
map <M-l> :bprev<CR>  " Previous Buffer

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Enable Lua Highlighting
if has("autocmd")
  augroup lua_ft
    autocmd!
    autocmd BufRead,BufNewFile *.lua set filetype=lua
  augroup END
endif

" Colors
""source ~/.vim/colors/everforest.vim
source ~/.vim/colors/gruvbox.vim
